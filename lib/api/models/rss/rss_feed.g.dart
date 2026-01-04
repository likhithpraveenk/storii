// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rss_feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RssFeed _$RssFeedFromJson(Map<String, dynamic> json) => _RssFeed(
  id: json['id'] as String,
  entityId: json['entityId'] as String,
  entityType: json['entityType'] as String,
  feedUrl: Uri.parse(json['feedUrl'] as String),
  slug: json['slug'] as String?,
  userId: json['userId'] as String?,
  coverPath: json['coverPath'] as String?,
  serverAddress: json['serverAddress'] == null
      ? null
      : Uri.parse(json['serverAddress'] as String),
  meta: json['meta'] == null
      ? null
      : RssFeedMetadata.fromJson(json['meta'] as Map<String, dynamic>),
  episodes: (json['episodes'] as List<dynamic>?)
      ?.map((e) => RssFeedEpisode.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: _$JsonConverterFromJson<int, DateTime>(
    json['createdAt'],
    const DateTimeEpochConverter().fromJson,
  ),
  updatedAt: _$JsonConverterFromJson<int, DateTime>(
    json['updatedAt'],
    const DateTimeEpochConverter().fromJson,
  ),
);

Map<String, dynamic> _$RssFeedToJson(_RssFeed instance) => <String, dynamic>{
  'id': instance.id,
  'entityId': instance.entityId,
  'entityType': instance.entityType,
  'feedUrl': instance.feedUrl.toString(),
  'slug': instance.slug,
  'userId': instance.userId,
  'coverPath': instance.coverPath,
  'serverAddress': instance.serverAddress?.toString(),
  'meta': instance.meta?.toJson(),
  'episodes': instance.episodes?.map((e) => e.toJson()).toList(),
  'createdAt': _$JsonConverterToJson<int, DateTime>(
    instance.createdAt,
    const DateTimeEpochConverter().toJson,
  ),
  'updatedAt': _$JsonConverterToJson<int, DateTime>(
    instance.updatedAt,
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
