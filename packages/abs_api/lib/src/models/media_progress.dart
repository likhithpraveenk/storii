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
    @DurationPreciseSecondsConverter() required Duration duration,
    double? progress,
    @DurationPreciseSecondsConverter()
    @JsonKey(readValue: _readDuration)
    required Duration currentTime,
    required bool isFinished,
    required bool hideFromContinueListening,
    @DateTimeEpochConverter() required DateTime lastUpdate,
    @DateTimeEpochConverter() required DateTime startedAt,
    @DateTimeEpochConverter() DateTime? finishedAt,
  }) = _MediaProgress;

  factory MediaProgress.fromJson(Map<String, dynamic> json) =>
      _$MediaProgressFromJson(json);
}

Object? _readDuration(Map json, String key) {
  final value = json[key];
  if (value is num) return value;
  return num.tryParse(value);
}
