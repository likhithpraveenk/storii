// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast_episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PodcastEpisode _$PodcastEpisodeFromJson(Map<String, dynamic> json) =>
    _PodcastEpisode(
      libraryItemId: json['libraryItemId'] as String,
      podcastId: json['podcastId'] as String,
      id: json['id'] as String,
      index: (json['index'] as num?)?.toInt(),
      season: json['season'] as String?,
      episode: json['episode'] as String?,
      episodeType: json['episodeType'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      description: json['description'] as String?,
      enclosure: json['enclosure'] == null
          ? null
          : PodcastEpisodeEnclosure.fromJson(
              json['enclosure'] as Map<String, dynamic>,
            ),
      pubDate: json['pubDate'] as String?,
      audioFile: AudioFile.fromJson(json['audioFile'] as Map<String, dynamic>),
      publishedAt: const DateTimeEpochConverter().fromJson(
        (json['publishedAt'] as num).toInt(),
      ),
      addedAt: const DateTimeEpochConverter().fromJson(
        (json['addedAt'] as num).toInt(),
      ),
      updatedAt: const DateTimeEpochConverter().fromJson(
        (json['updatedAt'] as num).toInt(),
      ),
      audioTrack: json['audioTrack'] == null
          ? null
          : AudioTrack.fromJson(json['audioTrack'] as Map<String, dynamic>),
      duration: json['duration'] == null
          ? null
          : Duration(microseconds: (json['duration'] as num).toInt()),
      size: (json['size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PodcastEpisodeToJson(
  _PodcastEpisode instance,
) => <String, dynamic>{
  'libraryItemId': instance.libraryItemId,
  'podcastId': instance.podcastId,
  'id': instance.id,
  'index': instance.index,
  'season': instance.season,
  'episode': instance.episode,
  'episodeType': instance.episodeType,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'description': instance.description,
  'enclosure': instance.enclosure?.toJson(),
  'pubDate': instance.pubDate,
  'audioFile': instance.audioFile.toJson(),
  'publishedAt': const DateTimeEpochConverter().toJson(instance.publishedAt),
  'addedAt': const DateTimeEpochConverter().toJson(instance.addedAt),
  'updatedAt': const DateTimeEpochConverter().toJson(instance.updatedAt),
  'audioTrack': instance.audioTrack?.toJson(),
  'duration': instance.duration?.inMicroseconds,
  'size': instance.size,
};
