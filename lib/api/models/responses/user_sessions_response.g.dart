// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sessions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSessionsResponse _$UserSessionsResponseFromJson(
  Map<String, dynamic> json,
) => _UserSessionsResponse(
  total: (json['total'] as num).toInt(),
  numPages: (json['numPages'] as num).toInt(),
  itemsPerPage: (json['itemsPerPage'] as num).toInt(),
  sessions: (json['sessions'] as List<dynamic>)
      .map((e) => PlaybackSession.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserSessionsResponseToJson(
  _UserSessionsResponse instance,
) => <String, dynamic>{
  'total': instance.total,
  'numPages': instance.numPages,
  'itemsPerPage': instance.itemsPerPage,
  'sessions': instance.sessions.map((e) => e.toJson()).toList(),
};
