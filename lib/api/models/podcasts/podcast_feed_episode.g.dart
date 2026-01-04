// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast_feed_episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PodcastFeedEpisode _$PodcastFeedEpisodeFromJson(Map<String, dynamic> json) =>
    _PodcastFeedEpisode(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      description: json['description'] as String,
      descriptionPlain: json['descriptionPlain'] as String,
      pubDate: json['pubDate'] as String,
      episodeType: json['episodeType'] as String,
      season: json['season'] as String,
      episode: json['episode'] as String,
      author: json['author'] as String,
      duration: json['duration'] as String,
      explicit: json['explicit'] as String,
      publishedAt: const DateTimeEpochConverter().fromJson(
        (json['publishedAt'] as num).toInt(),
      ),
      enclosure: PodcastEpisodeEnclosure.fromJson(
        json['enclosure'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PodcastFeedEpisodeToJson(
  _PodcastFeedEpisode instance,
) => <String, dynamic>{
  'title': instance.title,
  'subtitle': instance.subtitle,
  'description': instance.description,
  'descriptionPlain': instance.descriptionPlain,
  'pubDate': instance.pubDate,
  'episodeType': instance.episodeType,
  'season': instance.season,
  'episode': instance.episode,
  'author': instance.author,
  'duration': instance.duration,
  'explicit': instance.explicit,
  'publishedAt': const DateTimeEpochConverter().toJson(instance.publishedAt),
  'enclosure': instance.enclosure.toJson(),
};
