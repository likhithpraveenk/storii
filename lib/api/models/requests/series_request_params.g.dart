// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$SeriesRequestParamsToJson(
  SeriesRequestParams instance,
) => <String, dynamic>{
  'limit': ?instance.limit,
  'page': ?instance.page,
  'sort': ?instance.sort,
  'desc': ?_$JsonConverterToJson<int, bool>(
    instance.desc,
    const BoolBinaryConverter().toJson,
  ),
  'filter': ?_$JsonConverterToJson<String, Filter>(
    instance.filter,
    const FilterConverter().toJson,
  ),
  'minified': ?_$JsonConverterToJson<int, bool>(
    instance.minified,
    const BoolBinaryConverter().toJson,
  ),
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
