// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StorageLocation _$StorageLocationFromJson(Map<String, dynamic> json) =>
    _StorageLocation(
      name: json['name'] as String,
      uri: json['uri'] as String,
      mediaType: $enumDecode(_$DownloadMediaTypeEnumMap, json['mediaType']),
      isInternal: json['isInternal'] as bool? ?? false,
    );

Map<String, dynamic> _$StorageLocationToJson(_StorageLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uri': instance.uri,
      'mediaType': _$DownloadMediaTypeEnumMap[instance.mediaType]!,
      'isInternal': instance.isInternal,
    };

const _$DownloadMediaTypeEnumMap = {
  DownloadMediaType.audiobook: 'audiobook',
  DownloadMediaType.podcast: 'podcast',
};
