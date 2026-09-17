import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_timer_state.freezed.dart';

enum SleepTimerMode { duration, endOfChapter }

@freezed
sealed class SleepTimerState with _$SleepTimerState {
  const factory({
    required SleepTimerMode mode,
    required Duration remaining,
    required bool isPaused,
    int? targetChapterIndex,
    Duration? initialDuration,
    double? originalVolume,
  }) = _SleepTimerState;
}
