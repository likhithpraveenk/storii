// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ebook_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EBookFile _$EBookFileFromJson(Map<String, dynamic> json) => _EBookFile(
  ino: json['ino'] as String,
  metadata: FileMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  ebookFormat: json['ebookFormat'] as String,
  addedAt: const DateTimeEpochConverter().fromJson(
    (json['addedAt'] as num).toInt(),
  ),
  updatedAt: const DateTimeEpochConverter().fromJson(
    (json['updatedAt'] as num).toInt(),
  ),
);

Map<String, dynamic> _$EBookFileToJson(_EBookFile instance) =>
    <String, dynamic>{
      'ino': instance.ino,
      'metadata': instance.metadata.toJson(),
      'ebookFormat': instance.ebookFormat,
      'addedAt': const DateTimeEpochConverter().toJson(instance.addedAt),
      'updatedAt': const DateTimeEpochConverter().toJson(instance.updatedAt),
    };
