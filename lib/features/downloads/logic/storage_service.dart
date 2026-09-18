import 'dart:async';

import 'package:storii/app/models/storage_location.dart';

abstract class StorageService {
  final StorageLocation location;

  new(this.location);

  @Deprecated('Will be removed after V4 migration')
  Future<String> folderPath({required String libraryItemId, String? episodeId});

  @Deprecated('Will be removed after V4 migration')
  Future<String?> trackPathIfExists({
    required String libraryItemId,
    String? episodeId,
    required String filename,
  });

  @Deprecated('Will be removed after V4 migration')
  Future<int> existingBytes({
    required String libraryItemId,
    String? episodeId,
    required String filename,
  });

  @Deprecated('Will be removed after V4 migration')
  Future<StreamSink<List<int>>> openAppendSink({
    required String libraryItemId,
    String? episodeId,
    required String filename,
    required String? mimeType,
  });

  @Deprecated('Will be removed after V4 migration')
  Future<bool> fileIntact({
    required String libraryItemId,
    String? episodeId,
    required String filename,
    required int expectedBytes,
  });

  @Deprecated('Will be removed after V4 migration')
  Future<void> deleteItem(String libraryItemId);

  @Deprecated('Will be removed after V4 migration')
  Future<void> deleteEpisode(String libraryItemId, String episodeId);

  @Deprecated('Will be removed after V4 migration')
  Future<bool> migrateToV4Path({
    required String libraryItemId,
    String? episodeId,
    required String filename,
    required String relativePath,
    required String trackPath,
  });

  Future<String?> getTrackPath({
    required String relativePath,
    required String trackPath,
  });

  Future<int> getBytes({
    required String relativePath,
    required String trackPath,
  });

  Future<StreamSink<List<int>>> getSink({
    required String relativePath,
    required String trackPath,
    required String? mimeType,
  });

  Future<bool> isFileIntact({
    required String relativePath,
    required String trackPath,
    required int expectedBytes,
  });

  Future<void> deleteFolder({required String relativePath});

  Future<void> deleteTrack({
    required String relativePath,
    required String trackPath,
  });
}
