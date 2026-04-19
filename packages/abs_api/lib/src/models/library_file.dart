import 'package:abs_api/src/models/enums.dart';
import 'package:abs_api/src/models/file_metadata.dart';
import 'package:abs_api/src/models/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'library_file.freezed.dart';
part 'library_file.g.dart';

@freezed
sealed class LibraryFile with _$LibraryFile {
  @DateTimeEpochConverter()
  const factory LibraryFile({
    required String ino,
    required FileMetadata metadata,
    required DateTime addedAt,
    required DateTime updatedAt,
    required FileType fileType,
  }) = _LibraryFile;

  factory LibraryFile.fromJson(Map<String, dynamic> json) =>
      _$LibraryFileFromJson(json);
}
