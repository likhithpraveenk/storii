// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QueueItem _$QueueItemFromJson(Map<String, dynamic> json) => _QueueItem(
  itemId: json['itemId'] as String,
  episodeId: json['episodeId'] as String?,
);

Map<String, dynamic> _$QueueItemToJson(_QueueItem instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'episodeId': ?instance.episodeId,
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
