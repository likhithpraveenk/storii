import 'dart:async';

import 'package:storii/app/models/storage_location.dart';
import 'package:storii/features/downloads/logic/storage_service.dart';
import 'package:storii/features/downloads/models/download_item.dart';

class FakeTrackSink implements StreamSink<List<int>> {
  final List<int> bytes = <int>[];
  bool closed = false;

  @override
  void add(List<int> data) {
    bytes.addAll(data);
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {}

  @override
  Future<void> addStream(Stream<List<int>> stream) async {
    await stream.forEach(add);
  }

  @override
  Future<void> close() async {
    closed = true;
  }

  @override
  Future<void> get done async {}
}

class FakeStorageService extends StorageService {
  new(super.location, {this.existingBytes = 0});

  int existingBytes;
  final List<FakeTrackSink> sinks = <FakeTrackSink>[];
  final List<String> deletedTracks = <String>[];
  int getBytesCalls = 0;

  @override
  Future<String?> getTrackPath({
    required String relativePath,
    required String trackPath,
  }) async => null;

  @override
  Future<int> getBytes({
    required String relativePath,
    required String trackPath,
  }) async {
    getBytesCalls++;
    return existingBytes;
  }

  @override
  Future<StreamSink<List<int>>> getSink({
    required String relativePath,
    required String trackPath,
    required String? mimeType,
  }) async {
    final sink = FakeTrackSink();
    sinks.add(sink);
    return sink;
  }

  @override
  Future<bool> isFileIntact({
    required String relativePath,
    required String trackPath,
    required int expectedBytes,
  }) async => true;

  @override
  Future<void> deleteFolder({required String relativePath}) async {}

  @override
  Future<void> deleteTrack({
    required String relativePath,
    required String trackPath,
  }) async {
    deletedTracks.add(trackPath);
    existingBytes = 0;
  }

  @override
  Future<void> cleanupEmptyFolders() async {}
}

const fakeStorageLocation = StorageLocation(
  name: 'loc',
  uri: '/downloads',
  mediaType: DownloadMediaType.audiobook,
  isInternal: true,
);
