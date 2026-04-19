// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeriesRequestParams _$SeriesRequestParamsFromJson(Map<String, dynamic> json) =>
    _SeriesRequestParams(
      limit: (json['limit'] as num?)?.toInt() ?? 0,
      page: (json['page'] as num?)?.toInt() ?? 0,
      sort: json['sort'] as String?,
      desc: _$JsonConverterFromJson<int, bool>(
        json['desc'],
        const BoolBinaryConverter().fromJson,
      ),
      filter: const FilterConverter().fromJson(json['filter'] as String?),
    );

Map<String, dynamic> _$SeriesRequestParamsToJson(
  _SeriesRequestParams instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'page': instance.page,
  'sort': ?instance.sort,
  'desc': ?_$JsonConverterToJson<int, bool>(
    instance.desc,
    const BoolBinaryConverter().toJson,
  ),
  'filter': ?const FilterConverter().toJson(instance.filter),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
