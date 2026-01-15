// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Author _$AuthorFromJson(Map<String, dynamic> json) => _Author(
  id: json['id'] as String,
  name: json['name'] as String,
  lastFirst: json['lastFirst'] as String?,
  libraryId: json['libraryId'] as String?,
  asin: json['asin'] as String?,
  description: json['description'] as String?,
  imagePath: json['imagePath'] as String?,
  addedAt: _$JsonConverterFromJson<int, DateTime>(
    json['addedAt'],
    const DateTimeEpochConverter().fromJson,
  ),
  updatedAt: _$JsonConverterFromJson<int, DateTime>(
    json['updatedAt'],
    const DateTimeEpochConverter().fromJson,
  ),
  numBooks: (json['numBooks'] as num?)?.toInt(),
  libraryItems: (json['libraryItems'] as List<dynamic>?)
      ?.map((e) => LibraryItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  series: (json['series'] as List<dynamic>?)
      ?.map((e) => Series.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AuthorToJson(_Author instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'lastFirst': instance.lastFirst,
  'libraryId': instance.libraryId,
  'asin': instance.asin,
  'description': instance.description,
  'imagePath': instance.imagePath,
  'addedAt': _$JsonConverterToJson<int, DateTime>(
    instance.addedAt,
    const DateTimeEpochConverter().toJson,
  ),
  'updatedAt': _$JsonConverterToJson<int, DateTime>(
    instance.updatedAt,
    const DateTimeEpochConverter().toJson,
  ),
  'numBooks': instance.numBooks,
  'libraryItems': instance.libraryItems?.map((e) => e.toJson()).toList(),
  'series': instance.series?.map((e) => e.toJson()).toList(),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
