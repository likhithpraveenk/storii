import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';

part 'sleep_timer_provider.g.dart';

@Riverpod(keepAlive: true)
class SleepTimer extends _$SleepTimer {
  Timer? _ticker;
  static const _tick = Duration(seconds: 1);
  static const _max = Duration(hours: 12);

  Duration get fadeDuration => ref.read(fadeOnSleepDurationProvider);
  double get minVolume => ref.read(fadeOnSleepMinVolumeProvider);
  bool get canFade => ref.read(fadeOnSleepProvider);

  double? _initialVolume;

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
    _initialVolume = null;
    state = clamped;
    _ticker ??= Timer.periodic(_tick, (_) => _onTick());
  }

  void add(Duration delta) {
    final current = state ?? Duration.zero;
    set(current + delta);
  }

  void cancel() {
    _restoreVolume();
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
      _stopAudio();
    } else {
      state = next;
      if (canFade) _handleFade(next);
    }
  }

  void _handleFade(Duration remaining) {
    if (remaining > fadeDuration) {
      _initialVolume = null;
      return;
    }

    _initialVolume ??= ref.read(volumeProvider).value ?? 1.0;

    final startVol = _initialVolume!;
    if (startVol <= minVolume) return;

    final ratio = remaining.inSeconds / fadeDuration.inSeconds;
    final curveFactor = math.pow(ratio, 4).toDouble(); // quartic curve
    final targetVolume = minVolume + (startVol - minVolume) * curveFactor;

    audioHandler.setVolume(targetVolume.clamp(minVolume, startVol));
  }

  Future<void> _stopAudio() async {
    try {
      log('timer end. calling audio handler stop');
      await audioHandler.stop();
    } catch (e, st) {
      log('audioHandler.stop() failed: $e\n$st', name: 'SleepTimer');
    } finally {
      cancel();
    }
  }

  void _restoreVolume() {
    if (_initialVolume != null) {
      audioHandler.setVolume(_initialVolume!);
      _initialVolume = null;
    }
  }

  void _cancelTicker() {
    _ticker?.cancel();
    _ticker = null;
  }
}
