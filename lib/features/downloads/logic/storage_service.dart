import 'dart:async';

import 'package:storii/app/models/storage_location.dart';

abstract class StorageService {
  final StorageLocation location;

  new(this.location);

  Future<String> folderPath({required String libraryItemId, String? episodeId});

  Future<String?> trackPathIfExists({
    required String libraryItemId,
    String? episodeId,
    required String filename,
  });

  Future<int> existingBytes({
    required String libraryItemId,
    String? episodeId,
    required String filename,
  });

  Future<StreamSink<List<int>>> openAppendSink({
    required String libraryItemId,
    String? episodeId,
    required String filename,
    required String? mimeType,
  });

  Future<bool> fileIntact({
    required String libraryItemId,
    String? episodeId,
    required String filename,
    required int expectedBytes,
  });

  Future<void> deleteItem(String libraryItemId);

  Future<void> deleteEpisode(String libraryItemId, String episodeId);
}
