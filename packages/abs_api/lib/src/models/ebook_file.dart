import 'package:abs_api/src/models/file_metadata.dart';
import 'package:abs_api/src/models/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ebook_file.freezed.dart';
part 'ebook_file.g.dart';

@freezed
sealed class EBookFile with _$EBookFile {
  @DateTimeEpochConverter()
  const factory EBookFile({
    required String ino,
    required FileMetadata metadata,
    required String ebookFormat,
    required DateTime addedAt,
    required DateTime updatedAt,
  }) = _EBookFile;

  factory EBookFile.fromJson(Map<String, dynamic> json) =>
      _$EBookFileFromJson(json);
}
