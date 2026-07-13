// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CastSession _$CastSessionFromJson(Map<String, dynamic> json) => _CastSession(
  status:
      $enumDecodeNullable(_$CastStatusEnumMap, json['status']) ??
      CastStatus.idle,
  device: json['device'] == null
      ? null
      : CastDeviceInfo.fromJson(json['device'] as Map<String, dynamic>),
  error: json['error'] as String?,
  target: json['target'] == null
      ? null
      : CastTarget.fromJson(json['target'] as Map<String, dynamic>),
  currentTrackIndex: (json['currentTrackIndex'] as num?)?.toInt() ?? 0,
  initialPosition: json['initialPosition'] == null
      ? Duration.zero
      : Duration(microseconds: (json['initialPosition'] as num).toInt()),
  currentGlobalPosition: json['currentGlobalPosition'] == null
      ? Duration.zero
      : Duration(microseconds: (json['currentGlobalPosition'] as num).toInt()),
  id: json['id'] as String?,
  libraryItemId: json['libraryItemId'] as String?,
  episodeId: json['episodeId'] as String?,
);

Map<String, dynamic> _$CastSessionToJson(_CastSession instance) =>
    <String, dynamic>{
      'status': _$CastStatusEnumMap[instance.status]!,
      'device': ?instance.device?.toJson(),
      'error': ?instance.error,
      'target': ?instance.target?.toJson(),
      'currentTrackIndex': instance.currentTrackIndex,
      'initialPosition': instance.initialPosition.inMicroseconds,
      'currentGlobalPosition': instance.currentGlobalPosition.inMicroseconds,
      'id': ?instance.id,
      'libraryItemId': ?instance.libraryItemId,
      'episodeId': ?instance.episodeId,
    };

const _$CastStatusEnumMap = {
  CastStatus.idle: 'idle',
  CastStatus.connecting: 'connecting',
  CastStatus.casting: 'casting',
  CastStatus.error: 'error',
};
