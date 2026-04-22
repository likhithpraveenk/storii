// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookChapter _$BookChapterFromJson(Map<String, dynamic> json) => _BookChapter(
  id: (json['id'] as num).toInt(),
  start: const DurationPreciseSecondsConverter().fromJson(
    json['start'] as Object,
  ),
  end: const DurationPreciseSecondsConverter().fromJson(json['end'] as Object),
  title: json['title'] as String,
);

Map<String, dynamic> _$BookChapterToJson(_BookChapter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': const DurationPreciseSecondsConverter().toJson(instance.start),
      'end': const DurationPreciseSecondsConverter().toJson(instance.end),
      'title': instance.title,
    };
