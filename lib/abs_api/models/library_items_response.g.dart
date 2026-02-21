// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_items_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LibraryItemsResponse _$LibraryItemsResponseFromJson(
  Map<String, dynamic> json,
) => _LibraryItemsResponse(
  results: (json['results'] as List<dynamic>)
      .map((e) => LibraryItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  sortBy: json['sortBy'] as String?,
  sortDesc: json['sortDesc'] as bool,
  filterBy: const FilterConverter().fromJson(json['filterBy'] as String?),
  mediaType: $enumDecode(_$MediaTypeEnumMap, json['mediaType']),
  minified: json['minified'] as bool,
  collapseSeries: json['collapseseries'] as bool,
  include: json['include'] as String,
);

Map<String, dynamic> _$LibraryItemsResponseToJson(
  _LibraryItemsResponse instance,
) => <String, dynamic>{
  'results': instance.results.map((e) => e.toJson()).toList(),
  'total': instance.total,
  'limit': instance.limit,
  'page': instance.page,
  'sortBy': ?instance.sortBy,
  'sortDesc': instance.sortDesc,
  'filterBy': ?const FilterConverter().toJson(instance.filterBy),
  'mediaType': _$MediaTypeEnumMap[instance.mediaType]!,
  'minified': instance.minified,
  'collapseseries': instance.collapseSeries,
  'include': instance.include,
};

const _$MediaTypeEnumMap = {
  MediaType.book: 'book',
  MediaType.podcast: 'podcast',
};
