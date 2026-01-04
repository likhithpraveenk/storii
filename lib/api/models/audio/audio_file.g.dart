// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AudioFile _$AudioFileFromJson(Map<String, dynamic> json) => _AudioFile(
  index: (json['index'] as num).toInt(),
  ino: json['ino'] as String,
  metadata: FileMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  addedAt: const DateTimeEpochConverter().fromJson(
    (json['addedAt'] as num).toInt(),
  ),
  updatedAt: const DateTimeEpochConverter().fromJson(
    (json['updatedAt'] as num).toInt(),
  ),
  trackNumFromMeta: (json['trackNumFromMeta'] as num?)?.toInt(),
  discNumFromMeta: (json['discNumFromMeta'] as num?)?.toInt(),
  trackNumFromFilename: (json['trackNumFromFilename'] as num?)?.toInt(),
  discNumFromFilename: (json['discNumFromFilename'] as num?)?.toInt(),
  manuallyVerified: json['manuallyVerified'] as bool,
  exclude: json['exclude'] as bool,
  error: json['error'] as String?,
  format: json['format'] as String?,
  duration: const DurationPreciseSecondsConverter().fromJson(
    json['duration'] as num,
  ),
  bitRate: (json['bitRate'] as num).toInt(),
  language: json['language'] as String?,
  codec: json['codec'] as String,
  timeBase: json['timeBase'] as String,
  channels: (json['channels'] as num).toInt(),
  channelLayout: json['channelLayout'] as String,
  chapters: (json['chapters'] as List<dynamic>)
      .map((e) => BookChapter.fromJson(e as Map<String, dynamic>))
      .toList(),
  embeddedCoverArt: json['embeddedCoverArt'] as String?,
  metaTags: AudioMetaTags.fromJson(json['metaTags'] as Map<String, dynamic>),
  mimeType: json['mimeType'] as String,
);

Map<String, dynamic> _$AudioFileToJson(
  _AudioFile instance,
) => <String, dynamic>{
  'index': instance.index,
  'ino': instance.ino,
  'metadata': instance.metadata.toJson(),
  'addedAt': const DateTimeEpochConverter().toJson(instance.addedAt),
  'updatedAt': const DateTimeEpochConverter().toJson(instance.updatedAt),
  'trackNumFromMeta': instance.trackNumFromMeta,
  'discNumFromMeta': instance.discNumFromMeta,
  'trackNumFromFilename': instance.trackNumFromFilename,
  'discNumFromFilename': instance.discNumFromFilename,
  'manuallyVerified': instance.manuallyVerified,
  'exclude': instance.exclude,
  'error': instance.error,
  'format': instance.format,
  'duration': const DurationPreciseSecondsConverter().toJson(instance.duration),
  'bitRate': instance.bitRate,
  'language': instance.language,
  'codec': instance.codec,
  'timeBase': instance.timeBase,
  'channels': instance.channels,
  'channelLayout': instance.channelLayout,
  'chapters': instance.chapters.map((e) => e.toJson()).toList(),
  'embeddedCoverArt': instance.embeddedCoverArt,
  'metaTags': instance.metaTags.toJson(),
  'mimeType': instance.mimeType,
};
