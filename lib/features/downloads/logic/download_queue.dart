import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/storage_location.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/download_engine.dart';
import 'package:storii/features/downloads/logic/download_extensions.dart';
import 'package:storii/features/downloads/logic/download_queue_processor.dart';
import 'package:storii/features/downloads/logic/download_task.dart';
import 'package:storii/features/downloads/logic/downloads_notification_service.dart';
import 'package:storii/features/downloads/logic/storage_service_provider.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/local/downloads_store.dart';
import 'package:storii/storage/local/items_cache.dart';

part 'download_queue.g.dart';

@Riverpod(keepAlive: true)
class DownloadQueue extends _$DownloadQueue {
  DownloadsStore get _store => ref.read(downloadsStoreProvider);

  DownloadsNotifications get _notifications =>
      ref.read(downloadsNotificationsProvider);

  DownloadEngine get _engine => ref.read(downloadEngineProvider);

  late final DownloadQueueProcessor _processor = DownloadQueueProcessor(
    readKeys: () => state,
    removeKey: (key) => state = state.where((i) => i != key).toList(),
    store: _store,
    canStart: _networkAllows,
    runItem: _runItem,
    maxConcurrent: () => ref.read(parallelDownloadsProvider),
  );

  @override
  List<String> build() {
    final downloads = _store.getAll();
    final active = downloads.values.where((item) => item.isActive).toList()
      ..sort(
        (a, b) => (a.startedAt ?? DateTime.now()).compareTo(
          b.startedAt ?? DateTime.now(),
        ),
      );

    final keys = active.map((item) => item.key).toList();
    if (keys.isNotEmpty) {
      Future.microtask(_processQueue);
    }

    ref.listen(connectionTypeProvider, (_, _) {
      if (state.isNotEmpty) {
        _processQueue();
      }
    });

    return keys;
  }

  Future<void> enqueue({
    required String libraryItemId,
    String? episodeId,
    required StorageLocation location,
  }) async {
    final key = mediaItemIdKey(libraryItemId, episodeId);
    if (state.contains(key)) return;
    try {
      final item = await ref.read(itemDetailProvider(libraryItemId).future);
      await ref.read(itemsCacheProvider).put(item);

      final user = ref.read(currentUserProvider);
      if (user == null) throw StateError('No current user');
      final existing = _store.getAll()[key];
      final service = ref.read(storageServiceProvider(location));

      final DownloadItem downloadItem;

      if (item.isPodcast) {
        final episode = item.episodes.firstWhere((e) => e.id == episodeId);
        downloadItem = await episode.toDownloadItem(
          userId: user.id,
          serverUrl: user.serverUrl,
          service: service,
          relativePath: item.relPath,
          existing: existing,
        );
      } else {
        downloadItem = await item.toDownloadItem(
          userId: user.id,
          serverUrl: user.serverUrl,
          service: service,
          existing: existing,
        );
      }

      await _store.save(downloadItem);
      state = [...state, key];
      _processQueue();
    } catch (e, st) {
      final error = AppError.from(e, st);
      LogService.log(
        'Failed to enqueue item: ${error.message}',
        source: 'DownloadQueue',
        level: .error,
        originalError: error.originalError,
        stackTrace: error.stackTrace,
      );
    }
  }

  void _processQueue() => _processor.kick();

  Future<bool> _networkAllows(DownloadItem? item) async {
    if (item == null) return true;
    if (item.status != .queued && item.status != .waiting) return true;

    final wifiOnly = ref.read(downloadOnUnmeteredOnlyProvider);
    final connectionType = ref.read(connectionTypeProvider);
    final isOffline = ref.read(isServerOfflineProvider);

    final shouldWait =
        isOffline ||
        (wifiOnly && connectionType != .wifi && connectionType != .ethernet);

    if (!shouldWait) {
      if (item.status == .waiting) {
        await _store.save(item.copyWith(status: .queued));
      }
      return true;
    }

    if (item.status != .waiting) {
      await _store.save(item.copyWith(status: .waiting));
    }
    return false;
  }

  Future<void> _runItem(String key) {
    return DownloadTask(
      store: _store,
      engine: _engine,
      notifications: _notifications,
      currentUser: () => ref.read(currentUserProvider),
      useBinary: () => ref.read(useBinaryBytesProvider),
    ).run(key);
  }

  Future<void> resumeOrRetry(String id, String? episodeId) async {
    final key = mediaItemIdKey(id, episodeId);
    final item = _store.getAll()[key];
    if (item == null) return;

    final location = ref
        .read(storageLocationsProvider)
        .firstWhereOrNull((l) => l.uri == item.folderPath);
    if (location == null) return;

    _engine.cancel(key);
    await _notifications.release(key: key);
    await _notifications.dismiss(key: key);
    state = state.where((i) => i != key).toList();

    await _processor.waitForKey(key);

    await enqueue(libraryItemId: id, episodeId: episodeId, location: location);
  }

  Future<void> pause(String id) async {
    _engine.cancel(id);
    state = state.where((i) => i != id).toList();
    final downloads = _store.getAll();
    final item = downloads[id];
    if (item != null) {
      await _store.save(item.copyWith(status: .paused));
    }

    await _processor.waitForKey(id);
  }

  Future<void> delete(String id, String? episodeId) async {
    final key = mediaItemIdKey(id, episodeId);
    _engine.cancel(key);
    await _notifications.release(key: key);
    await _notifications.dismiss(key: key);
    state = state.where((i) => i != key).toList();
    final item = _store.getAll()[key];
    await _deleteFiles(item);
    await _store.remove(key);

    await _processor.waitForKey(key);
  }

  Future<void> _deleteFiles(DownloadItem? item) async {
    if (item == null) return;

    final service = ref.read(storageServiceForItemProvider(item));
    if (service == null) return;

    if (item.episodeId != null) {
      await service.deleteTrack(
        relativePath: item.relativePath,
        trackPath: item.tracks.first.trackPath,
      );
    } else {
      await service.deleteFolder(relativePath: item.relativePath);
      await ref.read(itemsCacheProvider).delete(item.libraryItemId);
    }

    unawaited(service.cleanupEmptyFolders());
  }
}
