import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/item/logic/progress_notifier.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';

part 'session_sync_watcher.g.dart';

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

  void resetClock() {
    _playStartedAt = null;
    _unsynced = Duration.zero;
  }

  void rollback(Duration unsynced) => _unsynced = unsynced;
}

@Riverpod(keepAlive: true)
class ListenTimeNotifier extends _$ListenTimeNotifier {
  final _accumulator = ListenTimeAccumulator();

  @override
  void build() {}

  Future<void> syncNow({bool isClosing = false, bool isPaused = false}) async {
    final listened = _accumulator.snapshotAndReset(
      keepRunning: !isPaused && !isClosing,
    );
    try {
      if (isClosing) {
        await ref.read(sessionProvider.notifier).close();
        _accumulator.resetClock();
      } else {
        await ref.read(sessionProvider.notifier).sync(listened);
      }
    } catch (_) {
      _accumulator.rollback(listened);
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
        notifier.syncNow(isPaused: true);
      case .buffering:
        notifier.pauseClock();
      case .seek:
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
