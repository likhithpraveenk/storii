import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/download_item.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/storage/hive/boxes.dart';
import 'package:storii/storage/local/download_service.dart';

part 'download_notifier.g.dart';

@Riverpod(keepAlive: true)
class DownloadsNotifier extends _$DownloadsNotifier {
  late Box<String> _box;
  final Map<String, CancelToken> _cancelTokens = {};
  final _service = DownloadService();

  @override
  Map<String, DownloadItem> build() {
    _box = Hive.box<String>(downloadsBox);
    return _loadFromBox();
  }

  Future<void> download(String libraryItemId) async {
    if (state.containsKey(libraryItemId)) {
      final existing = state[libraryItemId]!;
      if (existing.isActive) return;
      if (existing.isComplete) return;
    }

    try {
      final item = await ref.read(itemDetailProvider(libraryItemId).future);
      final user = await ref.read(authenticatedUserProvider.future);
      final token = await ref.read(tokenProvider).getAccessToken(user.id);

      if (token == null) throw const AppError('No access token');

      final trackStubs = await DownloadService.buildTrackStubs(item);

      final di = DownloadItem(
        libraryItemId: libraryItemId,
        title: item.title ?? libraryItemId,
        author: item.authorName ?? '',
        tracks: trackStubs,
        status: DownloadStatus.downloading,
        startedAt: DateTime.now(),
      );

      _update(di);
      _persist(di);

      await _downloadAll(di, user.serverUrl, token);
    } catch (e, st) {
      final error = AppError.resolve(e);
      LogService.log(
        'Download failed for $libraryItemId: $error',
        source: 'DownloadsNotifier',
        level: .error,
        stackTrace: st,
      );
      _markFailed(libraryItemId);
    }
  }

  Future<void> cancel(String libraryItemId) async {
    _cancelTokens[libraryItemId]?.cancel('User cancelled');
    _cancelTokens.remove(libraryItemId);

    final item = state[libraryItemId];
    if (item == null) return;

    final updated = item.copyWith(status: DownloadStatus.paused);
    _update(updated);
    _persist(updated);
  }

  Future<void> resume(String libraryItemId) => download(libraryItemId);

  Future<void> delete(String libraryItemId) async {
    await cancel(libraryItemId);
    await DownloadService.deleteItem(libraryItemId);
    final next = Map<String, DownloadItem>.from(state)..remove(libraryItemId);
    state = next;
    await _box.delete(libraryItemId);
  }

  DownloadItem? itemFor(String libraryItemId) => state[libraryItemId];

  Future<void> _downloadAll(
    DownloadItem di,
    Uri serverUrl,
    String token,
  ) async {
    final cancelToken = CancelToken();
    _cancelTokens[di.libraryItemId] = cancelToken;

    var current = di;
    int totalBytes = 0;
    int receivedBytes = 0;

    for (int i = 0; i < current.tracks.length; i++) {
      final track = current.tracks[i];
      if (track.status == DownloadStatus.complete) {
        totalBytes += track.bytesTotal;
        receivedBytes += track.bytesReceived;
        continue;
      }

      try {
        await _service.downloadTrack(
          serverUrl: serverUrl,
          token: token,
          libraryItemId: current.libraryItemId,
          track: AudioTrack(
            index: track.index,
            startOffset: Duration.zero,
            duration: Duration.zero,
            title: '',
            contentUrl: track.contentUrl,
            mimeType: track.mimeType,
          ),
          cancelToken: cancelToken,
          onProgress: (rcv, total) {
            if (total <= 0) return;
            final updatedTrack = track.copyWith(
              bytesReceived: rcv,
              bytesTotal: total,
              status: DownloadStatus.downloading,
            );
            final updatedTracks = List<DownloadTrack>.from(current.tracks);
            updatedTracks[i] = updatedTrack;

            final allPrev = updatedTracks
                .take(i)
                .fold<int>(0, (s, t) => s + t.bytesTotal);
            final totalEst = allPrev + total * current.tracks.length ~/ (i + 1);

            current = current.copyWith(
              tracks: updatedTracks,
              receivedBytes: receivedBytes + rcv,
              totalBytes: totalEst,
            );
            _update(current);
          },
        );

        final completedTrack = current.tracks[i].copyWith(
          status: DownloadStatus.complete,
        );
        final updatedTracks = List<DownloadTrack>.from(current.tracks);
        updatedTracks[i] = completedTrack;
        totalBytes += completedTrack.bytesTotal;
        receivedBytes += completedTrack.bytesReceived;

        current = current.copyWith(
          tracks: updatedTracks,
          receivedBytes: receivedBytes,
          totalBytes: totalBytes,
        );
        _update(current);
        _persist(current);
      } on DioException catch (e) {
        if (CancelToken.isCancel(e)) return;
        LogService.log(
          'Track ${track.index} download error: $e',
          source: 'DownloadsNotifier',
          level: .warning,
        );
        _markFailed(current.libraryItemId);
        return;
      }
    }

    _cancelTokens.remove(current.libraryItemId);

    final done = current.copyWith(
      status: DownloadStatus.complete,
      completedAt: DateTime.now(),
    );
    _update(done);
    _persist(done);
  }

  void _markFailed(String libraryItemId) {
    final item = state[libraryItemId];
    if (item == null) return;
    final updated = item.copyWith(status: DownloadStatus.failed);
    _update(updated);
    _persist(updated);
  }

  void _update(DownloadItem item) {
    state = {...state, item.libraryItemId: item};
  }

  void _persist(DownloadItem item) {
    try {
      _box.put(item.libraryItemId, jsonEncode(item.toJson()));
    } catch (e) {
      if (kDebugMode) debugPrint('persist download failed: $e');
    }
  }

  Map<String, DownloadItem> _loadFromBox() {
    final result = <String, DownloadItem>{};
    for (final key in _box.keys) {
      try {
        final json = jsonDecode(_box.get(key as String)!);
        final item = DownloadItem.fromJson(json);
        result[item.libraryItemId] = item;
      } catch (e) {
        if (kDebugMode) debugPrint('load download failed for $key: $e');
      }
    }
    return result;
  }
}
