import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/features/downloads/models/download_item.dart';

class DownloadsFilesystemHelper {
  Directory? _cachedRoot;

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

  String _sanitize(String name) =>
      name.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_').trim();
}
