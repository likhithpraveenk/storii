// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeriesProgress _$SeriesProgressFromJson(Map<String, dynamic> json) =>
    _SeriesProgress(
      libraryItemIds: (json['libraryItemIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      libraryItemIdsFinished: (json['libraryItemIdsFinished'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isFinished: json['isFinished'] as bool,
    );

Map<String, dynamic> _$SeriesProgressToJson(_SeriesProgress instance) =>
    <String, dynamic>{
      'libraryItemIds': instance.libraryItemIds,
      'libraryItemIdsFinished': instance.libraryItemIdsFinished,
      'isFinished': instance.isFinished,
    };
