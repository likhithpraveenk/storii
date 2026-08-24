import 'package:freezed_annotation/freezed_annotation.dart';

part 'filesystem_directory.freezed.dart';
part 'filesystem_directory.g.dart';

@freezed
sealed class FilesystemDirectory with _$FilesystemDirectory {
  const factory({
    required String path,
    required String dirname,
    required String fullPath,
    required int level,
    required List<FilesystemDirectory> dirs,
  }) = _FilesystemDirectory;

  factory fromJson(Map<String, dynamic> json) =>
      _$FilesystemDirectoryFromJson(json);
}
