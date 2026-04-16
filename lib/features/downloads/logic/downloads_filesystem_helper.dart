import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/features/downloads/models/download_item.dart';

part 'downloads_filesystem_helper.g.dart';

@Riverpod(keepAlive: true)
DownloadsFilesystemHelper downloadsFsHelper(Ref ref) {
  return DownloadsFilesystemHelper();
}

class DownloadsFilesystemHelper {
  Directory? _cachedRoot;

  static const int _maxNameLength = 200;

  Future<Directory> rootDirectory() async {
    if (_cachedRoot != null) return _cachedRoot!;

    final base = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(base.path, downloadsDir));

    if (!await dir.exists()) await dir.create(recursive: true);

    _cachedRoot = dir;
    return _cachedRoot!;
  }

  Future<Directory> itemDirectory(String itemTitle) async {
    final root = await rootDirectory();
    final name = _sanitize(itemTitle);
    final dir = Directory(p.join(root.path, name));
    if (!await dir.exists()) await dir.create();
    return dir;
  }

  Future<String> trackPath({
    required String itemTitle,
    required String filename,
  }) async {
    final dir = await itemDirectory(itemTitle);
    return p.join(dir.path, filename);
  }

  Future<String?> trackPathIfExists({
    required String itemTitle,
    required String filename,
  }) async {
    final path = await trackPath(itemTitle: itemTitle, filename: filename);
    final fileExists = await fileIntact(path);
    return fileExists ? path : null;
  }

  Future<String> coverPath(String itemTitle) async {
    final dir = await itemDirectory(itemTitle);
    return p.join(dir.path, 'cover.jpg');
  }

  Future<bool> coverExists(String itemTitle) async {
    final path = await coverPath(itemTitle);
    return await fileIntact(path);
  }

  Future<bool> fileIntact(String path) async {
    final f = File(path);
    return await f.exists() && await f.length() > 0;
  }

  Future<int> fileSize(String path) async {
    final f = File(path);
    return await f.length();
  }

  Future<void> deleteItem(String itemTitle) async {
    final dir = await itemDirectory(itemTitle);
    await dir.delete(recursive: true);
  }

  Future<bool> isFullyDownloaded(DownloadItem item) async {
    if (item.tracks.isEmpty) return false;

    if (!await coverExists(item.title)) return false;

    final results = await Future.wait(
      item.tracks.map((t) => fileIntact(t.localPath)),
    );
    return results.every((intact) => intact);
  }

  Future<int> existingBytes(String path) async {
    final f = File(path);
    if (!await f.exists()) return 0;
    return await f.length();
  }

  Future<IOSink> openAppendSink(String path) async {
    final f = File(path);
    return f.openWrite(mode: FileMode.append);
  }

  Future<void> truncate(String path) async {
    final f = File(path);
    await f.writeAsBytes([]);
  }

  Future<bool> exists(String path) async {
    return await File(path).exists();
  }

  String _sanitize(String name) {
    final cleaned = name.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_').trim();

    return cleaned.length > _maxNameLength
        ? cleaned.substring(0, _maxNameLength)
        : cleaned;
  }
}
