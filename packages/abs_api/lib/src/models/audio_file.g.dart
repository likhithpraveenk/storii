// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AudioFile _$AudioFileFromJson(Map<String, dynamic> json) => _AudioFile(
  index: (json['index'] as num).toInt(),
  ino: json['ino'] as String,
  metadata: FileMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
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
  duration: _$JsonConverterFromJson<Object, Duration>(
    json['duration'],
    const DurationPreciseSecondsConverter().fromJson,
  ),
  bitRate: (json['bitRate'] as num?)?.toInt(),
  language: json['language'] as String?,
  codec: json['codec'] as String?,
  timeBase: json['timeBase'] as String?,
  channels: (json['channels'] as num?)?.toInt(),
  channelLayout: json['channelLayout'] as String?,
  chapters:
      (json['chapters'] as List<dynamic>?)
          ?.map((e) => BookChapter.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  embeddedCoverArt: json['embeddedCoverArt'] as String?,
  metaTags: json['metaTags'] == null
      ? null
      : AudioMetaTags.fromJson(json['metaTags'] as Map<String, dynamic>),
  mimeType: json['mimeType'] as String?,
);

Map<String, dynamic> _$AudioFileToJson(_AudioFile instance) =>
    <String, dynamic>{
      'index': instance.index,
      'ino': instance.ino,
      'metadata': instance.metadata.toJson(),
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
      'duration': ?_$JsonConverterToJson<Object, Duration>(
        instance.duration,
        const DurationPreciseSecondsConverter().toJson,
      ),
      'bitRate': ?instance.bitRate,
      'language': ?instance.language,
      'codec': ?instance.codec,
      'timeBase': ?instance.timeBase,
      'channels': ?instance.channels,
      'channelLayout': ?instance.channelLayout,
      'chapters': instance.chapters.map((e) => e.toJson()).toList(),
      'embeddedCoverArt': ?instance.embeddedCoverArt,
      'metaTags': ?instance.metaTags?.toJson(),
      'mimeType': ?instance.mimeType,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
