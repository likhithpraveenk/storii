// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AudioTrackDomain _$AudioTrackDomainFromJson(Map<String, dynamic> json) =>
    _AudioTrackDomain(
      index: (json['index'] as num).toInt(),
      startOffset: Duration(microseconds: (json['startOffset'] as num).toInt()),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      title: json['title'] as String,
      contentUrl: json['contentUrl'] as String,
      mimeType: json['mimeType'] as String,
    );

Map<String, dynamic> _$AudioTrackDomainToJson(_AudioTrackDomain instance) =>
    <String, dynamic>{
      'index': instance.index,
      'startOffset': instance.startOffset.inMicroseconds,
      'duration': instance.duration.inMicroseconds,
      'title': instance.title,
      'contentUrl': instance.contentUrl,
      'mimeType': instance.mimeType,
    };
