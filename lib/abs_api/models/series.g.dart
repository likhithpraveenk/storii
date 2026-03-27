// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Series _$SeriesFromJson(Map<String, dynamic> json) => _Series(
  id: json['id'] as String,
  name: json['name'] as String,
  libraryId: json['libraryId'] as String?,
  nameIgnorePrefix: json['nameIgnorePrefix'] as String?,
  description: json['description'] as String?,
  addedAt: _$JsonConverterFromJson<int, DateTime>(
    json['addedAt'],
    const DateTimeEpochConverter().fromJson,
  ),
  updatedAt: _$JsonConverterFromJson<int, DateTime>(
    json['updatedAt'],
    const DateTimeEpochConverter().fromJson,
  ),
  books:
      (_booksOrItems(json, 'books') as List<dynamic>?)
          ?.map((e) => LibraryItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  numBooks: (json['numBooks'] as num?)?.toInt(),
  sequence: json['sequence'] as String?,
  seriesSequenceList: json['seriesSequenceList'] as String?,
  libraryItemIds: (json['libraryItemIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  progress: json['progress'] == null
      ? null
      : SeriesProgress.fromJson(json['progress'] as Map<String, dynamic>),
  inProgress: json['inProgress'] as bool?,
  hasActiveBook: json['hasActiveBook'] as bool?,
  hideFromContinueListening: json['hideFromContinueListening'] as bool?,
  bookInProgressLastUpdate: _$JsonConverterFromJson<int, DateTime>(
    json['bookInProgressLastUpdate'],
    const DateTimeEpochConverter().fromJson,
  ),
  firstBookUnread: json['firstBookUnread'] == null
      ? null
      : LibraryItem.fromJson(json['firstBookUnread'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SeriesToJson(_Series instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'libraryId': ?instance.libraryId,
  'nameIgnorePrefix': ?instance.nameIgnorePrefix,
  'description': ?instance.description,
  'addedAt': ?_$JsonConverterToJson<int, DateTime>(
    instance.addedAt,
    const DateTimeEpochConverter().toJson,
  ),
  'updatedAt': ?_$JsonConverterToJson<int, DateTime>(
    instance.updatedAt,
    const DateTimeEpochConverter().toJson,
  ),
  'books': instance.books.map((e) => e.toJson()).toList(),
  'numBooks': ?instance.numBooks,
  'sequence': ?instance.sequence,
  'seriesSequenceList': ?instance.seriesSequenceList,
  'libraryItemIds': ?instance.libraryItemIds,
  'progress': ?instance.progress?.toJson(),
  'inProgress': ?instance.inProgress,
  'hasActiveBook': ?instance.hasActiveBook,
  'hideFromContinueListening': ?instance.hideFromContinueListening,
  'bookInProgressLastUpdate': ?_$JsonConverterToJson<int, DateTime>(
    instance.bookInProgressLastUpdate,
    const DateTimeEpochConverter().toJson,
  ),
  'firstBookUnread': ?instance.firstBookUnread?.toJson(),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
