// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => _AppSettings(
  themeMode:
      $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
      ThemeMode.system,
  useDynamicColor: json['useDynamicColor'] as bool? ?? false,
  usePureBlack: json['usePureBlack'] as bool? ?? false,
  localeCode: json['localeCode'] as String? ?? 'en',
  currentUser: json['currentUser'] == null
      ? null
      : UserDomain.fromJson(json['currentUser'] as Map<String, dynamic>),
  dateTimeFormat: json['dateTimeFormat'] as String? ?? 'dd MMM y',
  maxLogs: (json['maxLogs'] as num?)?.toInt() ?? 100,
  navTargets:
      (json['navTargets'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$NavTargetEnumMap, e))
          .toList() ??
      defaultNavTargets,
  fontFamily: json['fontFamily'] as String? ?? 'AtkinsonHyperlegibleNext',
  fontScale: (json['fontScale'] as num?)?.toDouble() ?? 1,
  showTitleForItem: json['showTitleForItem'] as bool? ?? true,
  stackTitleOnImage: json['stackTitleOnImage'] as bool? ?? false,
  enableHttpLogs: json['enableHttpLogs'] as bool? ?? false,
  fastForward: json['fastForward'] == null
      ? const Duration(seconds: 10)
      : Duration(microseconds: (json['fastForward'] as num).toInt()),
  rewind: json['rewind'] == null
      ? const Duration(seconds: 10)
      : Duration(microseconds: (json['rewind'] as num).toInt()),
  speed: (json['speed'] as num?)?.toDouble() ?? 1.0,
);

Map<String, dynamic> _$AppSettingsToJson(
  _AppSettings instance,
) => <String, dynamic>{
  'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
  'useDynamicColor': instance.useDynamicColor,
  'usePureBlack': instance.usePureBlack,
  'localeCode': instance.localeCode,
  'currentUser': ?instance.currentUser?.toJson(),
  'dateTimeFormat': instance.dateTimeFormat,
  'maxLogs': instance.maxLogs,
  'navTargets': instance.navTargets.map((e) => _$NavTargetEnumMap[e]!).toList(),
  'fontFamily': ?instance.fontFamily,
  'fontScale': instance.fontScale,
  'showTitleForItem': instance.showTitleForItem,
  'stackTitleOnImage': instance.stackTitleOnImage,
  'enableHttpLogs': instance.enableHttpLogs,
  'fastForward': instance.fastForward.inMicroseconds,
  'rewind': instance.rewind.inMicroseconds,
  'speed': instance.speed,
};

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
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
