import 'dart:async';

import 'package:storii/app/models/storage_location.dart';

abstract class StorageService {
  final StorageLocation location;

  new(this.location);

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

  Future<void> cleanupEmptyFolders();
}
