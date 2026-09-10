import 'dart:async';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/features/downloads/logic/storage_service.dart';

class InternalStorageService extends StorageService {
  new(super.location);

  @override
  Future<String> folderPath({
    required String libraryItemId,
    String? episodeId,
    bool createFolder = false,
  }) async {
    final base = await getApplicationDocumentsDirectory();
    final dir = Directory(
      p.join(base.path, location.uri, libraryItemId, episodeId),
    );
    if (createFolder) {
      await dir.create(recursive: true);
    }
    return dir.path;
  }

  @override
  Future<String?> trackPathIfExists({
    required String libraryItemId,
    String? episodeId,
    required String filename,
  }) async {
    final dirPath = await folderPath(
      libraryItemId: libraryItemId,
      episodeId: episodeId,
    );
    final path = p.join(dirPath, filename);
    final exists = await File(path).exists();
    return exists ? path : null;
  }

  @override
  Future<int> existingBytes({
    required String libraryItemId,
    String? episodeId,
    required String filename,
  }) async {
    final filePath = await trackPathIfExists(
      libraryItemId: libraryItemId,
      episodeId: episodeId,
      filename: filename,
    );
    if (filePath == null) return 0;
    final f = File(filePath);
    if (!await f.exists()) return 0;
    return await f.length();
  }

  @override
  Future<StreamSink<List<int>>> openAppendSink({
    required String libraryItemId,
    String? episodeId,
    required String filename,
    required String? mimeType,
  }) async {
    final folder = await folderPath(
      libraryItemId: libraryItemId,
      episodeId: episodeId,
      createFolder: true,
    );
    final filePath = p.join(folder, filename);
    final f = File(filePath);
    return f.openWrite(mode: .append);
  }

  @override
  Future<bool> fileIntact({
    required String libraryItemId,
    String? episodeId,
    required String filename,
    required int expectedBytes,
  }) async {
    final filePath = await trackPathIfExists(
      libraryItemId: libraryItemId,
      episodeId: episodeId,
      filename: filename,
    );
    if (filePath == null) return false;
    final f = File(filePath);
    final actual = await f.length();
    if (actual <= 0) return false;
    return expectedBytes <= 0 || actual >= expectedBytes;
  }

  @override
  Future<void> deleteItem(String libraryItemId) async {
    final path = await folderPath(libraryItemId: libraryItemId);
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
  Future<void> deleteEpisode(String libraryItemId, String episodeId) async {
    final path = await folderPath(
      libraryItemId: libraryItemId,
      episodeId: episodeId,
    );
    final dir = Directory(path);
    if (await dir.exists()) {
      try {
        await dir.delete(recursive: true);
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
}
