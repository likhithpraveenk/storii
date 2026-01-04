// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeriesResponse _$SeriesResponseFromJson(Map<String, dynamic> json) =>
    _SeriesResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => Series.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      sortBy: json['sortBy'] as String?,
      sortDesc: json['sortDesc'] as bool,
      filterBy: _$JsonConverterFromJson<String, Filter>(
        json['filterBy'],
        const FilterConverter().fromJson,
      ),
      minified: json['minified'] as bool,
      include: json['include'] as String,
    );

Map<String, dynamic> _$SeriesResponseToJson(_SeriesResponse instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'limit': instance.limit,
      'page': instance.page,
      'sortBy': instance.sortBy,
      'sortDesc': instance.sortDesc,
      'filterBy': _$JsonConverterToJson<String, Filter>(
        instance.filterBy,
        const FilterConverter().toJson,
      ),
      'minified': instance.minified,
      'include': instance.include,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
