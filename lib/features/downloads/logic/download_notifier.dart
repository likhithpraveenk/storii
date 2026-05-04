import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/downloads/logic/download_engine.dart';
import 'package:storii/features/downloads/logic/download_storage.dart';
import 'package:storii/features/downloads/logic/downloads_filesystem_helper.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'download_notifier.g.dart';

@Riverpod(keepAlive: true)
class DownloadsNotifier extends _$DownloadsNotifier {
  DownloadsFilesystemHelper get _filesystem =>
      ref.read(downloadsFsHelperProvider);

  DownloadStorage get _storage => ref.read(downloadStorageProvider);

  @override
  Map<String, DownloadItem> build() {
    final loaded = _storage.loadAll();

    _pauseActiveItemsOnStart(loaded);

    return loaded;
  }

  void _pauseActiveItemsOnStart(Map<String, DownloadItem> items) {
    Future.microtask(() async {
      for (final item in items.values) {
        if (item.isActive) {
          await _updateAndPersist(item.copyWith(status: .paused));
        }
      }
    });
  }

  void updateItem(LibraryItem item) async {
    final di = state[item.id];
    if (di != null) {
      await _updateAndPersist(di.copyWith(libraryItem: item));
    }
  }

  Future<void> download(String libraryItemId) async {
    final existing = state[libraryItemId];
    if (existing != null && existing.isActive) return;

    try {
      final item = await ref.read(itemDetailProvider(libraryItemId).future);
      final user = await ref.read(authenticatedUserProvider.future);

      final tracks = await _buildTracks(
        existing: existing,
        item: item,
        libraryItemId: libraryItemId,
      );

      final di =
          (existing ??
                  DownloadItem(
                    libraryItemId: libraryItemId,
                    libraryItem: item,
                    title: item.title ?? libraryItemId,
                    author: item.authorName ?? '',
                    tracks: tracks,
                    startedAt: DateTime.now(),
                    serverUrl: user.serverUrl,
                    userId: user.id,
                  ))
              .copyWith(tracks: tracks, status: .queued);

      await _updateAndPersist(di);

      await for (final updated
          in ref
              .read(downloadEngineProvider.notifier)
              .downloadItem(item: di, user: user)) {
        state = {...state, updated.libraryItemId: updated};
        final prev = state[updated.libraryItemId];
        if (prev?.status != updated.status) {
          await _storage.save(updated);
        }
      }
      final finalItem = state[libraryItemId];
      if (finalItem != null) await _storage.save(finalItem);
    } catch (e, st) {
      LogService.log(
        'Download failed: $e',
        source: 'DownloadsNotifier',
        level: .error,
        stackTrace: st,
      );
      await _markFailed(libraryItemId);
    }
  }

  Future<List<DownloadTrack>> _buildTracks({
    required LibraryItem item,
    required String libraryItemId,
    required DownloadItem? existing,
  }) async {
    return Future.wait(
      item.tracks.map((track) async {
        final path = await _filesystem.trackPath(
          itemTitle: item.title ?? libraryItemId,
          filename: track.metadata?.filename ?? track.index.toString(),
        );
        final prev = existing?.tracks.firstWhereOrNull(
          (dt) => dt.audioTrack.index == track.index,
        );

        final intact =
            prev?.status == .completed && await _filesystem.fileIntact(path);

        final existingBytes = await _filesystem.existingBytes(path);

        final audioFile = item.audioFiles.firstWhere(
          (f) => f.index == track.index,
        );
        return DownloadTrack(
          audioTrack: track,
          localPath: path,
          ino: audioFile.ino,
          status: intact ? .completed : (existingBytes > 0 ? .paused : .queued),
          bytesReceived: existingBytes,
          bytesTotal: audioFile.metadata.size,
        );
      }),
    );
  }

  Future<void> pause(String id) async {
    ref.read(downloadEngineProvider.notifier).pause(id);
    final item = state[id];
    if (item != null) {
      await _updateAndPersist(item.copyWith(status: .paused));
    }
  }

  Future<void> cancel(String id) async {
    ref.read(downloadEngineProvider.notifier).cancel(id);
    final item = state[id];
    if (item != null) {
      await _updateAndPersist(item.copyWith(status: .cancelled));
    }
  }

  Future<void> resume(String id) async {
    final item = state[id];
    if (item == null) return;
    if (item.isActive) return;
    await download(id);
  }

  Future<void> delete(String libraryItemId) async {
    ref.read(downloadEngineProvider.notifier).cancel(libraryItemId);
    final item = state[libraryItemId];
    if (item != null) await _filesystem.deleteItem(item.title);

    state = {...state}..remove(libraryItemId);
    await _storage.remove(libraryItemId);
  }

  Future<void> _updateAndPersist(DownloadItem item) async {
    state = {...state, item.libraryItemId: item};
    await _storage.save(item);
  }

  Future<void> _markFailed(String id) async {
    final item = state[id];
    if (item == null) return;
    await _updateAndPersist(item.copyWith(status: .failed));
  }
}

@riverpod
List<DownloadItem> activeDownloads(Ref ref) {
  final downloads = ref.watch(downloadsProvider);
  return downloads.values.where((item) => !item.isComplete).toList();
}

@riverpod
List<DownloadItem> completedDownloads(Ref ref) {
  final downloads = ref.watch(downloadsProvider);
  return downloads.values.where((item) => item.isComplete).toList();
}
