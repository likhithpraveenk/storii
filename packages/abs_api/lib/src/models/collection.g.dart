// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Collection _$CollectionFromJson(Map<String, dynamic> json) => _Collection(
  id: json['id'] as String,
  libraryId: json['libraryId'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  lastUpdate: const DateTimeEpochConverter().fromJson(
    (json['lastUpdate'] as num).toInt(),
  ),
  createdAt: const DateTimeEpochConverter().fromJson(
    (json['createdAt'] as num).toInt(),
  ),
  books: (json['books'] as List<dynamic>)
      .map((e) => LibraryItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CollectionToJson(_Collection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'libraryId': instance.libraryId,
      'name': instance.name,
      'description': ?instance.description,
      'lastUpdate': const DateTimeEpochConverter().toJson(instance.lastUpdate),
      'createdAt': const DateTimeEpochConverter().toJson(instance.createdAt),
      'books': instance.books.map((e) => e.toJson()).toList(),
    };
