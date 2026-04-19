// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Library _$LibraryFromJson(Map<String, dynamic> json) => _Library(
  id: json['id'] as String,
  name: json['name'] as String,
  folders: (json['folders'] as List<dynamic>)
      .map((e) => Folder.fromJson(e as Map<String, dynamic>))
      .toList(),
  displayOrder: (json['displayOrder'] as num).toInt(),
  icon: json['icon'] as String?,
  mediaType: $enumDecode(_$MediaTypeEnumMap, json['mediaType']),
  provider: json['provider'] as String?,
  createdAt: const DateTimeEpochConverter().fromJson(
    (json['createdAt'] as num).toInt(),
  ),
  lastUpdate: const DateTimeEpochConverter().fromJson(
    (json['lastUpdate'] as num).toInt(),
  ),
);

Map<String, dynamic> _$LibraryToJson(_Library instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'folders': instance.folders.map((e) => e.toJson()).toList(),
  'displayOrder': instance.displayOrder,
  'icon': ?instance.icon,
  'mediaType': _$MediaTypeEnumMap[instance.mediaType]!,
  'provider': ?instance.provider,
  'createdAt': const DateTimeEpochConverter().toJson(instance.createdAt),
  'lastUpdate': const DateTimeEpochConverter().toJson(instance.lastUpdate),
};

const _$MediaTypeEnumMap = {
  MediaType.book: 'book',
  MediaType.podcast: 'podcast',
};
