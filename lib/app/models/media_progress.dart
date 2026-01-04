import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_progress.freezed.dart';

@freezed
sealed class MediaProgress with _$MediaProgress {
  const factory MediaProgress({
    required String libraryItemId,
    required String userId,

    required Duration duration,
    @Default(0) double progress,
    Duration? currentDuration,

    @Default(false) bool isFinished,
    @Default(false) bool hideFromContinueListening,

    DateTime? lastUpdate,
    DateTime? startedAt,
    DateTime? finishedAt,
  }) = _MediaProgress;
}
