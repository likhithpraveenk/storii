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
  systemColor: _$JsonConverterFromJson<Map<String, dynamic>, Color>(
    json['systemColor'],
    const ColorConverter().fromJson,
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
);

Map<String, dynamic> _$AppSettingsToJson(_AppSettings instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'useDynamicColor': instance.useDynamicColor,
      'systemColor': ?_$JsonConverterToJson<Map<String, dynamic>, Color>(
        instance.systemColor,
        const ColorConverter().toJson,
      ),
      'schemeVariant': _$DynamicSchemeVariantEnumMap[instance.schemeVariant]!,
      'usePureBlack': instance.usePureBlack,
      'currentUser': ?instance.currentUser?.toJson(),
      'serverUrl': ?instance.serverUrl?.toString(),
      'maxLogs': instance.maxLogs,
      'enableHttpLogs': instance.enableHttpLogs,
      'syncInterval': instance.syncInterval.inMicroseconds,
      'syncIntervalMetered': instance.syncIntervalMetered.inMicroseconds,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

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

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
