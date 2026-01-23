// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChapterDomain _$ChapterDomainFromJson(Map<String, dynamic> json) =>
    _ChapterDomain(
      id: (json['id'] as num).toInt(),
      start: Duration(microseconds: (json['start'] as num).toInt()),
      end: Duration(microseconds: (json['end'] as num).toInt()),
      title: json['title'] as String,
    );

Map<String, dynamic> _$ChapterDomainToJson(_ChapterDomain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': instance.start.inMicroseconds,
      'end': instance.end.inMicroseconds,
      'title': instance.title,
    };
