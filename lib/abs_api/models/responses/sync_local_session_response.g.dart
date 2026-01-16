// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_local_session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SyncLocalSessionResponse _$SyncLocalSessionResponseFromJson(
  Map<String, dynamic> json,
) => _SyncLocalSessionResponse(
  id: json['id'] as String,
  success: json['success'] as bool,
  error: json['error'] as String?,
  progressSynced: json['progressSynced'] as bool?,
);

Map<String, dynamic> _$SyncLocalSessionResponseToJson(
  _SyncLocalSessionResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'success': instance.success,
  'error': ?instance.error,
  'progressSynced': ?instance.progressSynced,
};
