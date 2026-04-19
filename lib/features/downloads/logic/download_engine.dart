import 'dart:developer';

import 'package:abs_api/abs_api.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/features/downloads/logic/downloads_filesystem_helper.dart';
import 'package:storii/features/downloads/models/download_item.dart';

part 'download_engine.g.dart';

@Riverpod(keepAlive: true)
DownloadEngine downloadEngine(Ref ref) => DownloadEngine(
  Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(minutes: 10),
    ),
  ),
  ref.watch(downloadsFsHelperProvider),
);

class DownloadEngine {
  DownloadEngine(this._dio, this._filesystem);

  final Dio _dio;
  final DownloadsFilesystemHelper _filesystem;
  final Map<String, CancelToken> _coverTokens = {};
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

    final coverToken = CancelToken();
    _coverTokens[item.libraryItemId] = coverToken;
    final coverBytes = await downloadCover(
      itemTitle: item.title,
      itemId: item.libraryItemId,
      serverUrl: serverUrl,
      cancelToken: coverToken,
    );
    _coverTokens.remove(item.libraryItemId);

    current = current.copyWith(
      receivedBytes: _sumReceived(current.tracks) + coverBytes,
    );
    yield current;

    for (int i = 0; i < current.tracks.length; i++) {
      final track = current.tracks[i];
      if (track.status == .completed) continue;

      final cancelToken = CancelToken();
      trackTokens[i] = cancelToken;

      final existingBytes = await _filesystem.existingBytes(track.localPath);

      final sink = await _filesystem.openAppendSink(track.localPath);

      try {
        final url = serverUrl.resolve(track.audioTrack.contentUrl).toString();

        final res = await _dio.get<ResponseBody>(
          url,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              if (existingBytes > 0) 'Range': 'bytes=$existingBytes-',
            },
            responseType: .stream,
          ),
          cancelToken: cancelToken,
        );

        var received = existingBytes;

        final isPartialContent = res.statusCode == 206;
        if (!isPartialContent && existingBytes > 0) {
          await sink.close();
          await _filesystem.truncate(track.localPath);
          received = 0;
        }

        final rawContentLength = res.data!.contentLength;
        final knownTotal = rawContentLength > 0
            ? (isPartialContent
                  ? existingBytes + rawContentLength
                  : rawContentLength)
            : track.bytesTotal;

        await for (final chunk in res.data!.stream) {
          received += chunk.length;
          sink.add(chunk);

          final updatedTracks = [...current.tracks];
          updatedTracks[i] = track.copyWith(
            status: .downloading,
            bytesReceived: received.toInt(),
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
          bytesReceived: knownTotal > 0 ? knownTotal : received.toInt(),
        );

        current = current.copyWith(
          tracks: updatedTracks,
          receivedBytes: _sumReceived(updatedTracks),
          totalBytes: _sumTotal(updatedTracks),
        );

        yield current;
      } on DioException catch (e) {
        log('download engine dio error: $e');
        await sink.close();
        if (CancelToken.isCancel(e)) {
          final reason = e.message ?? '';
          final status = reason == 'cancelled'
              ? DownloadStatus.cancelled
              : DownloadStatus.paused;
          _tokens.remove(item.libraryItemId);
          yield current.copyWith(status: status);
          return;
        }

        _tokens.remove(item.libraryItemId);
        yield current.copyWith(status: .failed);
        return;
      } catch (e) {
        log('download engine error: $e');
        await sink.close();
        _tokens.remove(item.libraryItemId);
        yield current.copyWith(status: .failed);
        return;
      }
    }

    _tokens.remove(item.libraryItemId);
    yield current.copyWith(status: .completed);
  }

  Future<int> downloadCover({
    required String itemTitle,
    required String itemId,
    required Uri serverUrl,
    required CancelToken cancelToken,
  }) async {
    try {
      final coverPath = await _filesystem.coverPath(itemTitle);
      if (await _filesystem.fileIntact(coverPath)) {
        return await _filesystem.fileSize(coverPath);
      }
      final coverUrl = serverUrl
          .resolve(ApiRoutes.itemCover(itemId))
          .replace(queryParameters: {'raw': '1'})
          .toString();
      final response = await _dio.download(
        coverUrl,
        coverPath,
        cancelToken: cancelToken,
      );
      final size =
          int.tryParse(response.headers.value('content-length') ?? '0') ?? 0;
      return size;
    } catch (_) {
      return 0;
    }
  }

  void pause(String itemId) {
    _coverTokens[itemId]?.cancel('paused');
    final map = _tokens[itemId];
    if (map == null) return;
    for (final t in map.values) {
      t.cancel('paused');
    }
  }

  void cancel(String itemId) {
    _coverTokens[itemId]?.cancel('cancelled');
    _coverTokens.remove(itemId);
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
