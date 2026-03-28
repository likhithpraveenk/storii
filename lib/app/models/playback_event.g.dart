// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playback_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServerSyncResult _$ServerSyncResultFromJson(Map<String, dynamic> json) =>
    _ServerSyncResult(
      attempted: json['attempted'] as bool,
      success: json['success'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ServerSyncResultToJson(_ServerSyncResult instance) =>
    <String, dynamic>{
      'attempted': instance.attempted,
      'success': instance.success,
      'message': ?instance.message,
    };

_PlaybackEvent _$PlaybackEventFromJson(Map<String, dynamic> json) =>
    _PlaybackEvent(
      timestamp: DateTime.parse(json['timestamp'] as String),
      position: Duration(microseconds: (json['position'] as num).toInt()),
      kind: $enumDecode(_$PlaybackEventKindEnumMap, json['kind']),
      syncResult: json['syncResult'] == null
          ? null
          : ServerSyncResult.fromJson(
              json['syncResult'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$PlaybackEventToJson(_PlaybackEvent instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'position': instance.position.inMicroseconds,
      'kind': _$PlaybackEventKindEnumMap[instance.kind]!,
      'syncResult': ?instance.syncResult?.toJson(),
    };

const _$PlaybackEventKindEnumMap = {
  PlaybackEventKind.play: 'play',
  PlaybackEventKind.pause: 'pause',
  PlaybackEventKind.seek: 'seek',
  PlaybackEventKind.sync: 'sync',
  PlaybackEventKind.stop: 'stop',
  PlaybackEventKind.complete: 'complete',
};
