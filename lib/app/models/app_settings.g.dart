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
  maxLogs: (json['maxLogs'] as num?)?.toInt() ?? 100,
  enableHttpLogs: json['enableHttpLogs'] as bool? ?? false,
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
      'maxLogs': instance.maxLogs,
      'enableHttpLogs': instance.enableHttpLogs,
      'syncInterval': instance.syncInterval.inMicroseconds,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
