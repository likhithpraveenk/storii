import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/file_metadata.dart';
import 'package:storii/abs_api/models/json_converters.dart';

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
