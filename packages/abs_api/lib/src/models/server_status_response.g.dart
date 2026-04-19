// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServerStatusResponse _$ServerStatusResponseFromJson(
  Map<String, dynamic> json,
) => _ServerStatusResponse(
  app: json['app'] as String?,
  serverVersion: json['serverVersion'] as String?,
  isInit: json['isInit'] as bool,
  language: json['language'] as String?,
  authMethods: (json['authMethods'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$AuthMethodEnumMap, e))
      .toList(),
  configPath: json['ConfigPath'] as String?,
  metadataPath: json['MetadataPath'] as String?,
  authFormData: json['authFormData'] == null
      ? null
      : AuthFormData.fromJson(json['authFormData'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ServerStatusResponseToJson(
  _ServerStatusResponse instance,
) => <String, dynamic>{
  'app': ?instance.app,
  'serverVersion': ?instance.serverVersion,
  'isInit': instance.isInit,
  'language': ?instance.language,
  'authMethods': ?instance.authMethods
      ?.map((e) => _$AuthMethodEnumMap[e]!)
      .toList(),
  'ConfigPath': ?instance.configPath,
  'MetadataPath': ?instance.metadataPath,
  'authFormData': ?instance.authFormData?.toJson(),
};

const _$AuthMethodEnumMap = {
  AuthMethod.local: 'local',
  AuthMethod.openid: 'openid',
};

_AuthFormData _$AuthFormDataFromJson(Map<String, dynamic> json) =>
    _AuthFormData(
      authLoginCustomMessage: json['authLoginCustomMessage'] as String?,
      authOpenIDButtonText: json['authOpenIDButtonText'] as String?,
      authOpenIDAutoLaunch: json['authOpenIDAutoLaunch'] as bool?,
    );

Map<String, dynamic> _$AuthFormDataToJson(_AuthFormData instance) =>
    <String, dynamic>{
      'authLoginCustomMessage': ?instance.authLoginCustomMessage,
      'authOpenIDButtonText': ?instance.authOpenIDButtonText,
      'authOpenIDAutoLaunch': ?instance.authOpenIDAutoLaunch,
    };
