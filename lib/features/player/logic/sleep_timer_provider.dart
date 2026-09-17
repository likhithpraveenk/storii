import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/models/sleep_timer_state.dart';

part 'sleep_timer_provider.g.dart';

@Riverpod(keepAlive: true)
class SleepTimer extends _$SleepTimer {
  Timer? _ticker;
  static const _tick = Duration(seconds: 1);

  Duration get fadeDuration => ref.read(fadeOnSleepDurationProvider);
  double get minVolume => ref.read(fadeOnSleepMinVolumeProvider);
  bool get canFade => ref.read(fadeOnSleepProvider);

  VolumeControl get _volumeController =>
      ref.read(volumeControlProvider.notifier);

  @override
  SleepTimerState? build() {
    ref.listen(sessionProvider, (_, next) {
      if (next == null) cancel();
    });

    ref.listen(isPlayingStreamProvider, (_, isPlayingAsync) {
      final currentState = state;
      if (currentState == null) return;
      state = currentState.copyWith(isPaused: !(isPlayingAsync.value == true));
    });

    ref.onDispose(_cancelTicker);
    return null;
  }

  Future<void> setEndAtChapter(int numberOfChapters) async {
    final chapters = ref.read(chapterListProvider);
    if (chapters.isEmpty) return;

    final currentChapter = ref.read(currentChapterProvider).value;
    if (currentChapter == null) return;

    final endIndex = (currentChapter.index + numberOfChapters - 1).clamp(
      currentChapter.index,
      chapters.length - 1,
    );

    final realTimeRemaining = _remainingUntilChapter(endIndex);
    if (realTimeRemaining == null) return;

    if (state?.originalVolume != null) {
      _restoreVolume();
    }

    final isPlaying = ref.read(isPlayingProvider);
    state = SleepTimerState(
      mode: .endOfChapter,
      remaining: realTimeRemaining,
      targetChapterIndex: endIndex,
      isPaused: !isPlaying,
      originalVolume: ref.read(volumeProvider).value ?? 1.0,
    );
    _ticker ??= Timer.periodic(_tick, (_) => _onTick());
  }

  void set(Duration duration) {
    if (duration == Duration.zero) {
      cancel();
      return;
    }
    _restoreVolume();

    final isPlaying = ref.read(isPlayingProvider);
    state = SleepTimerState(
      mode: .duration,
      remaining: duration,
      initialDuration: duration,
      isPaused: !isPlaying,
      originalVolume: ref.read(volumeProvider).value ?? 1.0,
    );
    _ticker ??= Timer.periodic(_tick, (_) => _onTick());
  }

  bool restart() {
    final currentState = state;
    if (currentState == null) return false;

    if (currentState.mode == .duration) {
      final initial = currentState.initialDuration;
      if (initial != null) {
        cancel();
        set(initial);
        return true;
      }
    }
    return false;
  }

  bool add(Duration delta) {
    final current = state;
    if (current == null) return false;

    if (current.mode == .duration) {
      final newRemaining = current.remaining + delta;
      if (newRemaining <= Duration.zero) {
        cancel();
        return false;
      }
      state = current.copyWith(
        remaining: newRemaining,
        initialDuration: current.initialDuration ?? newRemaining,
      );
      return true;
    }
    return false;
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

    if (current.isPaused) return;

    switch (current.mode) {
      case .duration:
        final next = current.remaining - _tick;
        if (next <= Duration.zero) {
          _stopAudio();
        } else {
          state = current.copyWith(remaining: next);
          if (canFade) _handleFade(next);
        }
      case .endOfChapter:
        final realTimeRemaining = _remainingUntilChapter(
          current.targetChapterIndex,
        );
        if (realTimeRemaining == null) {
          _stopAudio();
          return;
        }

        state = current.copyWith(remaining: realTimeRemaining);
        if (canFade) _handleFade(realTimeRemaining);
    }
  }

  Duration? _remainingUntilChapter(int? targetChapterIndex) {
    final chapters = ref.read(chapterListProvider);
    if (targetChapterIndex == null || targetChapterIndex >= chapters.length) {
      return null;
    }

    final audioRemaining =
        chapters[targetChapterIndex].end - audioHandler.currentPosition;
    if (audioRemaining <= Duration.zero) return null;

    final speed = ref.read(localSpeedProvider);
    final scaleTimeBySpeed = ref.read(scaleTimeBySpeedProvider);
    return Duration(
      microseconds: scaleTimeBySpeed
          ? (audioRemaining.inMicroseconds / speed).round()
          : audioRemaining.inMicroseconds,
    );
  }

  void _handleFade(Duration remaining) {
    if (remaining > fadeDuration) {
      return;
    }

    final startVol = state?.originalVolume;
    if (startVol == null) return;

    if (startVol <= minVolume) return;

    final ratio = remaining.inSeconds / fadeDuration.inSeconds;
    final curveFactor = math.pow(ratio, 4).toDouble(); // quartic curve
    final targetVolume = minVolume + (startVol - minVolume) * curveFactor;

    _volumeController.setVolume(targetVolume.clamp(minVolume, startVol));
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
    final vol = state?.originalVolume;
    if (vol != null) {
      _volumeController.setVolume(vol);
    }
  }

  void _cancelTicker() {
    _ticker?.cancel();
    _ticker = null;
  }
}
