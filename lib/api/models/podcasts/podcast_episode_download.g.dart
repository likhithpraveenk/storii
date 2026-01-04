// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast_episode_download.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PodcastEpisodeDownload _$PodcastEpisodeDownloadFromJson(
  Map<String, dynamic> json,
) => _PodcastEpisodeDownload(
  id: json['id'] as String,
  episodeDisplayTitle: json['episodeDisplayTitle'] as String,
  url: Uri.parse(json['url'] as String),
  libraryItemId: json['libraryItemId'] as String,
  isDownloading: json['isDownloading'] as bool,
  isFinished: json['isFinished'] as bool,
  failed: json['failed'] as bool,
  startedAt: _$JsonConverterFromJson<int, DateTime>(
    json['startedAt'],
    const DateTimeEpochConverter().fromJson,
  ),
  createdAt: const DateTimeEpochConverter().fromJson(
    (json['createdAt'] as num).toInt(),
  ),
  finishedAt: _$JsonConverterFromJson<int, DateTime>(
    json['finishedAt'],
    const DateTimeEpochConverter().fromJson,
  ),
);

Map<String, dynamic> _$PodcastEpisodeDownloadToJson(
  _PodcastEpisodeDownload instance,
) => <String, dynamic>{
  'id': instance.id,
  'episodeDisplayTitle': instance.episodeDisplayTitle,
  'url': instance.url.toString(),
  'libraryItemId': instance.libraryItemId,
  'isDownloading': instance.isDownloading,
  'isFinished': instance.isFinished,
  'failed': instance.failed,
  'startedAt': _$JsonConverterToJson<int, DateTime>(
    instance.startedAt,
    const DateTimeEpochConverter().toJson,
  ),
  'createdAt': const DateTimeEpochConverter().toJson(instance.createdAt),
  'finishedAt': _$JsonConverterToJson<int, DateTime>(
    instance.finishedAt,
    const DateTimeEpochConverter().toJson,
  ),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
