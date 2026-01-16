// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookMetadata _$BookMetadataFromJson(Map<String, dynamic> json) => BookMetadata(
  title: json['title'] as String?,
  titleIgnorePrefix: json['titleIgnorePrefix'] as String?,
  subtitle: json['subtitle'] as String?,
  authors: (json['authors'] as List<dynamic>?)
      ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
      .toList(),
  narrators: (json['narrators'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  series: (readSeries(json, 'series') as List<dynamic>?)
      ?.map((e) => Series.fromJson(e as Map<String, dynamic>))
      .toList(),
  genres:
      (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  publishedYear: json['publishedYear'] as String?,
  publishedDate: json['publishedDate'] as String?,
  publisher: json['publisher'] as String?,
  description: json['description'] as String?,
  isbn: json['isbn'] as String?,
  asin: json['asin'] as String?,
  language: json['language'] as String?,
  explicit: json['explicit'] as bool? ?? false,
  abridged: json['abridged'] as bool?,
  authorName: json['authorName'] as String?,
  authorNameLF: json['authorNameLF'] as String?,
  narratorName: json['narratorName'] as String?,
  seriesName: json['seriesName'] as String?,
  descriptionPlain: json['descriptionPlain'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$BookMetadataToJson(BookMetadata instance) =>
    <String, dynamic>{
      'title': ?instance.title,
      'titleIgnorePrefix': ?instance.titleIgnorePrefix,
      'subtitle': ?instance.subtitle,
      'authors': ?instance.authors?.map((e) => e.toJson()).toList(),
      'narrators': ?instance.narrators,
      'series': ?instance.series?.map((e) => e.toJson()).toList(),
      'genres': instance.genres,
      'publishedYear': ?instance.publishedYear,
      'publishedDate': ?instance.publishedDate,
      'publisher': ?instance.publisher,
      'description': ?instance.description,
      'isbn': ?instance.isbn,
      'asin': ?instance.asin,
      'language': ?instance.language,
      'explicit': instance.explicit,
      'abridged': ?instance.abridged,
      'authorName': ?instance.authorName,
      'authorNameLF': ?instance.authorNameLF,
      'narratorName': ?instance.narratorName,
      'seriesName': ?instance.seriesName,
      'descriptionPlain': ?instance.descriptionPlain,
      'runtimeType': instance.$type,
    };

PodcastMetadata _$PodcastMetadataFromJson(Map<String, dynamic> json) =>
    PodcastMetadata(
      title: json['title'] as String?,
      titleIgnorePrefix: json['titleIgnorePrefix'] as String?,
      author: json['author'] as String?,
      description: json['description'] as String?,
      releaseDate: json['releaseDate'] == null
          ? null
          : DateTime.parse(json['releaseDate'] as String),
      genres:
          (json['genres'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      feedUrl: json['feedUrl'] == null
          ? null
          : Uri.parse(json['feedUrl'] as String),
      imageUrl: json['imageUrl'] == null
          ? null
          : Uri.parse(json['imageUrl'] as String),
      itunesPageUrl: json['itunesPageUrl'] == null
          ? null
          : Uri.parse(json['itunesPageUrl'] as String),
      itunesId: (json['itunesId'] as num?)?.toInt(),
      itunesArtistId: (json['itunesArtistId'] as num?)?.toInt(),
      explicit: json['explicit'] as bool? ?? false,
      language: json['language'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PodcastMetadataToJson(PodcastMetadata instance) =>
    <String, dynamic>{
      'title': ?instance.title,
      'titleIgnorePrefix': ?instance.titleIgnorePrefix,
      'author': ?instance.author,
      'description': ?instance.description,
      'releaseDate': ?instance.releaseDate?.toIso8601String(),
      'genres': instance.genres,
      'feedUrl': ?instance.feedUrl?.toString(),
      'imageUrl': ?instance.imageUrl?.toString(),
      'itunesPageUrl': ?instance.itunesPageUrl?.toString(),
      'itunesId': ?instance.itunesId,
      'itunesArtistId': ?instance.itunesArtistId,
      'explicit': instance.explicit,
      'language': ?instance.language,
      'runtimeType': instance.$type,
    };
