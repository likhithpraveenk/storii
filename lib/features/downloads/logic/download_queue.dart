import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/downloads/logic/download_engine.dart';
import 'package:storii/features/downloads/logic/downloads_filesystem_helper.dart';
import 'package:storii/features/downloads/logic/downloads_notification_service.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/storage/local/downloads_store.dart';
import 'package:storii/storage/local/items_cache.dart';

part 'download_queue.g.dart';

@Riverpod(keepAlive: true)
class DownloadQueue extends _$DownloadQueue {
  DownloadsStore get _store => ref.read(downloadsStoreProvider.notifier);

  bool _processing = false;

  @override
  List<String> build() => [];

  Future<void> enqueue(String libraryItemId) async {
    if (state.contains(libraryItemId)) return;

    try {
      final item = await ref.read(itemDetailProvider(libraryItemId).future);
      await ref.read(itemsCacheProvider.notifier).put(item);

      final user = await ref.read(authenticatedUserProvider.future);

      final downloadItem = await item.toDownloadItem(
        userId: user.id,
        serverUrl: user.serverUrl,
      );
      await _store.save(downloadItem);
      state = [...state, libraryItemId];
      await _processQueue();
    } catch (e, st) {
      final error = AppError.from(e, st);
      LogService.log(
        'Failed to enqueue $libraryItemId: ${error.message}',
        source: 'DownloadQueue',
        level: .error,
        originalError: error.originalError,
        stackTrace: error.stackTrace,
      );
    }
  }

  Future<void> _processQueue() async {
    if (_processing) return;
    _processing = true;

    while (state.isNotEmpty) {
      final id = state.first;
      await _downloadItem(id);
      state = state.where((i) => i != id).toList();
    }

    _processing = false;
  }

  Future<void> _downloadItem(String libraryItemId) async {
    try {
      final downloads = _store.getAll();
      final downloadItem = downloads[libraryItemId];
      if (downloadItem == null) return;

      await DownloadsNotificationService.instance.requestPermission();
      await DownloadsNotificationService.instance.startForeground(
        title: downloadItem.title,
      );

      final user = await ref.read(authenticatedUserProvider.future);
      await for (final updated
          in ref
              .read(downloadEngineProvider.notifier)
              .downloadItem(item: downloadItem, user: user)) {
        await _store.save(updated);

        await DownloadsNotificationService.instance.showProgressNotification(
          title: updated.title,
          progress: (updated.progress * 100).toInt(),
          isComplete: updated.isComplete,
          isFailed: updated.isFailed,
          isPaused: updated.status == .paused,
          totalBytes: updated.totalBytes,
        );

        if (updated.isComplete || updated.isFailed) {
          await DownloadsNotificationService.instance.stopForeground();
        }
      }
    } catch (e, st) {
      final error = AppError.from(e, st);
      LogService.log(
        'Download failed for $libraryItemId: ${error.message}',
        source: 'DownloadQueue',
        level: .error,
        originalError: error.originalError,
        stackTrace: error.stackTrace,
      );
      await _setStatus(libraryItemId, .failed);

      await DownloadsNotificationService.instance.stopForeground();
      await DownloadsNotificationService.instance.showProgressNotification(
        title: libraryItemId,
        progress: 0,
        isComplete: false,
        isFailed: true,
        isPaused: false,
      );
    }
  }

  Future<void> pause(String id) async {
    ref.read(downloadEngineProvider.notifier).cancel(id);
    _processing = false;
    state = state.where((i) => i != id).toList();
    final downloads = _store.getAll();
    final item = downloads[id];
    if (item != null) await _store.save(item.copyWith(status: .paused));

    await DownloadsNotificationService.instance.stopForeground();
    await DownloadsNotificationService.instance.showProgressNotification(
      title: item?.title ?? id,
      progress: ((item?.progress ?? 0) * 100).toInt(),
      isComplete: false,
      isFailed: false,
      isPaused: true,
    );
  }

  Future<void> delete(String id) async {
    ref.read(downloadEngineProvider.notifier).cancel(id);
    _processing = false;
    await DownloadsNotificationService.instance.stopForeground();
    state = state.where((i) => i != id).toList();
    final downloads = _store.getAll();
    final item = downloads[id];
    if (item != null) {
      await ref.read(downloadsFsHelperProvider).deleteItem(item.title);
    }
    await ref.read(itemsCacheProvider.notifier).delete(id);
    await _store.remove(id);
  }

  Future<void> _setStatus(String id, DownloadStatus status) async {
    final downloads = _store.getAll();
    final item = downloads[id];
    if (item == null) return;
    await _store.save(item.copyWith(status: status));
  }
}
