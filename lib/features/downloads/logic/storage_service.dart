import 'dart:async';

import 'package:storii/app/models/storage_location.dart';

typedef TrackFileStat = ({String path, int length});

extension TrackFileStatX on TrackFileStat {
  bool isIntact(int expectedBytes) =>
      length > 0 && (expectedBytes <= 0 || length >= expectedBytes);
}

abstract class StorageService {
  final StorageLocation location;

  new(this.location);

  Future<TrackFileStat?> stat({
    required String relativePath,
    required String trackPath,
  });

  Future<StreamSink<List<int>>> getSink({
    required String relativePath,
    required String trackPath,
    required String? mimeType,
    int resumeOffset = 0,
  });

  Future<void> deleteFolder({required String relativePath});

  Future<void> deleteTrack({
    required String relativePath,
    required String trackPath,
  });

  Future<void> cleanupEmptyFolders();
}
