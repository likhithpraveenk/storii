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
  appColor: json['appColor'] == null
      ? appPrimaryColor
      : const ColorConverter().fromJson(
          json['appColor'] as Map<String, dynamic>,
        ),
  schemeVariant:
      $enumDecodeNullable(
        _$DynamicSchemeVariantEnumMap,
        json['schemeVariant'],
      ) ??
      DynamicSchemeVariant.fidelity,
  usePureBlack: json['usePureBlack'] as bool? ?? false,
  currentUser: json['currentUser'] == null
      ? null
      : UserDomain.fromJson(json['currentUser'] as Map<String, dynamic>),
  serverUrl: json['serverUrl'] == null
      ? null
      : Uri.parse(json['serverUrl'] as String),
  maxLogs: (json['maxLogs'] as num?)?.toInt() ?? 100,
  enableHttpLogs: json['enableHttpLogs'] as bool? ?? false,
  syncInterval: json['syncInterval'] == null
      ? const Duration(seconds: 20)
      : Duration(microseconds: (json['syncInterval'] as num).toInt()),
  syncIntervalMetered: json['syncIntervalMetered'] == null
      ? const Duration(minutes: 1)
      : Duration(microseconds: (json['syncIntervalMetered'] as num).toInt()),
  downloadPathsV2Migrated: json['downloadPathsV2Migrated'] as bool? ?? false,
);

Map<String, dynamic> _$AppSettingsToJson(_AppSettings instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'useDynamicColor': instance.useDynamicColor,
      'appColor': const ColorConverter().toJson(instance.appColor),
      'schemeVariant': _$DynamicSchemeVariantEnumMap[instance.schemeVariant]!,
      'usePureBlack': instance.usePureBlack,
      'currentUser': ?instance.currentUser?.toJson(),
      'serverUrl': ?instance.serverUrl?.toString(),
      'maxLogs': instance.maxLogs,
      'enableHttpLogs': instance.enableHttpLogs,
      'syncInterval': instance.syncInterval.inMicroseconds,
      'syncIntervalMetered': instance.syncIntervalMetered.inMicroseconds,
      'downloadPathsV2Migrated': instance.downloadPathsV2Migrated,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

const _$DynamicSchemeVariantEnumMap = {
  DynamicSchemeVariant.tonalSpot: 'tonalSpot',
  DynamicSchemeVariant.fidelity: 'fidelity',
  DynamicSchemeVariant.monochrome: 'monochrome',
  DynamicSchemeVariant.neutral: 'neutral',
  DynamicSchemeVariant.vibrant: 'vibrant',
  DynamicSchemeVariant.expressive: 'expressive',
  DynamicSchemeVariant.content: 'content',
  DynamicSchemeVariant.rainbow: 'rainbow',
  DynamicSchemeVariant.fruitSalad: 'fruitSalad',
};
