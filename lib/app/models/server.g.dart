// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Server _$ServerFromJson(Map<String, dynamic> json) => _Server(
  id: json['id'] as String,
  url: Uri.parse(json['url'] as String),
  headers:
      (json['headers'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const {},
);

Map<String, dynamic> _$ServerToJson(_Server instance) => <String, dynamic>{
  'id': instance.id,
  'url': instance.url.toString(),
  'headers': instance.headers,
};
