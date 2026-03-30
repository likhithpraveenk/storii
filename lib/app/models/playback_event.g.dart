// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playback_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaybackEvent _$PlaybackEventFromJson(Map<String, dynamic> json) =>
    _PlaybackEvent(
      timestamp: DateTime.parse(json['timestamp'] as String),
      position: Duration(microseconds: (json['position'] as num).toInt()),
      kind: $enumDecode(_$PlaybackEventKindEnumMap, json['kind']),
      syncAttempt: json['syncAttempt'] as bool? ?? false,
      syncSuccess: json['syncSuccess'] as bool? ?? false,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$PlaybackEventToJson(_PlaybackEvent instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'position': instance.position.inMicroseconds,
      'kind': _$PlaybackEventKindEnumMap[instance.kind]!,
      'syncAttempt': instance.syncAttempt,
      'syncSuccess': instance.syncSuccess,
      'errorMessage': ?instance.errorMessage,
    };

const _$PlaybackEventKindEnumMap = {
  PlaybackEventKind.play: 'play',
  PlaybackEventKind.pause: 'pause',
  PlaybackEventKind.seek: 'seek',
  PlaybackEventKind.sync: 'sync',
  PlaybackEventKind.stop: 'stop',
  PlaybackEventKind.complete: 'complete',
};
