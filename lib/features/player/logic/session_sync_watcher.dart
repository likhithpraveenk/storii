import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/item/logic/progress_notifier.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';

part 'session_sync_watcher.g.dart';

/// Tracks listened time using a simple clock model
/// [_unsynced] holds time from previous failed syncs
/// [_playStartedAt] is set when playback starts and null when paused/stopped
class ListenTimeAccumulator {
  DateTime? _playStartedAt;
  Duration _unsynced = Duration.zero;

  void startClock() {
    _playStartedAt ??= DateTime.now();
  }

  void pauseClock() {
    if (_playStartedAt == null) return;
    _unsynced += DateTime.now().difference(_playStartedAt!);
    _playStartedAt = null;
  }

  /// Returns total listened time since the last successful sync
  ///
  /// [_unsynced] (previous failed) + live delta (current session)
  ///
  /// If [keepRunning] is true (mid-session sync), the clock is immediately
  /// restarted so we don't miss time during the sync call.
  /// If false (pause/stop/seek-while-paused), the clock stays stopped
  Duration snapshotAndReset({required bool keepRunning}) {
    final now = DateTime.now();
    final live = _playStartedAt != null
        ? now.difference(_playStartedAt!)
        : Duration.zero;

    final total = _unsynced + live;
    _unsynced = Duration.zero;
    _playStartedAt = keepRunning ? now : null;
    return total;
  }

  /// Full reset after a session closes
  void resetClock() {
    _playStartedAt = null;
    _unsynced = Duration.zero;
  }

  /// Called when a sync fails
  void rollback(Duration unsynced) => _unsynced = unsynced;
}

@Riverpod(keepAlive: true)
class ListenTimeNotifier extends _$ListenTimeNotifier {
  final _accumulator = ListenTimeAccumulator();
  // guard to drop simultaneous sync requests
  bool _syncing = false;

  @override
  void build() {}

  Future<void> syncNow({bool isClosing = false, bool isPaused = false}) async {
    // Allow close to bypass the guard so stop is never dropped
    if (_syncing && !isClosing) return;
    _syncing = true;

    final listened = _accumulator.snapshotAndReset(
      keepRunning: !isPaused && !isClosing,
    );
    try {
      if (isClosing) {
        await ref.read(sessionProvider.notifier).close(listened);
        _accumulator.resetClock();
      } else {
        await ref.read(sessionProvider.notifier).sync(listened);
      }
    } catch (_) {
      _accumulator.rollback(listened);
    } finally {
      _syncing = false;
    }
  }

  void startClock() => _accumulator.startClock();
  void pauseClock() => _accumulator.pauseClock();
}

@Riverpod(keepAlive: true)
void sessionSyncWatcher(Ref ref) {
  final session = ref.watch(sessionProvider);
  if (session == null) return;

  final interval = ref.watch(syncIntervalProvider);

  ref.listen(audioHandlerEventsProvider, (_, next) {
    final notifier = ref.read(listenTimeProvider.notifier);
    switch (next.value) {
      case .play:
        notifier.startClock();
      case .pause:
        // Sync and stop the clock. keepRunning will be false
        notifier.syncNow(isPaused: true);
      case .buffering:
        notifier.pauseClock();
      case .seek:
        // Sync pre-seek time. If still playing, keepRunning restarts
        // the clock internally
        notifier.syncNow(isPaused: !ref.read(isPlayingProvider));
      case .stop:
        notifier.syncNow(isClosing: true);
      case .complete:
        notifier.syncNow(isClosing: true);
        ref
            .read(
              mediaProgressProvider(
                session.libraryItemId,
                session.episodeId,
              ).notifier,
            )
            .markComplete();
      default:
        break;
    }
  });

  final timer = Timer.periodic(interval, (_) {
    if (ref.read(isPlayingProvider)) {
      ref.read(listenTimeProvider.notifier).syncNow();
    }
  });

  ref.onDispose(timer.cancel);
}
