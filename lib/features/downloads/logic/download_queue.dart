import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/download_engine.dart';
import 'package:storii/features/downloads/logic/download_extensions.dart';
import 'package:storii/features/downloads/logic/download_migration.dart';
import 'package:storii/features/downloads/logic/downloads_filesystem_helper.dart';
import 'package:storii/features/downloads/logic/downloads_notification_service.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/storage/local/downloads_store.dart';
import 'package:storii/storage/local/items_cache.dart';

part 'download_queue.g.dart';

@Riverpod(keepAlive: true)
class DownloadQueue extends _$DownloadQueue {
  DownloadsStore get _store => ref.read(downloadsStoreProvider.notifier);

  Completer<void>? _processing;

  @override
  List<String> build() {
    Future.microtask(
      () => ref.read(downloadMigrationV2Provider.notifier).runIfNeeded(),
    );

    final downloads = _store.getAll();
    final active =
        downloads.values
            .where(
              (item) => item.status == .queued || item.status == .downloading,
            )
            .toList()
          ..sort(
            (a, b) => (a.startedAt ?? DateTime.now()).compareTo(
              b.startedAt ?? DateTime.now(),
            ),
          );

    final keys = active.map((item) => item.key).toList();
    if (keys.isNotEmpty) {
      Future.microtask(_processQueue);
    }
    return keys;
  }

  Future<void> enqueue(String libraryItemId, String? episodeId) async {
    final key = mediaItemIdKey(libraryItemId, episodeId);
    if (state.contains(key)) return;
    try {
      final item = await ref.read(itemDetailProvider(libraryItemId).future);
      await ref.read(itemsCacheProvider.notifier).put(item);

      final user = await ref.read(authenticatedUserProvider.future);
      final existing = _store.getAll()[key];
      final fs = ref.read(downloadsFsHelperProvider);

      final DownloadItem downloadItem;

      if (item.isPodcast) {
        final episode = item.episodes.firstWhere((e) => e.id == episodeId);
        downloadItem = await episode.toDownloadItem(
          userId: user.id,
          serverUrl: user.serverUrl,
          fs: fs,
          itemTitle: item.title ?? libraryItemId,
          existing: existing,
        );
      } else {
        downloadItem = await item.toDownloadItem(
          userId: user.id,
          serverUrl: user.serverUrl,
          fs: fs,
          existing: existing,
        );
      }

      await _store.save(downloadItem);
      state = [...state, key];
      await _processQueue();
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

  Future<void> _processQueue() async {
    if (_processing != null) return;
    _processing = Completer<void>();

    while (state.isNotEmpty) {
      final key = state.first;
      await _download(key);
      state = state.where((i) => i != key).toList();
    }

    _processing?.complete();
    _processing = null;
  }

  Future<void> _download(String mediaItemKey) async {
    try {
      final downloads = _store.getAll();
      final downloadItem = downloads[mediaItemKey];
      if (downloadItem == null) return;

      await DownloadsNotificationService.instance.requestPermission();
      await DownloadsNotificationService.instance.startForeground(
        title: downloadItem.title,
      );

      final user = await ref.read(authenticatedUserProvider.future);

      final stream = ref
          .read(downloadEngineProvider.notifier)
          .downloadItem(item: downloadItem, user: user);

      await for (final updated in stream) {
        await _store.save(updated);

        await DownloadsNotificationService.instance.showProgressNotification(
          title: updated.title,
          progress: (updated.progress * 100).toInt(),
          isComplete: updated.isComplete,
          isFailed: updated.isFailed,
          isPaused: updated.status == .paused,
          totalBytes: updated.totalBytes,
          useBinary: ref.read(useBinaryBytesProvider),
        );

        if (updated.isComplete || updated.isFailed) {
          await DownloadsNotificationService.instance.stopForeground();
        }
      }
    } catch (e, st) {
      final error = AppError.from(e, st);
      LogService.log(
        'Download failed for $mediaItemKey: ${error.message}',
        source: 'DownloadQueue',
        level: .error,
        originalError: error.originalError,
        stackTrace: error.stackTrace,
      );
      await _setStatus(mediaItemKey, .failed);

      await DownloadsNotificationService.instance.stopForeground();
      await DownloadsNotificationService.instance.showProgressNotification(
        title:
            ref.read(downloadsStoreProvider).value?[mediaItemKey]?.title ??
            mediaItemKey,
        progress: 0,
        isComplete: false,
        isFailed: true,
        isPaused: false,
        useBinary: ref.read(useBinaryBytesProvider),
      );
    }
  }

  Future<void> pause(String id) async {
    ref.read(downloadEngineProvider.notifier).cancel(id);
    final processing = _processing;
    state = state.where((i) => i != id).toList();
    final downloads = _store.getAll();
    final item = downloads[id];
    if (item != null) await _store.save(item.copyWith(status: .paused));

    await processing?.future;

    await DownloadsNotificationService.instance.stopForeground();
    await DownloadsNotificationService.instance.showProgressNotification(
      title: item?.title ?? id,
      progress: ((item?.progress ?? 0) * 100).toInt(),
      isComplete: false,
      isFailed: false,
      isPaused: true,
      useBinary: ref.read(useBinaryBytesProvider),
    );
  }

  Future<void> delete(String id, String? episodeId) async {
    final key = mediaItemIdKey(id, episodeId);
    ref.read(downloadEngineProvider.notifier).cancel(key);
    final processing = _processing;
    await DownloadsNotificationService.instance.stopForeground();
    await DownloadsNotificationService.instance.dismiss();
    state = state.where((i) => i != key).toList();
    final downloads = _store.getAll();
    final item = downloads[key];
    if (item != null) {
      if (item.episodeId != null) {
        await ref
            .read(downloadsFsHelperProvider)
            .deletePodcastEpisode(item.libraryItemId, item.episodeId!);

        final otherEpisodes = _store.getAll().values.where(
          (d) =>
              d.libraryItemId == item.libraryItemId &&
              d.episodeId != item.episodeId &&
              d.isComplete,
        );
        if (otherEpisodes.isEmpty) {
          await ref
              .read(downloadsFsHelperProvider)
              .deletePodcastIfEmpty(item.libraryItemId);
          await ref
              .read(itemsCacheProvider.notifier)
              .delete(item.libraryItemId);
        }
      } else {
        await ref
            .read(downloadsFsHelperProvider)
            .deleteAudiobook(item.libraryItemId);
        await ref.read(itemsCacheProvider.notifier).delete(id);
      }
    }
    await _store.remove(key);

    await processing?.future;
  }

  Future<void> _setStatus(String id, DownloadStatus status) async {
    final downloads = _store.getAll();
    final item = downloads[id];
    if (item == null) return;
    await _store.save(item.copyWith(status: status));
  }
}
