import 'package:abs_api/src/models/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'folder.freezed.dart';
part 'folder.g.dart';

@freezed
sealed class Folder with _$Folder {
  @DateTimeEpochConverter()
  const factory Folder({
    required String id,
    required String fullPath,
    required String libraryId,
    required DateTime addedAt,
  }) = _Folder;

  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);
}
