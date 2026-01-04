// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast_feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PodcastFeed _$PodcastFeedFromJson(Map<String, dynamic> json) => _PodcastFeed(
  metadata: PodcastFeedMetadata.fromJson(
    json['metadata'] as Map<String, dynamic>,
  ),
  episodes: (json['episodes'] as List<dynamic>?)
      ?.map((e) => PodcastFeedEpisode.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PodcastFeedToJson(_PodcastFeed instance) =>
    <String, dynamic>{
      'metadata': instance.metadata.toJson(),
      'episodes': instance.episodes?.map((e) => e.toJson()).toList(),
    };
