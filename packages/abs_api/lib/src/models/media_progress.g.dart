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
      duration: _$JsonConverterFromJson<Object, Duration>(
        json['duration'],
        const DurationPreciseSecondsConverter().fromJson,
      ),
      progress: (json['progress'] as num?)?.toDouble(),
      currentTime: _$JsonConverterFromJson<Object, Duration>(
        json['currentTime'],
        const DurationPreciseSecondsConverter().fromJson,
      ),
      isFinished: json['isFinished'] as bool?,
      hideFromContinueListening: json['hideFromContinueListening'] as bool?,
      lastUpdate: _$JsonConverterFromJson<int, DateTime>(
        json['lastUpdate'],
        const DateTimeEpochConverter().fromJson,
      ),
      startedAt: _$JsonConverterFromJson<int, DateTime>(
        json['startedAt'],
        const DateTimeEpochConverter().fromJson,
      ),
      finishedAt: _$JsonConverterFromJson<int, DateTime>(
        json['finishedAt'],
        const DateTimeEpochConverter().fromJson,
      ),
    );

Map<String, dynamic> _$MediaProgressToJson(_MediaProgress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'libraryItemId': instance.libraryItemId,
      'episodeId': ?instance.episodeId,
      'duration': ?_$JsonConverterToJson<Object, Duration>(
        instance.duration,
        const DurationPreciseSecondsConverter().toJson,
      ),
      'progress': ?instance.progress,
      'currentTime': ?_$JsonConverterToJson<Object, Duration>(
        instance.currentTime,
        const DurationPreciseSecondsConverter().toJson,
      ),
      'isFinished': ?instance.isFinished,
      'hideFromContinueListening': ?instance.hideFromContinueListening,
      'lastUpdate': ?_$JsonConverterToJson<int, DateTime>(
        instance.lastUpdate,
        const DateTimeEpochConverter().toJson,
      ),
      'startedAt': ?_$JsonConverterToJson<int, DateTime>(
        instance.startedAt,
        const DateTimeEpochConverter().toJson,
      ),
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
