// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookMedia _$BookMediaFromJson(Map<String, dynamic> json) => BookMedia(
  id: json['id'] as String,
  metadata: MediaMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  libraryItemId: json['libraryItemId'] as String?,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  duration: _$JsonConverterFromJson<Object, Duration>(
    json['duration'],
    const DurationPreciseSecondsConverter().fromJson,
  ),
  coverPath: json['coverPath'] as String?,
  audioFiles: (json['audioFiles'] as List<dynamic>?)
      ?.map((e) => AudioFile.fromJson(e as Map<String, dynamic>))
      .toList(),
  numAudioFiles: (json['numAudioFiles'] as num?)?.toInt(),
  tracks: (json['tracks'] as List<dynamic>?)
      ?.map((e) => AudioTrack.fromJson(e as Map<String, dynamic>))
      .toList(),
  numTracks: (json['numTracks'] as num?)?.toInt(),
  chapters: (json['chapters'] as List<dynamic>?)
      ?.map((e) => BookChapter.fromJson(e as Map<String, dynamic>))
      .toList(),
  numChapters: (json['numChapters'] as num?)?.toInt(),
  size: (json['size'] as num?)?.toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$BookMediaToJson(BookMedia instance) => <String, dynamic>{
  'id': instance.id,
  'metadata': instance.metadata.toJson(),
  'libraryItemId': ?instance.libraryItemId,
  'tags': instance.tags,
  'duration': ?_$JsonConverterToJson<Object, Duration>(
    instance.duration,
    const DurationPreciseSecondsConverter().toJson,
  ),
  'coverPath': ?instance.coverPath,
  'audioFiles': ?instance.audioFiles?.map((e) => e.toJson()).toList(),
  'numAudioFiles': ?instance.numAudioFiles,
  'tracks': ?instance.tracks?.map((e) => e.toJson()).toList(),
  'numTracks': ?instance.numTracks,
  'chapters': ?instance.chapters?.map((e) => e.toJson()).toList(),
  'numChapters': ?instance.numChapters,
  'size': ?instance.size,
  'runtimeType': instance.$type,
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

PodcastMedia _$PodcastMediaFromJson(Map<String, dynamic> json) => PodcastMedia(
  id: json['id'] as String,
  metadata: MediaMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  libraryItemId: json['libraryItemId'] as String?,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  autoDownloadEpisodes: json['autoDownloadEpisodes'] as bool? ?? false,
  episodes:
      (json['episodes'] as List<dynamic>?)
          ?.map((e) => PodcastEpisode.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  coverPath: json['coverPath'] as String?,
  lastEpisodeCheck: _$JsonConverterFromJson<int, DateTime>(
    json['lastEpisodeCheck'],
    const DateTimeEpochConverter().fromJson,
  ),
  size: (json['size'] as num?)?.toInt(),
  numEpisodes: (json['numEpisodes'] as num?)?.toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$PodcastMediaToJson(PodcastMedia instance) =>
    <String, dynamic>{
      'id': instance.id,
      'metadata': instance.metadata.toJson(),
      'libraryItemId': ?instance.libraryItemId,
      'tags': instance.tags,
      'autoDownloadEpisodes': instance.autoDownloadEpisodes,
      'episodes': instance.episodes.map((e) => e.toJson()).toList(),
      'coverPath': ?instance.coverPath,
      'lastEpisodeCheck': ?_$JsonConverterToJson<int, DateTime>(
        instance.lastEpisodeCheck,
        const DateTimeEpochConverter().toJson,
      ),
      'size': ?instance.size,
      'numEpisodes': ?instance.numEpisodes,
      'runtimeType': instance.$type,
    };
