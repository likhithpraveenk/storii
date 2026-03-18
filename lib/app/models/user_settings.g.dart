// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) =>
    _UserSettings(
      userId: json['userId'] as String,
      currentLibrary: json['currentLibrary'] == null
          ? null
          : Library.fromJson(json['currentLibrary'] as Map<String, dynamic>),
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
      startupNav:
          $enumDecodeNullable(_$NavTargetEnumMap, json['startupNav']) ??
          NavTarget.home,
    );

Map<String, dynamic> _$UserSettingsToJson(
  _UserSettings instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'currentLibrary': ?instance.currentLibrary?.toJson(),
  'navTargets': instance.navTargets.map((e) => _$NavTargetEnumMap[e]!).toList(),
  'isFullySynced': instance.isFullySynced,
  'isItemsGridView': instance.isItemsGridView,
  'isSeriesGridView': instance.isSeriesGridView,
  'isAuthorsGridView': instance.isAuthorsGridView,
  'showTitleForItem': instance.showTitleForItem,
  'stackTitleOnImage': instance.stackTitleOnImage,
  'startupNav': _$NavTargetEnumMap[instance.startupNav]!,
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
