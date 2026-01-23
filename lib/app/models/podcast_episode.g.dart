// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast_episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PodcastEpisodeDomain _$PodcastEpisodeDomainFromJson(
  Map<String, dynamic> json,
) => _PodcastEpisodeDomain(
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
  pubDate: json['pubDate'] as String?,
  publishedAt: DateTime.parse(json['publishedAt'] as String),
  addedAt: DateTime.parse(json['addedAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  audioTrack: AudioTrackDomain.fromJson(
    json['audioTrack'] as Map<String, dynamic>,
  ),
  duration: Duration(microseconds: (json['duration'] as num).toInt()),
  size: (json['size'] as num?)?.toInt(),
);

Map<String, dynamic> _$PodcastEpisodeDomainToJson(
  _PodcastEpisodeDomain instance,
) => <String, dynamic>{
  'libraryItemId': instance.libraryItemId,
  'podcastId': instance.podcastId,
  'id': instance.id,
  'index': ?instance.index,
  'season': ?instance.season,
  'episode': ?instance.episode,
  'episodeType': ?instance.episodeType,
  'title': ?instance.title,
  'subtitle': ?instance.subtitle,
  'description': ?instance.description,
  'pubDate': ?instance.pubDate,
  'publishedAt': instance.publishedAt.toIso8601String(),
  'addedAt': instance.addedAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'audioTrack': instance.audioTrack.toJson(),
  'duration': instance.duration.inMicroseconds,
  'size': ?instance.size,
};
