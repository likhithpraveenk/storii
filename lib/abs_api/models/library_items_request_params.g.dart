// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_items_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LibraryItemsRequestParams _$LibraryItemsRequestParamsFromJson(
  Map<String, dynamic> json,
) => _LibraryItemsRequestParams(
  limit: (json['limit'] as num?)?.toInt() ?? 0,
  page: (json['page'] as num?)?.toInt() ?? 0,
  sort: json['sort'] as String?,
  desc: _$JsonConverterFromJson<int, bool>(
    json['desc'],
    const BoolBinaryConverter().fromJson,
  ),
  filter: const FilterConverter().fromJson(json['filter'] as String?),
  collapseSeries: _$JsonConverterFromJson<int, bool>(
    json['collapseseries'],
    const BoolBinaryConverter().fromJson,
  ),
);

Map<String, dynamic> _$LibraryItemsRequestParamsToJson(
  _LibraryItemsRequestParams instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'page': instance.page,
  'sort': ?instance.sort,
  'desc': ?_$JsonConverterToJson<int, bool>(
    instance.desc,
    const BoolBinaryConverter().toJson,
  ),
  'filter': ?const FilterConverter().toJson(instance.filter),
  'collapseseries': ?_$JsonConverterToJson<int, bool>(
    instance.collapseSeries,
    const BoolBinaryConverter().toJson,
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
