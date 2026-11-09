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
  Future<TrackFileStat?> stat({
    required String relativePath,
    required String trackPath,
  }) async {
    final dirPath = await _rootFolder(relativePath: relativePath);
    final path = p.join(dirPath, trackPath);
    final file = File(path);
    if (!await file.exists()) return null;
    return (path: path, length: await file.length());
  }

  @override
  Future<StreamSink<List<int>>> getSink({
    required String relativePath,
    required String trackPath,
    required String? mimeType,
    int resumeOffset = 0,
  }) async {
    final folder = await _rootFolder(
      relativePath: relativePath,
      trackPath: trackPath,
      createFolder: resumeOffset == 0,
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
    final result = await stat(relativePath: relativePath, trackPath: trackPath);
    if (result == null) {
      LogService.log(
        'could not find path for $trackPath',
        level: .error,
        source: 'InternalStorageService',
      );
      return;
    }
    final file = File(result.path);
    try {
      await file.delete();
    } catch (e) {
      LogService.log(
        'Unable to delete episode at ${result.path}',
        originalError: e,
        level: .error,
        source: 'InternalStorageService',
      );
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
