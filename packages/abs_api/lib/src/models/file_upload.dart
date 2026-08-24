import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_upload.freezed.dart';

@freezed
sealed class FileUpload with _$FileUpload {
  const factory({
    required String filename,
    required Stream<List<int>> byteStream,

    /// The size of the file, in bytes.
    required int length,
  }) = _FileUpload;

  const factory fromBytes({
    required String filename,
    required List<int> bytes,
  }) = FileUploadBytes;

  /// Only use in a `dart:io` environment.
  const factory fromPath({required String filename, required String filePath}) =
      FileUploadPath;
}
