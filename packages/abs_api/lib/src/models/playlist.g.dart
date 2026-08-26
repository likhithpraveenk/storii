// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Playlist _$PlaylistFromJson(Map<String, dynamic> json) => _Playlist(
  id: json['id'] as String,
  name: json['name'] as String,
  libraryId: json['libraryId'] as String,
  userId: json['userId'] as String,
  description: json['description'] as String?,
  lastUpdate: const DateTimeEpochConverter().fromJson(
    (json['lastUpdate'] as num).toInt(),
  ),
  createdAt: const DateTimeEpochConverter().fromJson(
    (json['createdAt'] as num).toInt(),
  ),
  items: (json['items'] as List<dynamic>)
      .map((e) => PlaylistItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PlaylistToJson(_Playlist instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'libraryId': instance.libraryId,
  'userId': instance.userId,
  'description': ?instance.description,
  'lastUpdate': const DateTimeEpochConverter().toJson(instance.lastUpdate),
  'createdAt': const DateTimeEpochConverter().toJson(instance.createdAt),
  'items': instance.items.map((e) => e.toJson()).toList(),
};
