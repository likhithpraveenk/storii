// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_device_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericDeviceInfo _$GenericDeviceInfoFromJson(Map<String, dynamic> json) =>
    GenericDeviceInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      subtitle: json['subtitle'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$GenericDeviceInfoToJson(GenericDeviceInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subtitle': instance.subtitle,
      'runtimeType': instance.$type,
    };

DlnaDeviceInfo _$DlnaDeviceInfoFromJson(Map<String, dynamic> json) =>
    DlnaDeviceInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      subtitle: json['subtitle'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$DlnaDeviceInfoToJson(DlnaDeviceInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subtitle': instance.subtitle,
      'runtimeType': instance.$type,
    };
