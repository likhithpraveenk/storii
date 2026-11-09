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

  final Set<String> _transitioning = <String>{};

  late final DownloadQueueProcessor _processor = DownloadQueueProcessor(
    readKeys: _pendingKeys,
    store: _store,
    canStart: _networkAllows,
    runItem: _runItem,
    maxConcurrent: () => ref.read(parallelDownloadsProvider),
  );

  @override
  List<String> build() {
    ref.listen(downloadsProvider, (_, _) => _syncState());

    final keys = _activeKeys();
    if (keys.isNotEmpty) {
      Future.microtask(_processQueue);
    }

    ref.listen(connectionTypeProvider, (_, _) => _processQueue());

    return keys;
  }

  Future<void> enqueue({
    required String libraryItemId,
    String? episodeId,
    required StorageLocation location,
  }) async {
    final key = mediaItemIdKey(libraryItemId, episodeId);
    if (_store.get(key)?.isActive ?? false) return;
    try {
      final item = await ref.read(itemDetailProvider(libraryItemId).future);
      await ref.read(itemsCacheProvider).put(item);

      final user = ref.read(currentUserProvider);
      if (user == null) throw StateError('No current user');
      final existing = _store.get(key);
      final service = ref.read(storageServiceProvider(location));

      final downloadItem = await item.toDownloadItem(
        userId: user.id,
        serverUrl: user.serverUrl,
        service: service,
        episodeId: episodeId,
        existing: existing,
      );

      await _store.save(downloadItem);
      _syncState();
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
    ).run(key);
  }

  Future<void> resumeOrRetry(String id, String? episodeId) async {
    final key = mediaItemIdKey(id, episodeId);
    final item = _store.get(key);
    if (item == null) return;

    final location = ref
        .read(storageLocationsProvider)
        .firstWhereOrNull((l) => l.uri == item.folderPath);
    if (location == null) return;

    _transitioning.add(key);
    try {
      _engine.cancel(key);
      await _processor.waitForKey(key);
      await _notifications.dismiss(key);

      await enqueue(
        libraryItemId: id,
        episodeId: episodeId,
        location: location,
      );
    } finally {
      _transitioning.remove(key);
      _processQueue();
    }
  }

  Future<void> pause(String id) async {
    if (_processor.isRunning(id)) {
      _engine.cancel(id);
      await _processor.waitForKey(id);
    }

    final item = _store.get(id);
    if (item != null && item.isActive) {
      await _store.save(item.copyWith(status: .paused));
    }
    _syncState();
  }

  Future<void> delete(String id, String? episodeId) async {
    final key = mediaItemIdKey(id, episodeId);
    _transitioning.add(key);
    try {
      _engine.cancel(key);
      final item = _store.get(key);

      await _processor.waitForKey(key);
      await _notifications.dismiss(key);

      await _deleteFiles(item);
      await _store.remove(key);
      _syncState();
    } finally {
      _transitioning.remove(key);
    }
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

  List<String> _activeKeys() => _activeKeysFrom(_store.getAll());

  List<String> _pendingKeys() => [
    for (final key in _activeKeys())
      if (!_transitioning.contains(key)) key,
  ];

  List<String> _activeKeysFrom(Map<String, DownloadItem> items) {
    final zeroEpoch = DateTime.fromMillisecondsSinceEpoch(0);
    final active = items.values.where((item) => item.isActive).toList()
      ..sort(
        (a, b) =>
            (a.startedAt ?? zeroEpoch).compareTo(b.startedAt ?? zeroEpoch),
      );
    return active.map((item) => item.key).toList();
  }

  void _syncState() {
    final keys = _activeKeys();
    if (_sameKeys(keys, state)) return;
    state = keys;
  }

  bool _sameKeys(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
