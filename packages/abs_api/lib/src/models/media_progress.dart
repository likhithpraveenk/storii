import 'package:abs_api/src/models/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_progress.freezed.dart';
part 'media_progress.g.dart';

@freezed
sealed class MediaProgress with _$MediaProgress {
  const factory MediaProgress({
    required String id,
    required String libraryItemId,
    String? episodeId,
    @DurationPreciseSecondsConverter() Duration? duration,
    double? progress,
    @DurationPreciseSecondsConverter() Duration? currentTime,
    bool? isFinished,
    bool? hideFromContinueListening,
    @DateTimeEpochConverter() DateTime? lastUpdate,
    @DateTimeEpochConverter() DateTime? startedAt,
    @DateTimeEpochConverter() DateTime? finishedAt,
  }) = _MediaProgress;

  factory MediaProgress.fromJson(Map<String, dynamic> json) =>
      _$MediaProgressFromJson(json);
}
