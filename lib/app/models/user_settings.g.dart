// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSettings _$UserSettingsFromJson(
  Map<String, dynamic> json,
) => _UserSettings(
  userId: json['userId'] as String,
  currentLibrary: json['currentLibrary'] == null
      ? DefaultUserSettings.currentLibrary
      : Library.fromJson(json['currentLibrary'] as Map<String, dynamic>),
  navTargets:
      (json['navTargets'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$NavTargetEnumMap, e))
          .toList() ??
      DefaultUserSettings.navTargets,
  libraryDisplayMode:
      $enumDecodeNullable(_$DisplayModeEnumMap, json['libraryDisplayMode']) ??
      DefaultUserSettings.libraryDisplayMode,
  collapseSeries:
      json['collapseSeries'] as bool? ?? DefaultUserSettings.collapseSeries,
  seriesDisplayMode:
      $enumDecodeNullable(_$DisplayModeEnumMap, json['seriesDisplayMode']) ??
      DefaultUserSettings.seriesDisplayMode,
  authorDisplayMode:
      $enumDecodeNullable(_$DisplayModeEnumMap, json['authorDisplayMode']) ??
      DefaultUserSettings.authorDisplayMode,
  startupNav:
      $enumDecodeNullable(_$NavTargetEnumMap, json['startupNav']) ??
      DefaultUserSettings.startupNav,
  navLabelBehavior:
      $enumDecodeNullable(
        _$NavigationDestinationLabelBehaviorEnumMap,
        json['navLabelBehavior'],
      ) ??
      DefaultUserSettings.navLabelBehavior,
  dateTimeFormat:
      json['dateTimeFormat'] as String? ?? DefaultUserSettings.dateTimeFormat,
  fontFamily: json['fontFamily'] as String? ?? DefaultUserSettings.fontFamily,
  fontScale:
      (json['fontScale'] as num?)?.toDouble() ?? DefaultUserSettings.fontScale,
  skipForward: json['skipForward'] == null
      ? DefaultUserSettings.skipForward
      : Duration(microseconds: (json['skipForward'] as num).toInt()),
  skipBackward: json['skipBackward'] == null
      ? DefaultUserSettings.skipBackward
      : Duration(microseconds: (json['skipBackward'] as num).toInt()),
  speed: (json['speed'] as num?)?.toDouble() ?? DefaultUserSettings.speed,
  historyLimit:
      (json['historyLimit'] as num?)?.toInt() ??
      DefaultUserSettings.historyLimit,
  maxConcurrentDownloads:
      (json['maxConcurrentDownloads'] as num?)?.toInt() ??
      DefaultUserSettings.maxConcurrentDownloads,
  maxTracksPerItem:
      (json['maxTracksPerItem'] as num?)?.toInt() ??
      DefaultUserSettings.maxTracksPerItem,
  downloadOnWifiOnly:
      json['downloadOnWifiOnly'] as bool? ??
      DefaultUserSettings.downloadOnWifiOnly,
);

Map<String, dynamic> _$UserSettingsToJson(
  _UserSettings instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'currentLibrary': ?instance.currentLibrary?.toJson(),
  'navTargets': instance.navTargets.map((e) => _$NavTargetEnumMap[e]!).toList(),
  'libraryDisplayMode': _$DisplayModeEnumMap[instance.libraryDisplayMode]!,
  'collapseSeries': instance.collapseSeries,
  'seriesDisplayMode': _$DisplayModeEnumMap[instance.seriesDisplayMode]!,
  'authorDisplayMode': _$DisplayModeEnumMap[instance.authorDisplayMode]!,
  'startupNav': _$NavTargetEnumMap[instance.startupNav]!,
  'navLabelBehavior':
      _$NavigationDestinationLabelBehaviorEnumMap[instance.navLabelBehavior]!,
  'dateTimeFormat': instance.dateTimeFormat,
  'fontFamily': ?instance.fontFamily,
  'fontScale': instance.fontScale,
  'skipForward': instance.skipForward.inMicroseconds,
  'skipBackward': instance.skipBackward.inMicroseconds,
  'speed': instance.speed,
  'historyLimit': instance.historyLimit,
  'maxConcurrentDownloads': instance.maxConcurrentDownloads,
  'maxTracksPerItem': instance.maxTracksPerItem,
  'downloadOnWifiOnly': instance.downloadOnWifiOnly,
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

const _$DisplayModeEnumMap = {
  DisplayMode.listView: 'listView',
  DisplayMode.compact: 'compact',
  DisplayMode.comfortable: 'comfortable',
  DisplayMode.coverOnly: 'coverOnly',
};

const _$NavigationDestinationLabelBehaviorEnumMap = {
  NavigationDestinationLabelBehavior.alwaysShow: 'alwaysShow',
  NavigationDestinationLabelBehavior.alwaysHide: 'alwaysHide',
  NavigationDestinationLabelBehavior.onlyShowSelected: 'onlyShowSelected',
};
