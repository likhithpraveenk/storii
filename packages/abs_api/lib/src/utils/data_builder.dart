import 'package:abs_api/src/models/file_upload.dart';
import 'package:abs_api/src/utils/mime_type_resolver.dart';
import 'package:dio/dio.dart';

Future<Object?> dataBuilder({
  Object? json,
  Map<String, String>? fields,
  Map<String, FileUpload>? files,
}) async {
  final hasJson = json != null;
  final hasMultipart =
      (fields?.isNotEmpty ?? false) || (files?.isNotEmpty ?? false);

  if (hasJson && hasMultipart) {
    throw ArgumentError('Cannot mix JSON and multipart in same request');
  }

  if (hasMultipart) {
    return _multipart(fields ?? {}, files ?? {});
  }

  return json;
}

Future<FormData> _multipart(
  Map<String, String> fields,
  Map<String, FileUpload> files,
) async {
  final map = <String, dynamic>{}..addAll(fields);

  final multiParts = await Future.wait(
    files.entries.map((entry) async {
      final file = entry.value;
      final type =
          mimeTypeResolver.lookup(file.filename) ?? 'application/octet-stream';

      final multipart = await file.map<Future<MultipartFile>>(
        (f) async => MultipartFile.fromStream(
          () => f.byteStream,
          f.length,
          filename: f.filename,
          contentType: DioMediaType.parse(type),
        ),
        fromBytes: (f) async => MultipartFile.fromBytes(
          f.bytes,
          filename: f.filename,
          contentType: DioMediaType.parse(type),
        ),
        fromPath: (f) async => MultipartFile.fromFile(
          f.filePath,
          filename: f.filename,
          contentType: DioMediaType.parse(type),
        ),
      );

      return MapEntry(entry.key, multipart);
    }),
  );

  for (final part in multiParts) {
    map[part.key] = part.value;
  }

  return FormData.fromMap(map);
}
