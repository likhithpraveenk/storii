// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookSearchResponse _$BookSearchResponseFromJson(Map<String, dynamic> json) =>
    BookSearchResponse(
      book:
          (readLibraryItemList(json, 'book') as List<dynamic>?)
              ?.map((e) => LibraryItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      narrators:
          (json['narrators'] as List<dynamic>?)
              ?.map((e) => SearchResultItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      authors:
          (json['authors'] as List<dynamic>?)
              ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)
              ?.map((e) => SearchResultItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      genres:
          (json['genres'] as List<dynamic>?)
              ?.map((e) => SearchResultItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      series:
          (readSeriesWithBooks(json, 'series') as List<dynamic>?)
              ?.map((e) => Series.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$BookSearchResponseToJson(BookSearchResponse instance) =>
    <String, dynamic>{
      'book': instance.book.map((e) => e.toJson()).toList(),
      'narrators': instance.narrators.map((e) => e.toJson()).toList(),
      'authors': instance.authors.map((e) => e.toJson()).toList(),
      'tags': instance.tags.map((e) => e.toJson()).toList(),
      'genres': instance.genres.map((e) => e.toJson()).toList(),
      'series': instance.series.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };

PodcastSearchResponse _$PodcastSearchResponseFromJson(
  Map<String, dynamic> json,
) => PodcastSearchResponse(
  podcast:
      (readLibraryItemList(json, 'podcast') as List<dynamic>?)
          ?.map((e) => LibraryItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  episodes:
      (readLibraryItemList(json, 'episodes') as List<dynamic>?)
          ?.map((e) => LibraryItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  tags:
      (json['tags'] as List<dynamic>?)
          ?.map((e) => SearchResultItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  genres:
      (json['genres'] as List<dynamic>?)
          ?.map((e) => SearchResultItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$PodcastSearchResponseToJson(
  PodcastSearchResponse instance,
) => <String, dynamic>{
  'podcast': instance.podcast.map((e) => e.toJson()).toList(),
  'episodes': instance.episodes.map((e) => e.toJson()).toList(),
  'tags': instance.tags.map((e) => e.toJson()).toList(),
  'genres': instance.genres.map((e) => e.toJson()).toList(),
  'runtimeType': instance.$type,
};

_SearchResultItem _$SearchResultItemFromJson(Map<String, dynamic> json) =>
    _SearchResultItem(
      name: json['name'] as String,
      numBooks: (json['numBooks'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SearchResultItemToJson(_SearchResultItem instance) =>
    <String, dynamic>{'name': instance.name, 'numBooks': instance.numBooks};
