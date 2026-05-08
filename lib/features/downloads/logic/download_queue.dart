import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/downloads/logic/download_engine.dart';
import 'package:storii/features/downloads/logic/downloads_filesystem_helper.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';

part 'download_queue.g.dart';

@Riverpod(keepAlive: true)
class DownloadQueue extends _$DownloadQueue {
  DownloadsNotifier get _downloads => ref.read(downloadsProvider.notifier);

  bool _processing = false;

  @override
  List<String> build() => [];

  Future<void> enqueue(String libraryItemId) async {
    if (state.contains(libraryItemId)) return;

    try {
      final item = await ref.read(itemDetailProvider(libraryItemId).future);
      final user = await ref.read(authenticatedUserProvider.future);

      final downloadItem = await item.toDownloadItem(
        userId: user.id,
        serverUrl: user.serverUrl,
      );
      await _downloads.save(downloadItem);
      state = [...state, libraryItemId];
      await _processQueue();
    } catch (e, st) {
      LogService.log(
        'Failed to enqueue $libraryItemId: $e',
        source: 'DownloadQueue',
        level: .error,
        stackTrace: st,
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
      final current = ref.read(downloadsProvider).value ?? {};
      final downloadItem = current[libraryItemId];
      if (downloadItem == null) return;

      final user = await ref.read(authenticatedUserProvider.future);
      await for (final updated
          in ref
              .read(downloadEngineProvider.notifier)
              .downloadItem(item: downloadItem, user: user)) {
        await _downloads.save(updated);
      }
    } catch (e, st) {
      LogService.log(
        'Download failed for $libraryItemId: $e',
        source: 'DownloadQueue',
        level: .error,
        stackTrace: st,
      );
      await _setStatus(libraryItemId, .failed);
    }
  }

  Future<void> pause(String id) async {
    ref.read(downloadEngineProvider.notifier).pause(id);
    state = state.where((i) => i != id).toList();
    final item = ref.read(downloadsProvider).value?[id];
    if (item != null) await _downloads.save(item.copyWith(status: .paused));
  }

  Future<void> delete(String id) async {
    ref.read(downloadEngineProvider.notifier).cancel(id);
    state = state.where((i) => i != id).toList();
    final item = ref.read(downloadsProvider).value?[id];
    if (item != null) {
      await ref.read(downloadsFsHelperProvider).deleteItem(item.title);
    }
    await _downloads.remove(id);
  }

  Future<void> _setStatus(String id, DownloadStatus status) async {
    final downloads = ref.read(downloadsProvider).value ?? {};
    final item = downloads[id];
    if (item == null) return;
    await _downloads.save(item.copyWith(status: status));
  }
}
