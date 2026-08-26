// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_playlist_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatePlaylistRequestParams _$CreatePlaylistRequestParamsFromJson(
  Map<String, dynamic> json,
) => _CreatePlaylistRequestParams(
  libraryId: json['libraryId'] as String,
  name: json['name'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => PlaylistItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreatePlaylistRequestParamsToJson(
  _CreatePlaylistRequestParams instance,
) => <String, dynamic>{
  'libraryId': instance.libraryId,
  'name': instance.name,
  'items': instance.items.map((e) => e.toJson()).toList(),
};
