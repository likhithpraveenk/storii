// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MediaProgress _$MediaProgressFromJson(Map<String, dynamic> json) =>
    _MediaProgress(
      id: json['id'] as String,
      libraryItemId: json['libraryItemId'] as String,
      episodeId: json['episodeId'] as String?,
      duration: const DurationPreciseSecondsConverter().fromJson(
        json['duration'] as num,
      ),
      progress: (json['progress'] as num?)?.toDouble(),
      currentTime: const DurationPreciseSecondsConverter().fromJson(
        json['currentTime'] as num,
      ),
      isFinished: json['isFinished'] as bool,
      hideFromContinueListening: json['hideFromContinueListening'] as bool,
      lastUpdate: const DateTimeEpochConverter().fromJson(
        (json['lastUpdate'] as num).toInt(),
      ),
      startedAt: const DateTimeEpochConverter().fromJson(
        (json['startedAt'] as num).toInt(),
      ),
      finishedAt: _$JsonConverterFromJson<int, DateTime>(
        json['finishedAt'],
        const DateTimeEpochConverter().fromJson,
      ),
    );

Map<String, dynamic> _$MediaProgressToJson(
  _MediaProgress instance,
) => <String, dynamic>{
  'id': instance.id,
  'libraryItemId': instance.libraryItemId,
  'episodeId': ?instance.episodeId,
  'duration': const DurationPreciseSecondsConverter().toJson(instance.duration),
  'progress': ?instance.progress,
  'currentTime': const DurationPreciseSecondsConverter().toJson(
    instance.currentTime,
  ),
  'isFinished': instance.isFinished,
  'hideFromContinueListening': instance.hideFromContinueListening,
  'lastUpdate': const DateTimeEpochConverter().toJson(instance.lastUpdate),
  'startedAt': const DateTimeEpochConverter().toJson(instance.startedAt),
  'finishedAt': ?_$JsonConverterToJson<int, DateTime>(
    instance.finishedAt,
    const DateTimeEpochConverter().toJson,
  ),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
