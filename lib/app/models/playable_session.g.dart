// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playable_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlayableSession _$PlayableSessionFromJson(Map<String, dynamic> json) =>
    _PlayableSession(
      libraryId: json['libraryId'] as String,
      id: json['id'] as String,
      itemId: json['itemId'] as String,
      sessionId: json['sessionId'] as String,
      cover: Uri.parse(json['cover'] as String),
      title: json['title'] as String,
      authorName: json['authorName'] as String,
      queue: (json['queue'] as List<dynamic>)
          .map((e) => AudioTrack.fromJson(e as Map<String, dynamic>))
          .toList(),
      chapters: (json['chapters'] as List<dynamic>)
          .map((e) => BookChapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      content: $enumDecode(_$PlayableTypeEnumMap, json['content']),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
    );

Map<String, dynamic> _$PlayableSessionToJson(_PlayableSession instance) =>
    <String, dynamic>{
      'libraryId': instance.libraryId,
      'id': instance.id,
      'itemId': instance.itemId,
      'sessionId': instance.sessionId,
      'cover': instance.cover.toString(),
      'title': instance.title,
      'authorName': instance.authorName,
      'queue': instance.queue.map((e) => e.toJson()).toList(),
      'chapters': instance.chapters.map((e) => e.toJson()).toList(),
      'content': _$PlayableTypeEnumMap[instance.content]!,
      'duration': instance.duration.inMicroseconds,
    };

const _$PlayableTypeEnumMap = {
  PlayableType.audiobook: 'audiobook',
  PlayableType.podcastEpisode: 'podcastEpisode',
};
