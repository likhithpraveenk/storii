import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/json_converters.dart';

part 'file_metadata.freezed.dart';
part 'file_metadata.g.dart';

@freezed
sealed class FileMetadata with _$FileMetadata {
  @DateTimeEpochConverter()
  const factory FileMetadata({
    required String filename,
    required String ext,
    required String path,
    required String relPath,
    required int size,
    @JsonKey(name: 'mtimeMs') required DateTime mtime,
    @JsonKey(name: 'ctimeMs') required DateTime ctime,
    @JsonKey(name: 'birthtimeMs') required DateTime birthtime,
  }) = _FileMetadata;

  factory FileMetadata.fromJson(Map<String, dynamic> json) =>
      _$FileMetadataFromJson(json);
}
