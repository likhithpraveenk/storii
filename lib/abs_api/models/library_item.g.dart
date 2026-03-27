// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LibraryItem _$LibraryItemFromJson(Map<String, dynamic> json) => _LibraryItem(
  id: json['id'] as String,
  libraryId: json['libraryId'] as String,
  addedAt: const DateTimeEpochConverter().fromJson(
    (json['addedAt'] as num).toInt(),
  ),
  updatedAt: const DateTimeEpochConverter().fromJson(
    (json['updatedAt'] as num).toInt(),
  ),
  isMissing: json['isMissing'] as bool,
  mediaType: $enumDecode(_$MediaTypeEnumMap, json['mediaType']),
  media: Media.fromJson(json['media'] as Map<String, dynamic>),
  size: (json['size'] as num?)?.toInt(),
  sequence: json['sequence'] as String?,
  seriesSequence: json['seriesSequence'] as String?,
  userMediaProgress: json['userMediaProgress'] == null
      ? null
      : MediaProgress.fromJson(
          json['userMediaProgress'] as Map<String, dynamic>,
        ),
  episodesDownloading: (json['episodesDownloading'] as List<dynamic>?)
      ?.map((e) => PodcastEpisodeDownload.fromJson(e as Map<String, dynamic>))
      .toList(),
  collapsedSeries: json['collapsedSeries'] == null
      ? null
      : Series.fromJson(json['collapsedSeries'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LibraryItemToJson(_LibraryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'libraryId': instance.libraryId,
      'addedAt': const DateTimeEpochConverter().toJson(instance.addedAt),
      'updatedAt': const DateTimeEpochConverter().toJson(instance.updatedAt),
      'isMissing': instance.isMissing,
      'mediaType': _$MediaTypeEnumMap[instance.mediaType]!,
      'media': instance.media.toJson(),
      'size': ?instance.size,
      'sequence': ?instance.sequence,
      'seriesSequence': ?instance.seriesSequence,
      'userMediaProgress': ?instance.userMediaProgress?.toJson(),
      'episodesDownloading': ?instance.episodesDownloading
          ?.map((e) => e.toJson())
          .toList(),
      'collapsedSeries': ?instance.collapsedSeries?.toJson(),
    };

const _$MediaTypeEnumMap = {
  MediaType.book: 'book',
  MediaType.podcast: 'podcast',
};
