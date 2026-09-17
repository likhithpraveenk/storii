// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Chapter _$ChapterFromJson(Map<String, dynamic> json) => _Chapter(
  index: (json['index'] as num).toInt(),
  start: Duration(microseconds: (json['start'] as num).toInt()),
  end: Duration(microseconds: (json['end'] as num).toInt()),
  title: json['title'] as String,
  subtitle: json['subtitle'] as String,
  fromTracks: json['fromTracks'] as bool? ?? false,
);

Map<String, dynamic> _$ChapterToJson(_Chapter instance) => <String, dynamic>{
  'index': instance.index,
  'start': instance.start.inMicroseconds,
  'end': instance.end.inMicroseconds,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'fromTracks': instance.fromTracks,
};
