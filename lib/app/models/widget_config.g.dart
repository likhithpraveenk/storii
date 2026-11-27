// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WidgetConfig _$WidgetConfigFromJson(Map<String, dynamic> json) =>
    _WidgetConfig(
      widgetId: (json['widgetId'] as num).toInt(),
      itemId: json['itemId'] as String,
      episodeId: json['episodeId'] as String?,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      coverPath: json['coverPath'] as String?,
      progress: (json['progress'] as num?)?.toDouble(),
      state:
          $enumDecodeNullable(_$WidgetPlaybackStateEnumMap, json['state']) ??
          WidgetPlaybackState.none,
      source:
          $enumDecodeNullable(_$WidgetSourceEnumMap, json['source']) ??
          WidgetSource.media,
    );

Map<String, dynamic> _$WidgetConfigToJson(_WidgetConfig instance) =>
    <String, dynamic>{
      'widgetId': instance.widgetId,
      'itemId': instance.itemId,
      'episodeId': ?instance.episodeId,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'coverPath': ?instance.coverPath,
      'progress': ?instance.progress,
      'state': _$WidgetPlaybackStateEnumMap[instance.state]!,
      'source': _$WidgetSourceEnumMap[instance.source]!,
    };

const _$WidgetPlaybackStateEnumMap = {
  WidgetPlaybackState.none: 'none',
  WidgetPlaybackState.loading: 'loading',
  WidgetPlaybackState.playing: 'playing',
  WidgetPlaybackState.paused: 'paused',
};

const _$WidgetSourceEnumMap = {
  WidgetSource.media: 'media',
  WidgetSource.nowPlaying: 'nowPlaying',
};
