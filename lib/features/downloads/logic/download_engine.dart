import 'package:abs_api/abs_api.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/features/downloads/logic/downloads_filesystem_helper.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

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
    _tokens[item.key] = trackTokens;

    var current = item.copyWith(status: .downloading);
    yield current;

    final coverToken = CancelToken();
    _coverTokens[item.libraryItemId] = coverToken;
    await _downloadCover(
      libraryItemId: item.libraryItemId,
      isPodcast: item.episodeId != null,
      user: user,
      cancelToken: coverToken,
    );
    _coverTokens.remove(item.libraryItemId);

    for (int i = 0; i < current.tracks.length; i++) {
      final initialTrack = current.tracks[i];
      if (initialTrack.status == .completed) continue;

      bool success = false;
      for (int attempt = 0; attempt <= 3; attempt++) {
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

            if (!_tokens.containsKey(item.key)) {
              await sink.close();
              yield current.copyWith(status: .paused);
              return;
            }
          }

          await sink.close();

          final updatedTracks = [...current.tracks];
          updatedTracks[i] = current.tracks[i].copyWith(status: .completed);
          current = current.copyWith(tracks: updatedTracks);
          yield current;
          success = true;
          break;
        } on DioException catch (e, st) {
          await sink.close();
          if (CancelToken.isCancel(e) || attempt == 3) {
            final error = AppError.from(e, st);
            LogService.log(
              error.message,
              source: 'DownloadEngine',
              level: .error,
              originalError: error.originalError,
              stackTrace: error.stackTrace,
            );
            if (CancelToken.isCancel(e)) {
              _tokens.remove(item.key);
              yield current.copyWith(status: .paused);
              return;
            }
            _tokens.remove(item.key);
            yield current.copyWith(status: .failed);
            return;
          }
          LogService.log(
            'Track retry $attempt for ${initialTrack.ino}',
            source: 'DownloadEngine',
          );
          await Future.delayed(
            Duration(milliseconds: [500, 1000, 2000][attempt]),
          );
        } catch (e, st) {
          await sink.close();
          final error = AppError.from(e, st);
          LogService.log(
            error.message,
            source: 'DownloadEngine',
            level: .error,
            originalError: error.originalError,
            stackTrace: error.stackTrace,
          );
          _tokens.remove(item.key);
          yield current.copyWith(status: .failed);
          return;
        }
      }
      if (!success) {
        _tokens.remove(item.key);
        yield current.copyWith(status: .failed);
        return;
      }
    }

    _tokens.remove(item.key);
    yield current.copyWith(status: .completed);
  }

  Future<void> _downloadCover({
    required UserDomain user,
    required String libraryItemId,
    required bool isPodcast,
    required CancelToken cancelToken,
  }) async {
    try {
      final imageBytes = await ref.logApiCall(
        () => ref
            .read(itemApiProvider(user))
            .getCover(libraryItemId: libraryItemId, cancelToken: cancelToken),
        source: 'DownloadEngine',
        logMessage: 'Failed to download cover for $libraryItemId',
      );
      if (imageBytes != null) {
        if (isPodcast) {
          await _filesystem.savePodcastCover(libraryItemId, imageBytes);
        } else {
          await _filesystem.saveAudiobookCover(libraryItemId, imageBytes);
        }
      }
    } on AppError catch (_) {}
  }

  void cancel(String key) {
    _coverTokens[key]?.cancel('cancelled');
    _coverTokens.remove(key);
    final map = _tokens.remove(key);
    if (map == null) return;
    for (final t in map.values) {
      t.cancel('cancelled');
    }
  }
}
