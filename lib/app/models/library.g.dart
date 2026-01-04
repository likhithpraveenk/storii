// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Library _$LibraryFromJson(Map<String, dynamic> json) => _Library(
  id: json['id'] as String,
  serverUrl: Uri.parse(json['serverUrl'] as String),
  name: json['name'] as String,
  mediaContent: $enumDecode(_$MediaContentEnumMap, json['mediaContent']),
);

Map<String, dynamic> _$LibraryToJson(_Library instance) => <String, dynamic>{
  'id': instance.id,
  'serverUrl': instance.serverUrl.toString(),
  'name': instance.name,
  'mediaContent': _$MediaContentEnumMap[instance.mediaContent]!,
};

const _$MediaContentEnumMap = {
  MediaContent.audiobook: 'audiobook',
  MediaContent.podcast: 'podcast',
};
