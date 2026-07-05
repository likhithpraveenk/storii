// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast_episode_enclosure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PodcastEpisodeEnclosure _$PodcastEpisodeEnclosureFromJson(
  Map<String, dynamic> json,
) => _PodcastEpisodeEnclosure(
  url: json['url'] as String?,
  type: json['type'] as String?,
  length: json['length'] as String?,
);

Map<String, dynamic> _$PodcastEpisodeEnclosureToJson(
  _PodcastEpisodeEnclosure instance,
) => <String, dynamic>{
  'url': ?instance.url,
  'type': ?instance.type,
  'length': ?instance.length,
};
