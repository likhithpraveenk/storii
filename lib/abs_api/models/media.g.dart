// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookMedia _$BookMediaFromJson(Map<String, dynamic> json) => BookMedia(
  metadata: MediaMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  duration: const DurationPreciseSecondsConverter().fromJson(
    json['duration'] as num,
  ),
  size: (json['size'] as num).toInt(),
  coverPath: json['coverPath'] as String?,
  audioFiles: (json['audioFiles'] as List<dynamic>?)
      ?.map((e) => AudioFile.fromJson(e as Map<String, dynamic>))
      .toList(),
  tracks: (json['tracks'] as List<dynamic>?)
      ?.map((e) => AudioTrack.fromJson(e as Map<String, dynamic>))
      .toList(),
  chapters: (json['chapters'] as List<dynamic>?)
      ?.map((e) => BookChapter.fromJson(e as Map<String, dynamic>))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$BookMediaToJson(BookMedia instance) => <String, dynamic>{
  'metadata': instance.metadata.toJson(),
  'tags': instance.tags,
  'duration': const DurationPreciseSecondsConverter().toJson(instance.duration),
  'size': instance.size,
  'coverPath': ?instance.coverPath,
  'audioFiles': ?instance.audioFiles?.map((e) => e.toJson()).toList(),
  'tracks': ?instance.tracks?.map((e) => e.toJson()).toList(),
  'chapters': ?instance.chapters?.map((e) => e.toJson()).toList(),
  'runtimeType': instance.$type,
};

PodcastMedia _$PodcastMediaFromJson(Map<String, dynamic> json) => PodcastMedia(
  metadata: MediaMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  size: (json['size'] as num).toInt(),
  autoDownloadEpisodes: json['autoDownloadEpisodes'] as bool,
  coverPath: json['coverPath'] as String?,
  lastEpisodeCheck: _$JsonConverterFromJson<int, DateTime>(
    json['lastEpisodeCheck'],
    const DateTimeEpochConverter().fromJson,
  ),
  episodes: (json['episodes'] as List<dynamic>?)
      ?.map((e) => PodcastEpisode.fromJson(e as Map<String, dynamic>))
      .toList(),
  numEpisodes: (json['numEpisodes'] as num?)?.toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$PodcastMediaToJson(PodcastMedia instance) =>
    <String, dynamic>{
      'metadata': instance.metadata.toJson(),
      'tags': instance.tags,
      'size': instance.size,
      'autoDownloadEpisodes': instance.autoDownloadEpisodes,
      'coverPath': ?instance.coverPath,
      'lastEpisodeCheck': ?_$JsonConverterToJson<int, DateTime>(
        instance.lastEpisodeCheck,
        const DateTimeEpochConverter().toJson,
      ),
      'episodes': ?instance.episodes?.map((e) => e.toJson()).toList(),
      'numEpisodes': ?instance.numEpisodes,
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
