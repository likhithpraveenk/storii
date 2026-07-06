import 'dart:async';
import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';

part 'sleep_timer_provider.g.dart';

@Riverpod(keepAlive: true)
class SleepTimer extends _$SleepTimer {
  Timer? _ticker;
  static const _tick = Duration(seconds: 1);
  static const _max = Duration(hours: 12);

  @override
  Duration? build() {
    ref.listen(sessionProvider, (_, next) {
      if (next == null) cancel();
    });

    ref.onDispose(_cancelTicker);
    return null;
  }

  void set(Duration duration) {
    final clamped = Duration(
      microseconds: duration.inMicroseconds.clamp(0, _max.inMicroseconds),
    );
    if (clamped == Duration.zero) {
      cancel();
      return;
    }
    state = clamped;
    _ticker ??= Timer.periodic(_tick, (_) => _onTick());
  }

  void add(Duration delta) {
    final current = state ?? Duration.zero;
    set(current + delta);
  }

  void cancel() {
    _cancelTicker();
    state = null;
  }

  void _onTick() {
    if (_ticker == null) return;

    final current = state;
    if (current == null) {
      cancel();
      return;
    }

    final next = current - _tick;
    if (next <= Duration.zero) {
      cancel();
      _stopAudio();
    } else {
      state = next;
    }
  }

  Future<void> _stopAudio() async {
    try {
      log('timer end. calling audio handler stop');
      // TODO: add audio fade-out 30sec
      await audioHandler.stop();
    } catch (e, st) {
      log('audioHandler.stop() failed: $e\n$st', name: 'SleepTimer');
    }
  }

  void _cancelTicker() {
    _ticker?.cancel();
    _ticker = null;
  }
}
