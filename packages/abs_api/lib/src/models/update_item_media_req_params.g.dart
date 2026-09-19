// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_item_media_req_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBookReqParams _$UpdateBookReqParamsFromJson(Map<String, dynamic> json) =>
    UpdateBookReqParams(
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      metadata: json['metadata'] == null
          ? null
          : UpdateMediaMetadataReqParams.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UpdateBookReqParamsToJson(
  UpdateBookReqParams instance,
) => <String, dynamic>{
  'tags': ?instance.tags,
  'metadata': ?instance.metadata?.toJson(),
  'runtimeType': instance.$type,
};

UpdatePodcastReqParams _$UpdatePodcastReqParamsFromJson(
  Map<String, dynamic> json,
) => UpdatePodcastReqParams(
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  metadata: json['metadata'] == null
      ? null
      : UpdateMediaMetadataReqParams.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
  autoDownloadEpisodes: json['autoDownloadEpisodes'] as bool?,
  lastEpisodeCheck: json['lastEpisodeCheck'] == null
      ? null
      : DateTime.parse(json['lastEpisodeCheck'] as String),
  maxEpisodesToKeep: (json['maxEpisodesToKeep'] as num?)?.toInt(),
  maxNewEpisodesToDownload: (json['maxNewEpisodesToDownload'] as num?)?.toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$UpdatePodcastReqParamsToJson(
  UpdatePodcastReqParams instance,
) => <String, dynamic>{
  'tags': ?instance.tags,
  'metadata': ?instance.metadata?.toJson(),
  'autoDownloadEpisodes': ?instance.autoDownloadEpisodes,
  'lastEpisodeCheck': instance.lastEpisodeCheck?.toIso8601String(),
  'maxEpisodesToKeep': ?instance.maxEpisodesToKeep,
  'maxNewEpisodesToDownload': ?instance.maxNewEpisodesToDownload,
  'runtimeType': instance.$type,
};

UpdateBookMetadataReqParams _$UpdateBookMetadataReqParamsFromJson(
  Map<String, dynamic> json,
) => UpdateBookMetadataReqParams(
  title: json['title'] as String?,
  subtitle: json['subtitle'] as String?,
  authors: (json['authors'] as List<dynamic>?)
      ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
      .toList(),
  narrators: (json['narrators'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  series: (json['series'] as List<dynamic>?)
      ?.map((e) => Series.fromJson(e as Map<String, dynamic>))
      .toList(),
  genres: (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
  publishedYear: json['publishedYear'] as String?,
  publishedDate: json['publishedDate'] as String?,
  publisher: json['publisher'] as String?,
  description: json['description'] as String?,
  isbn: json['isbn'] as String?,
  asin: json['asin'] as String?,
  language: json['language'] as String?,
  explicit: json['explicit'] as bool?,
  abridged: json['abridged'] as bool?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$UpdateBookMetadataReqParamsToJson(
  UpdateBookMetadataReqParams instance,
) => <String, dynamic>{
  'title': ?instance.title,
  'subtitle': ?instance.subtitle,
  'authors': ?instance.authors?.map((e) => e.toJson()).toList(),
  'narrators': ?instance.narrators,
  'series': ?instance.series?.map((e) => e.toJson()).toList(),
  'genres': ?instance.genres,
  'publishedYear': ?instance.publishedYear,
  'publishedDate': ?instance.publishedDate,
  'publisher': ?instance.publisher,
  'description': ?instance.description,
  'isbn': ?instance.isbn,
  'asin': ?instance.asin,
  'language': ?instance.language,
  'explicit': ?instance.explicit,
  'abridged': ?instance.abridged,
  'runtimeType': instance.$type,
};

UpdatePodcastMetadataReqParams _$UpdatePodcastMetadataReqParamsFromJson(
  Map<String, dynamic> json,
) => UpdatePodcastMetadataReqParams(
  title: json['title'] as String?,
  author: json['author'] as String?,
  description: json['description'] as String?,
  releaseDate: json['releaseDate'] as String?,
  genres: (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
  feedUrl: json['feedUrl'] as String?,
  imageUrl: json['imageUrl'] as String?,
  itunesPageUrl: json['itunesPageUrl'] as String?,
  itunesId: json['itunesId'] as String?,
  itunesArtistId: json['itunesArtistId'] as String?,
  podcastType: $enumDecodeNullable(_$PodcastTypeEnumMap, json['podcastType']),
  explicit: json['explicit'] as bool?,
  language: json['language'] as String?,
  type: json['type'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$UpdatePodcastMetadataReqParamsToJson(
  UpdatePodcastMetadataReqParams instance,
) => <String, dynamic>{
  'title': ?instance.title,
  'author': ?instance.author,
  'description': ?instance.description,
  'releaseDate': ?instance.releaseDate,
  'genres': ?instance.genres,
  'feedUrl': ?instance.feedUrl,
  'imageUrl': ?instance.imageUrl,
  'itunesPageUrl': ?instance.itunesPageUrl,
  'itunesId': ?instance.itunesId,
  'itunesArtistId': ?instance.itunesArtistId,
  'podcastType': ?_$PodcastTypeEnumMap[instance.podcastType],
  'explicit': ?instance.explicit,
  'language': ?instance.language,
  'type': ?instance.type,
  'runtimeType': instance.$type,
};

const _$PodcastTypeEnumMap = {
  PodcastType.episodic: 'episodic',
  PodcastType.serial: 'serial',
};
