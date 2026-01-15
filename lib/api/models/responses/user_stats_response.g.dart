// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserStatsResponse _$UserStatsResponseFromJson(Map<String, dynamic> json) =>
    _UserStatsResponse(
      totalTime: const DurationSecConverter().fromJson(
        (json['totalTime'] as num).toInt(),
      ),
      items: (json['items'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          k,
          ItemsListenedToResponse.fromJson(e as Map<String, dynamic>),
        ),
      ),
      days: (json['days'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          DateTime.parse(k),
          const DurationSecConverter().fromJson((e as num).toInt()),
        ),
      ),
      dayOfWeek: (json['dayOfWeek'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          $enumDecode(_$DayOfTheWeekEnumMap, k),
          const DurationSecConverter().fromJson((e as num).toInt()),
        ),
      ),
      today: const DurationSecConverter().fromJson(
        (json['today'] as num).toInt(),
      ),
      recentSessions: (json['recentSessions'] as List<dynamic>)
          .map((e) => PlaybackSession.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserStatsResponseToJson(_UserStatsResponse instance) =>
    <String, dynamic>{
      'totalTime': const DurationSecConverter().toJson(instance.totalTime),
      'items': instance.items.map((k, e) => MapEntry(k, e.toJson())),
      'days': _daysToJson(instance.days),
      'dayOfWeek': instance.dayOfWeek.map(
        (k, e) => MapEntry(
          _$DayOfTheWeekEnumMap[k]!,
          const DurationSecConverter().toJson(e),
        ),
      ),
      'today': const DurationSecConverter().toJson(instance.today),
      'recentSessions': instance.recentSessions.map((e) => e.toJson()).toList(),
    };

const _$DayOfTheWeekEnumMap = {
  DayOfTheWeek.sunday: 'Sunday',
  DayOfTheWeek.monday: 'Monday',
  DayOfTheWeek.tuesday: 'Tuesday',
  DayOfTheWeek.wednesday: 'Wednesday',
  DayOfTheWeek.thursday: 'Thursday',
  DayOfTheWeek.friday: 'Friday',
  DayOfTheWeek.saturday: 'Saturday',
};

_ItemsListenedToResponse _$ItemsListenedToResponseFromJson(
  Map<String, dynamic> json,
) => _ItemsListenedToResponse(
  libraryItemId: json['id'] as String,
  timeListening: const DurationSecConverter().fromJson(
    (json['timeListening'] as num).toInt(),
  ),
  mediaMetadata: MediaMetadata.fromJson(
    json['mediaMetadata'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ItemsListenedToResponseToJson(
  _ItemsListenedToResponse instance,
) => <String, dynamic>{
  'id': instance.libraryItemId,
  'timeListening': const DurationSecConverter().toJson(instance.timeListening),
  'mediaMetadata': instance.mediaMetadata.toJson(),
};
