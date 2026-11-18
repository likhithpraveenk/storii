// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playback_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaybackSession _$PlaybackSessionFromJson(Map<String, dynamic> json) =>
    _PlaybackSession(
      id: json['id'] as String,
      userId: json['userId'] as String,
      libraryId: json['libraryId'] as String,
      libraryItemId: json['libraryItemId'] as String,
      episodeId: json['episodeId'] as String?,
      mediaType: $enumDecode(_$MediaTypeEnumMap, json['mediaType']),
      mediaMetadata: json['mediaMetadata'] == null
          ? null
          : MediaMetadata.fromJson(
              json['mediaMetadata'] as Map<String, dynamic>,
            ),
      chapters:
          (json['chapters'] as List<dynamic>?)
              ?.map((e) => BookChapter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      displayTitle: json['displayTitle'] as String?,
      displayAuthor: json['displayAuthor'] as String?,
      coverPath: json['coverPath'] as String?,
      duration: const DurationPreciseSecondsConverter().fromJson(
        json['duration'] as Object,
      ),
      playMethod: $enumDecodeNullable(_$PlayMethodEnumMap, json['playMethod']),
      mediaPlayer: json['mediaPlayer'] as String?,
      deviceInfo: json['deviceInfo'] == null
          ? null
          : DeviceInfo.fromJson(json['deviceInfo'] as Map<String, dynamic>),
      date: json['date'] as String?,
      dayOfWeek: json['dayOfWeek'] as String?,
      timeListening: _$JsonConverterFromJson<Object, Duration>(
        json['timeListening'],
        const DurationPreciseSecondsConverter().fromJson,
      ),
      startTime: _$JsonConverterFromJson<Object, Duration>(
        json['startTime'],
        const DurationPreciseSecondsConverter().fromJson,
      ),
      currentTime: _$JsonConverterFromJson<Object, Duration>(
        json['currentTime'],
        const DurationPreciseSecondsConverter().fromJson,
      ),
      startedAt: const DateTimeEpochConverter().fromJson(
        (json['startedAt'] as num).toInt(),
      ),
      updatedAt: const DateTimeEpochConverter().fromJson(
        (json['updatedAt'] as num).toInt(),
      ),
      user: json['user'] == null
          ? null
          : SessionUser.fromJson(json['user'] as Map<String, dynamic>),
      audioTracks: (json['audioTracks'] as List<dynamic>?)
          ?.map((e) => AudioTrack.fromJson(e as Map<String, dynamic>))
          .toList(),
      libraryItem: json['libraryItem'] == null
          ? null
          : LibraryItem.fromJson(json['libraryItem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaybackSessionToJson(
  _PlaybackSession instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'libraryId': instance.libraryId,
  'libraryItemId': instance.libraryItemId,
  'episodeId': ?instance.episodeId,
  'mediaType': _$MediaTypeEnumMap[instance.mediaType]!,
  'mediaMetadata': ?instance.mediaMetadata?.toJson(),
  'chapters': instance.chapters.map((e) => e.toJson()).toList(),
  'displayTitle': ?instance.displayTitle,
  'displayAuthor': ?instance.displayAuthor,
  'coverPath': ?instance.coverPath,
  'duration': const DurationPreciseSecondsConverter().toJson(instance.duration),
  'playMethod': ?_$PlayMethodEnumMap[instance.playMethod],
  'mediaPlayer': ?instance.mediaPlayer,
  'deviceInfo': ?instance.deviceInfo?.toJson(),
  'date': ?instance.date,
  'dayOfWeek': ?instance.dayOfWeek,
  'timeListening': ?_$JsonConverterToJson<Object, Duration>(
    instance.timeListening,
    const DurationPreciseSecondsConverter().toJson,
  ),
  'startTime': ?_$JsonConverterToJson<Object, Duration>(
    instance.startTime,
    const DurationPreciseSecondsConverter().toJson,
  ),
  'currentTime': ?_$JsonConverterToJson<Object, Duration>(
    instance.currentTime,
    const DurationPreciseSecondsConverter().toJson,
  ),
  'startedAt': const DateTimeEpochConverter().toJson(instance.startedAt),
  'updatedAt': const DateTimeEpochConverter().toJson(instance.updatedAt),
  'user': ?instance.user?.toJson(),
  'audioTracks': ?instance.audioTracks?.map((e) => e.toJson()).toList(),
  'libraryItem': ?instance.libraryItem?.toJson(),
};

const _$MediaTypeEnumMap = {
  MediaType.book: 'book',
  MediaType.podcast: 'podcast',
};

const _$PlayMethodEnumMap = {
  PlayMethod.directPlay: 0,
  PlayMethod.directStream: 1,
  PlayMethod.transcode: 2,
  PlayMethod.local: 3,
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
