// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rss_feed_episode_enclosure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RssFeedEpisodeEnclosure _$RssFeedEpisodeEnclosureFromJson(
  Map<String, dynamic> json,
) => _RssFeedEpisodeEnclosure(
  url: Uri.parse(json['url'] as String),
  type: json['type'] as String,
  size: (json['size'] as num).toInt(),
);

Map<String, dynamic> _$RssFeedEpisodeEnclosureToJson(
  _RssFeedEpisodeEnclosure instance,
) => <String, dynamic>{
  'url': instance.url.toString(),
  'type': instance.type,
  'size': instance.size,
};
