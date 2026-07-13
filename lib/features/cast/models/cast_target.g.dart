// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CastTarget _$CastTargetFromJson(Map<String, dynamic> json) => _CastTarget(
  serverUrl: Uri.parse(json['serverUrl'] as String),
  tracks: (json['tracks'] as List<dynamic>)
      .map((e) => AudioTrack.fromJson(e as Map<String, dynamic>))
      .toList(),
  sessionId: json['sessionId'] as String,
  title: json['title'] as String,
);

Map<String, dynamic> _$CastTargetToJson(_CastTarget instance) =>
    <String, dynamic>{
      'serverUrl': instance.serverUrl.toString(),
      'tracks': instance.tracks.map((e) => e.toJson()).toList(),
      'sessionId': instance.sessionId,
      'title': instance.title,
    };
