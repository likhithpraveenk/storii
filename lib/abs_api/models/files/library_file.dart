import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/files/file_metadata.dart';
import 'package:storii/abs_api/models/utils/enums.dart';
import 'package:storii/abs_api/models/utils/json_converters.dart';

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
