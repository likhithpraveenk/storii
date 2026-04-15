import 'dart:async';
import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/features/downloads/logic/download_engine.dart';
import 'package:storii/features/downloads/logic/download_storage.dart';
import 'package:storii/features/downloads/logic/downloads_filesystem_helper.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'download_notifier.g.dart';

@Riverpod(keepAlive: true)
class DownloadsNotifier extends _$DownloadsNotifier {
  final _engine = DownloadEngine();
  final _filesystem = DownloadsFilesystemHelper();

  DownloadStorage get _storage => ref.read(downloadStorageProvider);

  @override
  Map<String, DownloadItem> build() {
    final loaded = _storage.loadAll();
    return loaded;
  }

  Future<void> download(String libraryItemId) async {
    final existing = state[libraryItemId];
    if (existing != null && existing.isActive) return;

    try {
      final item = await ref.read(itemDetailProvider(libraryItemId).future);
      final user = await ref.read(authenticatedUserProvider.future);
      final token = await ref.read(tokenProvider).getAccessToken(user.id);
      if (token == null) throw const AppError('No access token');

      final tracks = await Future.wait(
        item.tracks.map((track) async {
          final path = await _filesystem.trackPath(
            itemTitle: item.title ?? libraryItemId,
            filename: track.metadata.filename,
          );
          final prev = existing?.tracks.firstWhereOrNull(
            (dt) => dt.audioTrack.index == track.index,
          );

          final intact =
              prev?.status == .completed && await _filesystem.fileIntact(path);

          final existingBytes = await File(path).exists()
              ? await File(path).length()
              : 0;

          return DownloadTrack(
            audioTrack: track,
            localPath: path,
            status: intact
                ? .completed
                : (existingBytes > 0 ? .paused : .queued),
            bytesReceived: existingBytes,
          );
        }),
      );

      final di =
          (existing ??
                  DownloadItem(
                    libraryItemId: libraryItemId,
                    title: item.title ?? libraryItemId,
                    author: item.authorName ?? '',
                    tracks: tracks,
                    startedAt: DateTime.now(),
                  ))
              .copyWith(tracks: tracks, status: .queued);

      _updateAndPersist(di);

      await for (final updated in _engine.downloadItem(
        item: di,
        serverUrl: user.serverUrl,
        token: token,
      )) {
        _updateAndPersist(updated);
      }
    } catch (e, st) {
      LogService.log(
        'Download failed: $e',
        source: 'DownloadsNotifier',
        level: .error,
        stackTrace: st,
      );
      _markFailed(libraryItemId);
    }
  }

  void pause(String id) {
    _engine.pause(id);
    final item = state[id];
    if (item != null) {
      _updateAndPersist(item.copyWith(status: .paused));
    }
  }

  void cancel(String id) {
    _engine.cancel(id);
    final item = state[id];
    if (item != null) {
      _updateAndPersist(item.copyWith(status: .cancelled));
    }
  }

  Future<void> resume(String id) async {
    final item = state[id];
    if (item == null) return;

    await download(id);
  }

  Future<void> delete(String libraryItemId) async {
    _engine.cancel(libraryItemId);
    final item = state[libraryItemId];
    if (item != null) await _filesystem.deleteItem(item.title);

    state = {...state}..remove(libraryItemId);
    await _storage.remove(libraryItemId);
  }

  void _updateAndPersist(DownloadItem item) {
    state = {...state, item.libraryItemId: item};
    _storage.save(item);
  }

  void _markFailed(String id) {
    final item = state[id];
    if (item == null) return;
    _updateAndPersist(item.copyWith(status: .failed));
  }
}
