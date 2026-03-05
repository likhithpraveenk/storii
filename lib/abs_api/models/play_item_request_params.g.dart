// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_item_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$PlayItemRequestParamsToJson(
  PlayItemRequestParams instance,
) => <String, dynamic>{
  'deviceInfo': ?instance.deviceInfo?.toJson(),
  'forceDirectPlay': instance.forceDirectPlay,
  'forceTranscode': instance.forceTranscode,
  'supportedMimeTypes': ?instance.supportedMimeTypes,
  'mediaPlayer': instance.mediaPlayer,
};

Map<String, dynamic> _$ClientDeviceInfoToJson(ClientDeviceInfo instance) =>
    <String, dynamic>{
      'deviceId': ?instance.deviceId,
      'clientName': ?instance.clientName,
      'deviceName': ?instance.deviceName,
      'clientVersion': ?instance.clientVersion,
      'manufacturer': ?instance.manufacturer,
      'model': ?instance.model,
      'sdkVersion': ?instance.sdkVersion,
    };
