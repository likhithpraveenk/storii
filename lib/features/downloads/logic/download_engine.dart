import 'dart:developer';

import 'package:abs_api/abs_api.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/features/downloads/logic/downloads_filesystem_helper.dart';
import 'package:storii/features/downloads/models/download_item.dart';

part 'download_engine.g.dart';

@Riverpod(keepAlive: true)
class DownloadEngine extends _$DownloadEngine {
  late final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(minutes: 10),
    ),
  );
  DownloadsFilesystemHelper get _filesystem =>
      ref.read(downloadsFsHelperProvider);
  final Map<String, CancelToken> _coverTokens = {};
  final Map<String, Map<int, CancelToken>> _tokens = {};

  @override
  void build() {}

  Stream<DownloadItem> downloadItem({
    required DownloadItem item,
    required UserDomain user,
  }) async* {
    final token = await ref.read(tokenProvider).getAccessToken(user.id);
    if (token == null) {
      yield item.copyWith(status: .failed);
      return;
    }

    final trackTokens = <int, CancelToken>{};
    _tokens[item.libraryItemId] = trackTokens;

    var current = item.copyWith(status: .downloading);
    yield current;

    final coverToken = CancelToken();
    _coverTokens[item.libraryItemId] = coverToken;
    await _downloadCover(
      itemTitle: item.title,
      itemId: item.libraryItemId,
      user: user,
      cancelToken: coverToken,
    );
    _coverTokens.remove(item.libraryItemId);

    for (int i = 0; i < current.tracks.length; i++) {
      final initialTrack = current.tracks[i];
      if (initialTrack.status == .completed) continue;

      final cancelToken = CancelToken();
      trackTokens[i] = cancelToken;

      final existingBytes = await _filesystem.existingBytes(
        initialTrack.localPath,
      );

      final sink = await _filesystem.openAppendSink(initialTrack.localPath);

      try {
        final url = user.serverUrl
            .resolve(
              ApiRoutes.itemAudioFileDownload(
                item.libraryItemId,
                initialTrack.ino,
              ),
            )
            .toString();

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

        if (res.data == null) {
          throw StateError(
            'No response body for track ${initialTrack.audioTrack.index} of item ${item.title}',
          );
        }

        var received = existingBytes;
        await for (final chunk in res.data!.stream) {
          received += chunk.length;
          sink.add(chunk);

          final updatedTracks = [...current.tracks];
          updatedTracks[i] = current.tracks[i].copyWith(
            status: .downloading,
            bytesReceived: received,
          );
          current = current.copyWith(tracks: updatedTracks);
          yield current;
        }

        await sink.close();

        final updatedTracks = [...current.tracks];
        updatedTracks[i] = current.tracks[i].copyWith(status: .completed);
        current = current.copyWith(tracks: updatedTracks);
        yield current;
      } on DioException catch (e) {
        LogService.log('download engine dio error: $e');
        await sink.close();
        if (CancelToken.isCancel(e)) {
          _tokens.remove(item.libraryItemId);
          yield current.copyWith(status: .paused);
          return;
        }

        _tokens.remove(item.libraryItemId);
        yield current.copyWith(status: .failed);
        return;
      } catch (e) {
        LogService.log('download engine error: $e');
        await sink.close();
        _tokens.remove(item.libraryItemId);
        yield current.copyWith(status: .failed);
        return;
      }
    }

    _tokens.remove(item.libraryItemId);
    yield current.copyWith(status: .completed);
  }

  Future<void> _downloadCover({
    required UserDomain user,
    required String itemTitle,
    required String itemId,
    required CancelToken cancelToken,
  }) async {
    try {
      final imageBytes = await ref
          .read(itemApiProvider(user))
          .getCover(libraryItemId: itemId, cancelToken: cancelToken);
      if (imageBytes != null) {
        await _filesystem.saveCover(itemTitle, imageBytes);
      }
    } catch (e) {
      log('$e', name: 'downloadCover');
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
}
