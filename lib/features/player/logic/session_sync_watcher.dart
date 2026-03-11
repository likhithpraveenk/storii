import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';

part 'session_sync_watcher.g.dart';

class ListenTimeAccumulator {
  DateTime? _playStartedAt;
  Duration _unsynced = Duration.zero;

  void start() {
    _playStartedAt ??= DateTime.now();
  }

  void pause() {
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

  void reset() {
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

  Future<void> sync({required bool keepRunning}) async {
    final listened = _accumulator.snapshotAndReset(keepRunning: keepRunning);
    try {
      await ref.read(sessionProvider.notifier).sync(listened);
    } catch (_) {
      _accumulator.rollback(listened);
    }
  }

  Future<void> stop({bool didComplete = false}) async {
    try {
      await ref.read(sessionProvider.notifier).close(didComplete: didComplete);
    } catch (_) {
    } finally {
      _accumulator.reset();
    }
  }

  void startClock() => _accumulator.start();
  void pauseClock() => _accumulator.pause();
}

@Riverpod(keepAlive: true)
void sessionSyncWatcher(Ref ref) {
  final session = ref.watch(sessionProvider);
  if (session == null) return;
  final interval = ref.watch(syncIntervalProvider);

  ref.listen(audioHandlerEventsProvider, (_, next) {
    final listenTime = ref.read(listenTimeProvider.notifier);
    switch (next.value) {
      case .play:
        listenTime.startClock();
      case .buffering:
        listenTime.pauseClock();
      case .pause:
        listenTime.sync(keepRunning: false);
      case .seek:
        listenTime.sync(keepRunning: ref.read(isPlayingProvider));
      case .stop:
        listenTime.stop();
      case .complete:
        listenTime.stop(didComplete: true);
      default:
        break;
    }
  });

  final timer = Timer.periodic(interval, (_) {
    if (ref.read(isPlayingProvider)) {
      ref.read(listenTimeProvider.notifier).sync(keepRunning: true);
    }
  });

  ref.onDispose(timer.cancel);
}
