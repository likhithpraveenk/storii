// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playable_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudiobookItem _$AudiobookItemFromJson(Map<String, dynamic> json) =>
    AudiobookItem(
      libraryId: json['libraryId'] as String,
      id: json['id'] as String,
      sessionId: json['sessionId'] as String,
      cover: Uri.parse(json['cover'] as String),
      title: json['title'] as String?,
      authorName: json['authorName'] as String?,
      tracks: (json['tracks'] as List<dynamic>)
          .map((e) => AudioTrack.fromJson(e as Map<String, dynamic>))
          .toList(),
      chapters: (json['chapters'] as List<dynamic>)
          .map((e) => BookChapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$AudiobookItemToJson(AudiobookItem instance) =>
    <String, dynamic>{
      'libraryId': instance.libraryId,
      'id': instance.id,
      'sessionId': instance.sessionId,
      'cover': instance.cover.toString(),
      'title': ?instance.title,
      'authorName': ?instance.authorName,
      'tracks': instance.tracks.map((e) => e.toJson()).toList(),
      'chapters': instance.chapters.map((e) => e.toJson()).toList(),
      'duration': instance.duration.inMicroseconds,
      'runtimeType': instance.$type,
    };

PodcastItem _$PodcastItemFromJson(Map<String, dynamic> json) => PodcastItem(
  libraryId: json['libraryId'] as String,
  id: json['id'] as String,
  podcastId: json['podcastId'] as String,
  sessionId: json['sessionId'] as String,
  title: json['title'] as String?,
  authorName: json['authorName'] as String?,
  podcastTitle: json['podcastTitle'] as String?,
  cover: Uri.parse(json['cover'] as String),
  tracks: (json['tracks'] as List<dynamic>)
      .map((e) => AudioTrack.fromJson(e as Map<String, dynamic>))
      .toList(),
  duration: Duration(microseconds: (json['duration'] as num).toInt()),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$PodcastItemToJson(PodcastItem instance) =>
    <String, dynamic>{
      'libraryId': instance.libraryId,
      'id': instance.id,
      'podcastId': instance.podcastId,
      'sessionId': instance.sessionId,
      'title': ?instance.title,
      'authorName': ?instance.authorName,
      'podcastTitle': ?instance.podcastTitle,
      'cover': instance.cover.toString(),
      'tracks': instance.tracks.map((e) => e.toJson()).toList(),
      'duration': instance.duration.inMicroseconds,
      'runtimeType': instance.$type,
    };
