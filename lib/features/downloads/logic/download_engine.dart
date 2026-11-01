import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
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
    TrackTransfer? trackTransfer,
  }) : _trackTransfer = trackTransfer ?? TrackTransfer(transport: transport);

  final DownloadTransport transport;
  final AccessTokenResolver accessToken;
  final StorageServiceResolver storageService;
  final CoverDownloader coverDownloader;
  final TrackTransfer _trackTransfer;

  final Map<String, _ActiveDownload> _active = <String, _ActiveDownload>{};
  final Map<String, DownloadCancelToken> _coverTokens =
      <String, DownloadCancelToken>{};

  Stream<DownloadItem> downloadItem({
    required DownloadItem item,
    required UserDomain user,
  }) async* {
    final active = _ActiveDownload(libraryItemId: item.libraryItemId);
    _active[item.key] = active;

    final token = await accessToken(user.id);
    if (token == null) {
      _active.remove(item.key);
      yield item.copyWith(status: .failed);
      return;
    }

    var current = item.copyWith(status: .downloading);
    yield current;

    await _downloadCover(item, active);

    if (active.cancelled) {
      _active.remove(item.key);
      yield current.copyWith(status: .paused);
      return;
    }

    final service = storageService(item);
    if (service == null) {
      _active.remove(item.key);
      yield current.copyWith(status: .failed);
      return;
    }

    for (var i = 0; i < current.tracks.length; i++) {
      final initialTrack = current.tracks[i];
      if (initialTrack.status == .completed) continue;

      final trackToken = DownloadCancelToken();
      active.trackToken = trackToken;

      await for (final event in _trackTransfer.transfer(
        track: initialTrack,
        url: user.serverUrl.resolve(
          ApiRoutes.itemAudioFileDownload(item.libraryItemId, initialTrack.ino),
        ),
        accessToken: token,
        service: service,
        relativePath: item.relativePath,
        cancelToken: trackToken,
        isCancelled: () => active.cancelled,
      )) {
        switch (event) {
          case TrackProgress(:final bytesReceived):
            current = _trackSnapshot(
              current,
              i,
              status: .downloading,
              bytesReceived: bytesReceived,
            );
            yield current;
          case TrackOutcome(:final status, :final bytesReceived):
            current = _trackSnapshot(
              current,
              i,
              status: status == .completed ? .completed : .downloading,
              bytesReceived: bytesReceived,
            );
            if (status != .completed) {
              _active.remove(item.key);
              yield current.copyWith(status: status);
              return;
            }
            yield current;
        }
      }
    }

    _active.remove(item.key);
    if (active.cancelled) {
      yield current.copyWith(status: .paused);
      return;
    }
    yield current.copyWith(status: .completed);
  }

  void cancel(String key) {
    final active = _active[key];
    if (active == null) return;
    active.cancelled = true;
    active.trackToken?.cancel();
    _coverTokens[active.libraryItemId]?.cancel();
  }

  Future<void> _downloadCover(DownloadItem item, _ActiveDownload active) async {
    final coverToken = DownloadCancelToken();
    _coverTokens[item.libraryItemId] = coverToken;

    try {
      await coverDownloader(
        libraryItemId: item.libraryItemId,
        isPodcast: item.episodeId != null,
        cancelToken: coverToken,
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
    } finally {
      if (identical(_coverTokens[item.libraryItemId], coverToken)) {
        _coverTokens.remove(item.libraryItemId);
      }
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

class _ActiveDownload {
  new({required this.libraryItemId});

  final String libraryItemId;
  bool cancelled = false;
  DownloadCancelToken? trackToken;
}

@Riverpod(keepAlive: true)
DownloadEngine downloadEngine(Ref ref) {
  return DownloadEngine(
    transport: ref.watch(downloadTransportProvider),
    accessToken: (userId) => ref.read(tokenProvider).getAccessToken(userId),
    storageService: (item) => ref.read(storageServiceForItemProvider(item)),
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
