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
      filterBy: const FilterConverter().fromJson(json['filterBy'] as String?),
      minified: json['minified'] as bool,
      include: json['include'] as String,
    );

Map<String, dynamic> _$SeriesResponseToJson(_SeriesResponse instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'limit': instance.limit,
      'page': instance.page,
      'sortBy': ?instance.sortBy,
      'sortDesc': instance.sortDesc,
      'filterBy': ?const FilterConverter().toJson(instance.filterBy),
      'minified': instance.minified,
      'include': instance.include,
    };
