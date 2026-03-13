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
  currentUser: json['currentUser'] == null
      ? null
      : UserDomain.fromJson(json['currentUser'] as Map<String, dynamic>),
  dateTimeFormat: json['dateTimeFormat'] as String? ?? 'dd MMM y',
  maxLogs: (json['maxLogs'] as num?)?.toInt() ?? 100,
  fontFamily: json['fontFamily'] as String? ?? 'AtkinsonHyperlegibleNext',
  fontScale: (json['fontScale'] as num?)?.toDouble() ?? 1,
  enableHttpLogs: json['enableHttpLogs'] as bool? ?? false,
  skipForward: json['skipForward'] == null
      ? const Duration(seconds: 30)
      : Duration(microseconds: (json['skipForward'] as num).toInt()),
  skipBackward: json['skipBackward'] == null
      ? const Duration(seconds: 10)
      : Duration(microseconds: (json['skipBackward'] as num).toInt()),
  speed: (json['speed'] as num?)?.toDouble() ?? 1.0,
  syncInterval: json['syncInterval'] == null
      ? const Duration(seconds: 20)
      : Duration(microseconds: (json['syncInterval'] as num).toInt()),
);

Map<String, dynamic> _$AppSettingsToJson(_AppSettings instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'useDynamicColor': instance.useDynamicColor,
      'usePureBlack': instance.usePureBlack,
      'currentUser': ?instance.currentUser?.toJson(),
      'dateTimeFormat': instance.dateTimeFormat,
      'maxLogs': instance.maxLogs,
      'fontFamily': ?instance.fontFamily,
      'fontScale': instance.fontScale,
      'enableHttpLogs': instance.enableHttpLogs,
      'skipForward': instance.skipForward.inMicroseconds,
      'skipBackward': instance.skipBackward.inMicroseconds,
      'speed': instance.speed,
      'syncInterval': instance.syncInterval.inMicroseconds,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
