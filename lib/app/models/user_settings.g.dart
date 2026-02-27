// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) =>
    _UserSettings(
      userId: json['userId'] as String,
      currentLibraryId: json['currentLibraryId'] as String?,
      activeItemId: json['activeItemId'] as String?,
      navTargets:
          (json['navTargets'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$NavTargetEnumMap, e))
              .toList() ??
          defaultNavTargets,
      isFullySynced: json['isFullySynced'] as bool? ?? false,
      isItemsGridView: json['isItemsGridView'] as bool? ?? true,
      isSeriesGridView: json['isSeriesGridView'] as bool? ?? true,
      isAuthorsGridView: json['isAuthorsGridView'] as bool? ?? true,
      showTitleForItem: json['showTitleForItem'] as bool? ?? true,
      stackTitleOnImage: json['stackTitleOnImage'] as bool? ?? false,
      fastForward: json['fastForward'] == null
          ? const Duration(seconds: 10)
          : Duration(microseconds: (json['fastForward'] as num).toInt()),
      rewind: json['rewind'] == null
          ? const Duration(seconds: 10)
          : Duration(microseconds: (json['rewind'] as num).toInt()),
      speed: (json['speed'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$UserSettingsToJson(
  _UserSettings instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'currentLibraryId': ?instance.currentLibraryId,
  'activeItemId': ?instance.activeItemId,
  'navTargets': instance.navTargets.map((e) => _$NavTargetEnumMap[e]!).toList(),
  'isFullySynced': instance.isFullySynced,
  'isItemsGridView': instance.isItemsGridView,
  'isSeriesGridView': instance.isSeriesGridView,
  'isAuthorsGridView': instance.isAuthorsGridView,
  'showTitleForItem': instance.showTitleForItem,
  'stackTitleOnImage': instance.stackTitleOnImage,
  'fastForward': instance.fastForward.inMicroseconds,
  'rewind': instance.rewind.inMicroseconds,
  'speed': instance.speed,
};

const _$NavTargetEnumMap = {
  NavTarget.home: 'home',
  NavTarget.library: 'library',
  NavTarget.series: 'series',
  NavTarget.downloads: 'downloads',
  NavTarget.collections: 'collections',
  NavTarget.authors: 'authors',
  NavTarget.more: 'more',
};
