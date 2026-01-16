// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LibraryFile _$LibraryFileFromJson(Map<String, dynamic> json) => _LibraryFile(
  ino: json['ino'] as String,
  metadata: FileMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  addedAt: const DateTimeEpochConverter().fromJson(
    (json['addedAt'] as num).toInt(),
  ),
  updatedAt: const DateTimeEpochConverter().fromJson(
    (json['updatedAt'] as num).toInt(),
  ),
  fileType: $enumDecode(_$FileTypeEnumMap, json['fileType']),
);

Map<String, dynamic> _$LibraryFileToJson(_LibraryFile instance) =>
    <String, dynamic>{
      'ino': instance.ino,
      'metadata': instance.metadata.toJson(),
      'addedAt': const DateTimeEpochConverter().toJson(instance.addedAt),
      'updatedAt': const DateTimeEpochConverter().toJson(instance.updatedAt),
      'fileType': _$FileTypeEnumMap[instance.fileType]!,
    };

const _$FileTypeEnumMap = {
  FileType.image: 'image',
  FileType.audio: 'audio',
  FileType.ebook: 'ebook',
  FileType.video: 'video',
  FileType.text: 'text',
  FileType.metadata: 'metadata',
  FileType.unknown: 'unknown',
};
