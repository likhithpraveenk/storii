// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Folder _$FolderFromJson(Map<String, dynamic> json) => _Folder(
  id: json['id'] as String,
  fullPath: json['fullPath'] as String,
  libraryId: json['libraryId'] as String,
  addedAt: const DateTimeEpochConverter().fromJson(
    (json['addedAt'] as num).toInt(),
  ),
);

Map<String, dynamic> _$FolderToJson(_Folder instance) => <String, dynamic>{
  'id': instance.id,
  'fullPath': instance.fullPath,
  'libraryId': instance.libraryId,
  'addedAt': const DateTimeEpochConverter().toJson(instance.addedAt),
};
