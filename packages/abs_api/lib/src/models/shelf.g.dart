// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LibraryItemsShelf _$LibraryItemsShelfFromJson(Map<String, dynamic> json) =>
    LibraryItemsShelf(
      id: json['id'] as String,
      label: json['label'] as String,
      labelStringKey: json['labelStringKey'] as String,
      type: $enumDecode(_$ShelfTypeEnumMap, json['type']),
      entities: (json['entities'] as List<dynamic>)
          .map((e) => LibraryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$LibraryItemsShelfToJson(LibraryItemsShelf instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'labelStringKey': instance.labelStringKey,
      'type': _$ShelfTypeEnumMap[instance.type]!,
      'entities': instance.entities.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'runtimeType': instance.$type,
    };

const _$ShelfTypeEnumMap = {
  ShelfType.book: 'book',
  ShelfType.series: 'series',
  ShelfType.authors: 'authors',
  ShelfType.episode: 'episode',
  ShelfType.podcast: 'podcast',
};

SeriesShelf _$SeriesShelfFromJson(Map<String, dynamic> json) => SeriesShelf(
  id: json['id'] as String,
  label: json['label'] as String,
  labelStringKey: json['labelStringKey'] as String,
  type: $enumDecode(_$ShelfTypeEnumMap, json['type']),
  entities: (json['entities'] as List<dynamic>)
      .map((e) => Series.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SeriesShelfToJson(SeriesShelf instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'labelStringKey': instance.labelStringKey,
      'type': _$ShelfTypeEnumMap[instance.type]!,
      'entities': instance.entities.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'runtimeType': instance.$type,
    };

AuthorShelf _$AuthorShelfFromJson(Map<String, dynamic> json) => AuthorShelf(
  id: json['id'] as String,
  label: json['label'] as String,
  labelStringKey: json['labelStringKey'] as String,
  type: $enumDecode(_$ShelfTypeEnumMap, json['type']),
  entities: (json['entities'] as List<dynamic>)
      .map((e) => Author.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$AuthorShelfToJson(AuthorShelf instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'labelStringKey': instance.labelStringKey,
      'type': _$ShelfTypeEnumMap[instance.type]!,
      'entities': instance.entities.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'runtimeType': instance.$type,
    };
