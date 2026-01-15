import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/models/books/playback_session.dart';
import 'package:storii/api/models/media/media_metadata.dart';
import 'package:storii/api/models/utils/enums.dart';
import 'package:storii/api/models/utils/json_converters.dart';

part 'user_stats_response.freezed.dart';
part 'user_stats_response.g.dart';

@freezed
abstract class UserStatsResponse with _$UserStatsResponse {
  @DurationSecConverter()
  const factory UserStatsResponse({
    required Duration totalTime,
    required Map<String, ItemsListenedToResponse> items,
    @JsonKey(toJson: _daysToJson) required Map<DateTime, Duration> days,
    required Map<DayOfTheWeek, Duration> dayOfWeek,
    required Duration today,
    required List<PlaybackSession> recentSessions,
  }) = _UserStatsResponse;

  factory UserStatsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserStatsResponseFromJson(json);
}

Map<String, int> _daysToJson(Map<DateTime, Duration> days) {
  return {
    for (final day in days.entries)
      _dateTimeToDateString(day.key): day.value.inSeconds,
  };
}

String _dateTimeToDateString(DateTime date) {
  final year = date.year.toString().padLeft(4, '0');
  final month = date.month.toString().padLeft(2, '0');
  final day = date.day.toString().padLeft(2, '0');
  return '$year-$month-$day';
}

@freezed
abstract class ItemsListenedToResponse with _$ItemsListenedToResponse {
  @DurationSecConverter()
  const factory ItemsListenedToResponse({
    @JsonKey(name: 'id') required String libraryItemId,
    required Duration timeListening,
    required MediaMetadata mediaMetadata,
  }) = _ItemsListenedToResponse;

  factory ItemsListenedToResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemsListenedToResponseFromJson(json);
}
