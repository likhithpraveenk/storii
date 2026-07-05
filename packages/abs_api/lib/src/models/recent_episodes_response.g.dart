// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_episodes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecentEpisodesResponse _$RecentEpisodesResponseFromJson(
  Map<String, dynamic> json,
) => _RecentEpisodesResponse(
  episodes: (json['episodes'] as List<dynamic>)
      .map((e) => PodcastEpisode.fromJson(e as Map<String, dynamic>))
      .toList(),
  limit: (json['limit'] as num).toInt(),
  page: (json['page'] as num).toInt(),
);

Map<String, dynamic> _$RecentEpisodesResponseToJson(
  _RecentEpisodesResponse instance,
) => <String, dynamic>{
  'episodes': instance.episodes.map((e) => e.toJson()).toList(),
  'limit': instance.limit,
  'page': instance.page,
};
