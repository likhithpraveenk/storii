// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchBook _$SearchBookFromJson(Map<String, dynamic> json) => _SearchBook(
  title: json['title'] as String?,
  subtitle: json['subtitle'] as String?,
  author: json['author'] as String?,
  narrator: json['narrator'] as String?,
  publisher: json['publisher'] as String?,
  publishedYear: json['publishedYear'] as String?,
  description: json['description'] as String?,
  cover: json['cover'] as String?,
  asin: json['asin'] as String?,
  isbn: json['isbn'] as String?,
  genres:
      (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  series:
      (json['series'] as List<dynamic>?)
          ?.map((e) => SearchSeries.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  language: json['language'] as String?,
  duration: _$JsonConverterFromJson<int, Duration>(
    json['duration'],
    const DurationMinConverter().fromJson,
  ),
  region: json['region'] as String?,
  rating: json['rating'] as String?,
  abridged: json['abridged'] as bool? ?? false,
  descriptionPlain: json['descriptionPlain'] as String?,
  matchConfidence: (json['matchConfidence'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$SearchBookToJson(_SearchBook instance) =>
    <String, dynamic>{
      'title': ?instance.title,
      'subtitle': ?instance.subtitle,
      'author': ?instance.author,
      'narrator': ?instance.narrator,
      'publisher': ?instance.publisher,
      'publishedYear': ?instance.publishedYear,
      'description': ?instance.description,
      'cover': ?instance.cover,
      'asin': ?instance.asin,
      'isbn': ?instance.isbn,
      'genres': instance.genres,
      'tags': instance.tags,
      'series': instance.series.map((e) => e.toJson()).toList(),
      'language': ?instance.language,
      'duration': ?_$JsonConverterToJson<int, Duration>(
        instance.duration,
        const DurationMinConverter().toJson,
      ),
      'region': ?instance.region,
      'rating': ?instance.rating,
      'abridged': instance.abridged,
      'descriptionPlain': ?instance.descriptionPlain,
      'matchConfidence': instance.matchConfidence,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

_SearchSeries _$SearchSeriesFromJson(Map<String, dynamic> json) =>
    _SearchSeries(
      series: json['series'] as String,
      sequence: json['sequence'] as String?,
    );

Map<String, dynamic> _$SearchSeriesToJson(_SearchSeries instance) =>
    <String, dynamic>{
      'series': instance.series,
      'sequence': ?instance.sequence,
    };
