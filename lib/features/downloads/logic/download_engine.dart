import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/features/downloads/logic/cover_helper.dart';
import 'package:storii/features/downloads/logic/download_track_transfer.dart';
import 'package:storii/features/downloads/logic/download_transport.dart';
import 'package:storii/features/downloads/logic/storage_service.dart';
import 'package:storii/features/downloads/logic/storage_service_provider.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'download_engine.g.dart';

typedef AccessTokenResolver = Future<String?> Function(String userId);
typedef StorageServiceResolver = StorageService? Function(DownloadItem item);
typedef ServerUrlResolver = Uri Function();
typedef CoverDownloader = Future<void> Function({
  required String libraryItemId,
  required bool isPodcast,
  required DownloadCancelToken cancelToken,
});

class DownloadEngine {
  new({
    required this.transport,
    required this.accessToken,
    required this.storageService,
    required this.coverDownloader,
    required this.activeServerUrl,
    TrackTransfer? trackTransfer,
  }) : _trackTransfer = trackTransfer ?? TrackTransfer(transport: transport);

  final DownloadTransport transport;
  final AccessTokenResolver accessToken;
  final StorageServiceResolver storageService;
  final CoverDownloader coverDownloader;
  final ServerUrlResolver activeServerUrl;
  final TrackTransfer _trackTransfer;

  final _active = <String, DownloadCancelToken>{};

  Future<DownloadItem> download({
    required DownloadItem item,
    required UserDomain user,
    required Future<void> Function(DownloadItem item) onProgress,
  }) async {
    final cancelToken = DownloadCancelToken();
    _active[item.key] = cancelToken;

    var current = item;

    Future<DownloadItem> terminate(DownloadStatus status) async {
      _finish(item.key, cancelToken);
      final terminal = current.copyWith(status: status);
      await onProgress(terminal);
      return terminal;
    }

    final token = await accessToken(user.id);
    if (token == null) {
      return terminate(.failed);
    }

    current = current.copyWith(status: .downloading);
    await onProgress(current);

    await _downloadCover(item, cancelToken);

    if (cancelToken.isCancelled) {
      return terminate(.paused);
    }

    final service = storageService(item);
    if (service == null) {
      return terminate(.failed);
    }

    final serverUrl = activeServerUrl();
    for (var i = 0; i < current.tracks.length; i++) {
      final track = current.tracks[i];
      if (track.status == .completed) continue;

      final result = await _trackTransfer.transfer(
        track: track,
        url: serverUrl.resolve(
          ApiRoutes.itemAudioFileDownload(item.libraryItemId, track.ino),
        ),
        accessToken: token,
        service: service,
        relativePath: item.relativePath,
        cancelToken: cancelToken,
        onProgress: (bytesReceived) async {
          current = _trackSnapshot(
            current,
            i,
            status: .downloading,
            bytesReceived: bytesReceived,
          );
          await onProgress(current);
        },
      );

      current = _trackSnapshot(
        current,
        i,
        status: result.status == .completed ? .completed : .downloading,
        bytesReceived: result.bytesReceived,
      );

      if (result.status != .completed) {
        return terminate(result.status);
      }

      await onProgress(current);
    }

    return terminate(cancelToken.isCancelled ? .paused : .completed);
  }

  void cancel(String key) {
    _active[key]?.cancel();
  }

  void _finish(String key, DownloadCancelToken cancelToken) {
    if (identical(_active[key], cancelToken)) _active.remove(key);
  }

  Future<void> _downloadCover(
    DownloadItem item,
    DownloadCancelToken cancelToken,
  ) async {
    try {
      await coverDownloader(
        libraryItemId: item.libraryItemId,
        isPodcast: item.episodeId != null,
        cancelToken: cancelToken,
      );
    } catch (e, st) {
      final error = AppError.from(e, st);
      LogService.log(
        'Cover download failed for ${item.libraryItemId}: ${error.message}',
        source: 'DownloadEngine',
        level: .warning,
        originalError: error.originalError,
        stackTrace: error.stackTrace,
      );
    }
  }

  DownloadItem _trackSnapshot(
    DownloadItem item,
    int index, {
    required DownloadStatus status,
    required int bytesReceived,
  }) {
    final tracks = [...item.tracks];
    tracks[index] = item.tracks[index].copyWith(
      status: status,
      bytesReceived: bytesReceived,
    );
    return item.copyWith(tracks: tracks);
  }
}

@Riverpod(keepAlive: true)
DownloadEngine downloadEngine(Ref ref) {
  return DownloadEngine(
    transport: ref.watch(downloadTransportProvider),
    accessToken: (userId) => ref.read(tokenProvider).getAccessToken(userId),
    storageService: (item) => ref.read(storageServiceForItemProvider(item)),
    activeServerUrl: () => ref.read(activeServerUrlProvider),
    coverDownloader:
        ({required libraryItemId, required isPodcast, required cancelToken}) =>
            _downloadCover(
              ref,
              libraryItemId: libraryItemId,
              isPodcast: isPodcast,
              cancelToken: cancelToken,
            ),
  );
}

Future<void> _downloadCover(
  Ref ref, {
  required String libraryItemId,
  required bool isPodcast,
  required DownloadCancelToken cancelToken,
}) async {
  final user = await ref.read(authenticatedUserProvider.future);
  final repo = ref.read(itemRepositoryProvider(user));
  final dioToken = CancelToken();
  cancelToken.onCancel(() => dioToken.cancel('cancelled'));

  final imageBytes = await repo.getCover(libraryItemId, cancelToken: dioToken);
  if (imageBytes == null) return;

  final coverHelper = ref.read(coverHelperProvider);
  await coverHelper.saveCover(
    libraryItemId,
    data: imageBytes,
    isPodcast: isPodcast,
  );
}
