// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_progress_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$UpsertProgressRequestParamsToJson(
  UpsertProgressRequestParams instance,
) => <String, dynamic>{
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
  'finishedAt': ?_$JsonConverterToJson<int, DateTime>(
    instance.finishedAt,
    const DateTimeEpochConverter().toJson,
  ),
  'startedAt': ?_$JsonConverterToJson<int, DateTime>(
    instance.startedAt,
    const DateTimeEpochConverter().toJson,
  ),
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
