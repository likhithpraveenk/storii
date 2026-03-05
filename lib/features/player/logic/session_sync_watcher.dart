import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';

part 'session_sync_watcher.g.dart';

class ListenTimeAccumulator {
  DateTime? _playStartedAt;
  Duration _buffered = Duration.zero;

  void onPlay() {
    _playStartedAt = DateTime.now();
  }

  Duration onSyncEvent({bool isPauseOrStop = false}) {
    final now = DateTime.now();
    final sessionDelta = _playStartedAt != null
        ? now.difference(_playStartedAt!)
        : Duration.zero;

    if (isPauseOrStop) {
      _playStartedAt = null;
    } else {
      _playStartedAt = now;
    }

    return _buffered + sessionDelta;
  }

  void onSyncSuccess() {
    _buffered = Duration.zero;
  }

  void onSyncFailure(Duration attempted) {
    _buffered = attempted;
  }
}

@Riverpod(keepAlive: true)
void sessionSyncWatcher(Ref ref) {
  final session = ref.watch(sessionProvider);
  if (session == null) return;

  final accumulator = ListenTimeAccumulator();

  Future<void> handleSync({
    bool isClosing = false,
    bool isPaused = false,
  }) async {
    final listened = accumulator.onSyncEvent(
      isPauseOrStop: isPaused || isClosing,
    );

    try {
      if (isClosing) {
        await ref.read(sessionProvider.notifier).close(listened);
      } else {
        await ref.read(sessionProvider.notifier).sync(listened);
      }
      accumulator.onSyncSuccess();
    } catch (_) {
      accumulator.onSyncFailure(listened);
    }
  }

  ref.listen(audioHandlerEventsProvider, (_, next) {
    switch (next.value) {
      case .play:
        accumulator.onPlay();
        handleSync();
      case .pause:
        handleSync(isPaused: true);
      case .stop:
        handleSync(isClosing: true);
      case .seek:
        if (ref.read(isPlayingProvider)) handleSync();
      default:
        break;
    }
  });

  final timer = Timer.periodic(const Duration(seconds: 15), (_) {
    if (ref.read(isPlayingProvider)) handleSync();
  });

  ref.onDispose(timer.cancel);
}
