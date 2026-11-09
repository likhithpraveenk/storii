import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/download_queue.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/storage/local/auto_delete_exclusion_store.dart';
import 'package:storii/storage/local/downloads_store.dart';

part 'download_auto_delete.g.dart';

class DownloadAutoDelete {
  new({
    required this.readDownloads,
    required this.readProgress,
    required this.readDeleteDelay,
    required this.delete,
    required this.isPlaying,
    required this.isEnabled,
    required this.readExcluded,
    required this.isOwner,
    DateTime Function()? now,
    Timer Function(Duration, void Function())? timerFactory,
  }) : _now = now ?? DateTime.now,
       _timerFactory = timerFactory ?? Timer.new;

  final Map<String, DownloadItem> Function() readDownloads;
  final Future<Map<String, MediaProgress>> Function() readProgress;
  final Duration Function() readDeleteDelay;
  final Future<void> Function(DownloadItem item) delete;
  final bool Function(DownloadItem item) isPlaying;
  final bool Function() isEnabled;
  final Set<String> Function() readExcluded;
  final bool Function(DownloadItem item) isOwner;

  final DateTime Function() _now;
  final Timer Function(Duration, void Function()) _timerFactory;

  Timer? _timer;
  final Set<String> _deleting = <String>{};
  Future<void> _sweepQueue = Future.value();

  static DateTime? dueAt(
    DownloadItem item,
    MediaProgress? progress,
    Duration delay,
  ) {
    if (item.status != .completed) return null;
    if (progress?.isFinished != true) return null;
    final timestamp = progress?.finishedAt ?? progress?.lastUpdate;
    if (timestamp == null) return null;
    return timestamp.add(delay);
  }

  static Duration? timeUntilDelete(
    DownloadItem item,
    MediaProgress? progress,
    Duration delay,
    DateTime now,
  ) {
    final due = dueAt(item, progress, delay);
    if (due == null) return null;
    return due.difference(now);
  }

  Future<void> sweep() async {
    if (!isEnabled()) return;
    final downloads = readDownloads();
    final progressMap = await readProgress();
    final delay = readDeleteDelay();
    final exclusions = readExcluded();
    final now = _now();

    for (final item in downloads.values) {
      if (!isOwner(item)) continue;
      final due = dueAt(item, progressMap[item.key], delay);
      if (due == null || due.isAfter(now)) continue;
      if (exclusions.contains(item.key)) continue;
      if (_deleting.contains(item.key)) continue;
      if (isPlaying(item)) continue;

      _deleting.add(item.key);
      try {
        await delete(item);
      } catch (e, st) {
        LogService.log(
          'auto-delete failed for ${item.key}',
          source: 'DownloadAutoDelete',
          level: .warning,
          originalError: e,
          stackTrace: st,
        );
      } finally {
        _deleting.remove(item.key);
      }
    }
  }

  Future<void> requestSweep() {
    _cancelTimer();
    final run = _sweepQueue.then((_) async {
      await sweep();
      await _scheduleSweep();
    });
    _sweepQueue = run;
    return run;
  }

  Future<void> _scheduleSweep() async {
    _cancelTimer();
    if (!isEnabled()) return;
    final downloads = readDownloads();
    final delay = readDeleteDelay();
    final exclusions = readExcluded();
    final progressMap = await readProgress();

    final dueTimes = [
      for (final item in downloads.values)
        if (isOwner(item) && !exclusions.contains(item.key))
          dueAt(item, progressMap[item.key], delay),
    ].nonNulls;
    if (dueTimes.isEmpty) return;

    final nextDue = dueTimes.reduce((a, b) => a.isBefore(b) ? a : b);
    final wait = nextDue.difference(_now());
    if (wait <= Duration.zero) return; // overdue; skipped by sweep
    _timer = _timerFactory(wait, requestSweep);
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    _cancelTimer();
    _deleting.clear();
  }
}

@riverpod
class DownloadAutoDeleteWatcher extends _$DownloadAutoDeleteWatcher {
  @override
  void build() {
    final user = ref.watch(currentUserProvider);
    if (user == null) return;

    final sweeper = DownloadAutoDelete(
      readDownloads: () => ref.read(downloadsStoreProvider).getAll(),
      readProgress: () => ref.read(mediaProgressMapProvider.future),
      readDeleteDelay: () => ref.read(autoDeleteListenedDelayProvider),
      isEnabled: () => ref.read(autoDeleteListenedDownloadsProvider),
      readExcluded: () => ref.read(autoDeleteExclusionStoreProvider).getAll(),
      isOwner: (item) => ref.read(currentUserProvider)?.id == item.userId,
      delete: (item) async {
        LogService.log(
          'auto-deleting finished download "${item.title}"',
          source: 'DownloadAutoDelete',
          level: .info,
        );
        await ref
            .read(downloadQueueProvider.notifier)
            .delete(item.libraryItemId, item.episodeId);
      },
      isPlaying: (item) => ref.read(
        sessionProvider.select(
          (s) =>
              s?.libraryItemId == item.libraryItemId &&
              s?.episodeId == item.episodeId,
        ),
      ),
    );

    ref.onDispose(sweeper.dispose);

    Future.microtask(sweeper.requestSweep);

    ref.listen(mediaProgressMapProvider, (prev, next) {
      final map = next.value;
      if (map == null) return;
      final prevMap = prev?.value ?? const {};
      final downloads = ref.read(downloadsStoreProvider).getAll();
      final becameFinished = downloads.values.any(
        (item) =>
            item.status == .completed &&
            map[item.key]?.isFinished == true &&
            prevMap[item.key]?.isFinished != true,
      );
      if (becameFinished) sweeper.requestSweep();
    });

    ref.listen(
      autoDeleteListenedDownloadsProvider,
      (_, _) => sweeper.requestSweep(),
    );

    ref.listen(
      autoDeleteListenedDelayProvider,
      (_, _) => sweeper.requestSweep(),
    );

    ref.listen(autoDeleteExclusionsProvider, (_, _) => sweeper.requestSweep());
  }
}
