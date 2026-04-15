import 'dart:io';

import 'package:dio/dio.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/features/downloads/logic/downloads_filesystem_helper.dart';
import 'package:storii/features/downloads/models/download_item.dart';

typedef ProgressCallback = void Function(int received, int total);

class DownloadEngine {
  DownloadEngine({Dio? dio, DownloadsFilesystemHelper? fs})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              connectTimeout: const Duration(seconds: 30),
              receiveTimeout: const Duration(minutes: 10),
            ),
          ),
      _filesystem = fs ?? DownloadsFilesystemHelper();

  final Dio _dio;
  final DownloadsFilesystemHelper _filesystem;
  final Map<String, Map<int, CancelToken>> _tokens = {};

  Stream<DownloadItem> downloadItem({
    required DownloadItem item,
    required Uri serverUrl,
    required String token,
  }) async* {
    final trackTokens = <int, CancelToken>{};
    _tokens[item.libraryItemId] = trackTokens;

    var current = item.copyWith(status: .downloading);
    yield current;

    await downloadCover(
      itemTitle: item.title,
      itemId: item.libraryItemId,
      serverUrl: serverUrl,
      cancelToken: CancelToken(),
    );

    for (int i = 0; i < current.tracks.length; i++) {
      final track = current.tracks[i];
      if (track.status == .completed) continue;

      final cancelToken = CancelToken();
      trackTokens[i] = cancelToken;

      final file = File(track.localPath);
      final exists = await file.exists();
      final existingBytes = exists ? await file.length() : 0;

      try {
        final url = serverUrl.resolve(track.audioTrack.contentUrl).toString();

        final res = await _dio.get<ResponseBody>(
          url,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              if (existingBytes > 0) 'Range': 'bytes=$existingBytes-',
            },
            responseType: ResponseType.stream,
          ),
          cancelToken: cancelToken,
        );

        final sink = file.openWrite(mode: FileMode.append);

        int received = existingBytes;
        final total = existingBytes + res.data!.contentLength;

        await for (final chunk in res.data!.stream) {
          received += chunk.length;
          sink.add(chunk);

          final updatedTracks = [...current.tracks];
          updatedTracks[i] = track.copyWith(
            status: .downloading,
            bytesReceived: received,
          );

          current = current.copyWith(
            tracks: updatedTracks,
            receivedBytes: _sumReceived(updatedTracks),
            totalBytes: _sumTotal(updatedTracks),
          );

          yield current;
        }

        await sink.close();

        final updatedTracks = [...current.tracks];
        updatedTracks[i] = track.copyWith(
          status: .completed,
          bytesReceived: total,
        );

        current = current.copyWith(
          tracks: updatedTracks,
          receivedBytes: _sumReceived(updatedTracks),
          totalBytes: _sumTotal(updatedTracks),
        );

        yield current;
      } on DioException catch (e) {
        if (CancelToken.isCancel(e)) {
          yield current.copyWith(status: DownloadStatus.paused);
          return;
        }

        yield current.copyWith(status: DownloadStatus.failed);
        return;
      }
    }

    _tokens.remove(item.libraryItemId);
    yield current.copyWith(status: DownloadStatus.completed);
  }

  Future<void> downloadCover({
    required String itemTitle,
    required String itemId,
    required Uri serverUrl,
    required CancelToken cancelToken,
  }) async {
    try {
      final coverPath = await _filesystem.coverPath(itemTitle);
      final coverExist = await _filesystem.fileIntact(coverPath);
      if (!coverExist) {
        final coverUrl = serverUrl
            .resolve(ApiRoutes.itemCover(itemId))
            .replace(queryParameters: {'raw': '1'})
            .toString();
        await _dio.download(coverUrl, coverPath, cancelToken: cancelToken);
      }
    } catch (_) {} // cover optional
  }

  void pause(String itemId) {
    final map = _tokens[itemId];
    if (map == null) return;
    for (final t in map.values) {
      t.cancel('paused');
    }
  }

  void cancel(String itemId) {
    final map = _tokens[itemId];
    if (map == null) return;
    for (final t in map.values) {
      t.cancel('cancelled');
    }
    _tokens.remove(itemId);
  }

  bool isDownloading(String libraryItemId) =>
      _tokens.containsKey(libraryItemId);

  int _sumReceived(List<DownloadTrack> tracks) =>
      tracks.fold(0, (s, t) => s + t.bytesReceived);

  int _sumTotal(List<DownloadTrack> tracks) =>
      tracks.fold(0, (s, t) => s + t.bytesTotal);
}
