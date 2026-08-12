// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
  id: json['id'] as String?,
  action: json['action'] as String?,
  data: json['data'] == null
      ? null
      : TaskData.fromJson(json['data'] as Map<String, dynamic>),
  title: json['title'] as String?,
  titleSubs: (json['titleSubs'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  description: json['description'] as String?,
  descriptionSubs: (json['descriptionSubs'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  error: json['error'] as String?,
  errorSubs: (json['errorSubs'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  showSuccess: json['showSuccess'] as bool? ?? false,
  isFailed: json['isFailed'] as bool? ?? false,
  isFinished: json['isFinished'] as bool? ?? false,
  startedAt: _$JsonConverterFromJson<int, DateTime>(
    json['startedAt'],
    const DateTimeEpochConverter().fromJson,
  ),
  finishedAt: _$JsonConverterFromJson<int, DateTime>(
    json['finishedAt'],
    const DateTimeEpochConverter().fromJson,
  ),
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'id': ?instance.id,
  'action': ?instance.action,
  'data': ?instance.data?.toJson(),
  'title': ?instance.title,
  'titleSubs': ?instance.titleSubs,
  'description': ?instance.description,
  'descriptionSubs': ?instance.descriptionSubs,
  'error': ?instance.error,
  'errorSubs': ?instance.errorSubs,
  'showSuccess': instance.showSuccess,
  'isFailed': instance.isFailed,
  'isFinished': instance.isFinished,
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

_TaskData _$TaskDataFromJson(Map<String, dynamic> json) => _TaskData(
  libraryId: json['libraryId'] as String?,
  libraryName: json['libraryName'] as String?,
  libraryMediaType: $enumDecodeNullable(
    _$MediaTypeEnumMap,
    json['libraryMediaType'],
  ),
  scanResults: json['scanResults'] == null
      ? null
      : TaskScanResults.fromJson(json['scanResults'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TaskDataToJson(_TaskData instance) => <String, dynamic>{
  'libraryId': ?instance.libraryId,
  'libraryName': ?instance.libraryName,
  'libraryMediaType': ?_$MediaTypeEnumMap[instance.libraryMediaType],
  'scanResults': ?instance.scanResults?.toJson(),
};

const _$MediaTypeEnumMap = {
  MediaType.book: 'book',
  MediaType.podcast: 'podcast',
};

_TaskScanResults _$TaskScanResultsFromJson(Map<String, dynamic> json) =>
    _TaskScanResults(
      added: (json['added'] as num?)?.toInt(),
      updated: (json['updated'] as num?)?.toInt(),
      missing: (json['missing'] as num?)?.toInt(),
      elapsed: (json['elapsed'] as num?)?.toInt(),
      text: json['text'] as String?,
    );

Map<String, dynamic> _$TaskScanResultsToJson(_TaskScanResults instance) =>
    <String, dynamic>{
      'added': ?instance.added,
      'updated': ?instance.updated,
      'missing': ?instance.missing,
      'elapsed': ?instance.elapsed,
      'text': ?instance.text,
    };
