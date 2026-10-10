import 'dart:async';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/features/downloads/logic/storage_service.dart';

class InternalStorageService extends StorageService {
  new(super.location);

  Future<String> _rootFolder({
    required String relativePath,
    String trackPath = '',
    bool createFolder = false,
  }) async {
    final base = await getApplicationDocumentsDirectory();
    final relativeTrack = p.dirname(trackPath);

    final dir = Directory(
      p.join(
        base.path,
        relativePath,
        relativeTrack == '.' ? null : relativeTrack,
      ),
    );
    if (createFolder) {
      await dir.create(recursive: true);
    }
    return dir.path;
  }

  @override
  Future<String?> getTrackPath({
    required String relativePath,
    required String trackPath,
  }) async {
    final dirPath = await _rootFolder(relativePath: relativePath);
    final path = p.join(dirPath, trackPath);
    final exists = await File(path).exists();
    return exists ? path : null;
  }

  @override
  Future<int> getBytes({
    required String relativePath,
    required String trackPath,
  }) async {
    final filePath = await getTrackPath(
      relativePath: relativePath,
      trackPath: trackPath,
    );
    if (filePath == null) return 0;
    final f = File(filePath);
    if (!await f.exists()) return 0;
    return await f.length();
  }

  @override
  Future<bool> isFileIntact({
    required String relativePath,
    required String trackPath,
    required int expectedBytes,
  }) async {
    final filePath = await getTrackPath(
      relativePath: relativePath,
      trackPath: trackPath,
    );
    if (filePath == null) return false;
    final f = File(filePath);
    final actual = await f.length();
    if (actual <= 0) return false;
    return expectedBytes <= 0 || actual >= expectedBytes;
  }

  @override
  Future<StreamSink<List<int>>> getSink({
    required String relativePath,
    required String trackPath,
    required String? mimeType,
  }) async {
    final folder = await _rootFolder(
      relativePath: relativePath,
      trackPath: trackPath,
      createFolder: true,
    );
    final filePath = p.join(folder, p.basename(trackPath));
    final f = File(filePath);
    return f.openWrite(mode: .append);
  }

  @override
  Future<void> deleteFolder({required String relativePath}) async {
    final path = await _rootFolder(relativePath: relativePath);
    final dir = Directory(path);
    if (await dir.exists()) {
      try {
        await dir.delete(recursive: true);
      } catch (e) {
        LogService.log(
          'Unable to delete item at $path',
          originalError: e,
          level: .error,
          source: 'InternalStorageService',
        );
      }
    }
  }

  @override
  Future<void> deleteTrack({
    required String relativePath,
    required String trackPath,
  }) async {
    final path = await getTrackPath(
      relativePath: relativePath,
      trackPath: trackPath,
    );
    if (path == null) {
      LogService.log(
        'could not find path for $trackPath',
        level: .error,
        source: 'InternalStorageService',
      );
      return;
    }
    final file = File(path);
    if (await file.exists()) {
      try {
        await file.delete();
      } catch (e) {
        LogService.log(
          'Unable to delete episode at $path',
          originalError: e,
          level: .error,
          source: 'InternalStorageService',
        );
      }
    }
  }

  @override
  Future<void> cleanupEmptyFolders() async {
    final base = await getApplicationDocumentsDirectory();
    final root = Directory(p.join(base.path, location.uri));
    if (!await root.exists()) return;
    try {
      await _removeEmptyDirs(root, root);
    } catch (_) {}
  }

  Future<bool> _removeEmptyDirs(Directory dir, Directory root) async {
    bool isEmpty = true;
    final entries = await dir.list().toList();

    for (final entry in entries) {
      if (entry is Directory) {
        final subDirIsEmpty = await _removeEmptyDirs(entry, root);
        if (!subDirIsEmpty) isEmpty = false;
      } else {
        isEmpty = false;
      }
    }

    if (isEmpty && dir.path != root.path) {
      await dir.delete();
      return true;
    }
    return isEmpty;
  }
}
