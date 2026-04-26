// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AudioTrack _$AudioTrackFromJson(Map<String, dynamic> json) => _AudioTrack(
  index: (json['index'] as num).toInt(),
  startOffset: const DurationPreciseSecondsConverter().fromJson(
    json['startOffset'] as Object,
  ),
  duration: const DurationPreciseSecondsConverter().fromJson(
    json['duration'] as Object,
  ),
  title: json['title'] as String,
  contentUrl: json['contentUrl'] as String,
  mimeType: json['mimeType'] as String?,
  metadata: json['metadata'] == null
      ? null
      : FileMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  ino: json['ino'] as String?,
  addedAt: _$JsonConverterFromJson<int, DateTime>(
    json['addedAt'],
    const DateTimeEpochConverter().fromJson,
  ),
  updatedAt: _$JsonConverterFromJson<int, DateTime>(
    json['updatedAt'],
    const DateTimeEpochConverter().fromJson,
  ),
  trackNumFromMeta: (json['trackNumFromMeta'] as num?)?.toInt(),
  discNumFromMeta: (json['discNumFromMeta'] as num?)?.toInt(),
  trackNumFromFilename: (json['trackNumFromFilename'] as num?)?.toInt(),
  discNumFromFilename: (json['discNumFromFilename'] as num?)?.toInt(),
  manuallyVerified: json['manuallyVerified'] as bool?,
  exclude: json['exclude'] as bool?,
  error: json['error'] as String?,
  format: json['format'] as String?,
  bitRate: (json['bitRate'] as num?)?.toInt(),
  language: json['language'] as String?,
  codec: json['codec'] as String?,
  timeBase: json['timeBase'] as String?,
  channels: (json['channels'] as num?)?.toInt(),
  channelLayout: json['channelLayout'] as String?,
  chapters: (json['chapters'] as List<dynamic>?)
      ?.map((e) => BookChapter.fromJson(e as Map<String, dynamic>))
      .toList(),
  embeddedCoverArt: json['embeddedCoverArt'] as String?,
  metaTags: json['metaTags'] == null
      ? null
      : AudioMetaTags.fromJson(json['metaTags'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AudioTrackToJson(
  _AudioTrack instance,
) => <String, dynamic>{
  'index': instance.index,
  'startOffset': const DurationPreciseSecondsConverter().toJson(
    instance.startOffset,
  ),
  'duration': const DurationPreciseSecondsConverter().toJson(instance.duration),
  'title': instance.title,
  'contentUrl': instance.contentUrl,
  'mimeType': ?instance.mimeType,
  'metadata': ?instance.metadata?.toJson(),
  'ino': ?instance.ino,
  'addedAt': ?_$JsonConverterToJson<int, DateTime>(
    instance.addedAt,
    const DateTimeEpochConverter().toJson,
  ),
  'updatedAt': ?_$JsonConverterToJson<int, DateTime>(
    instance.updatedAt,
    const DateTimeEpochConverter().toJson,
  ),
  'trackNumFromMeta': ?instance.trackNumFromMeta,
  'discNumFromMeta': ?instance.discNumFromMeta,
  'trackNumFromFilename': ?instance.trackNumFromFilename,
  'discNumFromFilename': ?instance.discNumFromFilename,
  'manuallyVerified': ?instance.manuallyVerified,
  'exclude': ?instance.exclude,
  'error': ?instance.error,
  'format': ?instance.format,
  'bitRate': ?instance.bitRate,
  'language': ?instance.language,
  'codec': ?instance.codec,
  'timeBase': ?instance.timeBase,
  'channels': ?instance.channels,
  'channelLayout': ?instance.channelLayout,
  'chapters': ?instance.chapters?.map((e) => e.toJson()).toList(),
  'embeddedCoverArt': ?instance.embeddedCoverArt,
  'metaTags': ?instance.metaTags?.toJson(),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
