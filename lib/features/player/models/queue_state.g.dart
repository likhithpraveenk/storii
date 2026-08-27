// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QueueItem _$QueueItemFromJson(Map<String, dynamic> json) => _QueueItem(
  itemId: json['itemId'] as String,
  episodeId: json['episodeId'] as String?,
  libraryItem: json['libraryItem'] == null
      ? null
      : LibraryItem.fromJson(json['libraryItem'] as Map<String, dynamic>),
  episode: json['episode'] == null
      ? null
      : PodcastEpisode.fromJson(json['episode'] as Map<String, dynamic>),
);

Map<String, dynamic> _$QueueItemToJson(_QueueItem instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'episodeId': ?instance.episodeId,
      'libraryItem': ?instance.libraryItem?.toJson(),
      'episode': ?instance.episode?.toJson(),
    };

_QueueState _$QueueStateFromJson(Map<String, dynamic> json) => _QueueState(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => QueueItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  currentIndex: (json['currentIndex'] as num?)?.toInt(),
);

Map<String, dynamic> _$QueueStateToJson(_QueueState instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'currentIndex': ?instance.currentIndex,
    };
