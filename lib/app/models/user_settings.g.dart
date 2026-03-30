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
      ? null
      : Library.fromJson(json['currentLibrary'] as Map<String, dynamic>),
  navTargets:
      (json['navTargets'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$NavTargetEnumMap, e))
          .toList() ??
      defaultNavTargets,
  libraryDisplayMode:
      $enumDecodeNullable(_$DisplayModeEnumMap, json['libraryDisplayMode']) ??
      DisplayMode.comfortable,
  collapseSeries: json['collapseSeries'] as bool? ?? false,
  seriesDisplayMode:
      $enumDecodeNullable(_$DisplayModeEnumMap, json['seriesDisplayMode']) ??
      DisplayMode.comfortable,
  authorDisplayMode:
      $enumDecodeNullable(_$DisplayModeEnumMap, json['authorDisplayMode']) ??
      DisplayMode.comfortable,
  startupNav:
      $enumDecodeNullable(_$NavTargetEnumMap, json['startupNav']) ??
      NavTarget.home,
  navLabelBehavior:
      $enumDecodeNullable(
        _$NavigationDestinationLabelBehaviorEnumMap,
        json['navLabelBehavior'],
      ) ??
      NavigationDestinationLabelBehavior.alwaysShow,
  dateTimeFormat: json['dateTimeFormat'] as String? ?? 'dd MMM y',
  fontFamily: json['fontFamily'] as String? ?? 'AtkinsonHyperlegibleNext',
  fontScale: (json['fontScale'] as num?)?.toDouble() ?? 1,
  skipForward: json['skipForward'] == null
      ? const Duration(seconds: 30)
      : Duration(microseconds: (json['skipForward'] as num).toInt()),
  skipBackward: json['skipBackward'] == null
      ? const Duration(seconds: 10)
      : Duration(microseconds: (json['skipBackward'] as num).toInt()),
  speed: (json['speed'] as num?)?.toDouble() ?? 1.0,
  historyLimit: (json['historyLimit'] as num?)?.toInt() ?? 200,
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
