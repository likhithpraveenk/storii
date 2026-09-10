import 'dart:async';
import 'dart:typed_data';

import 'package:saf_stream/saf_stream.dart';
import 'package:saf_stream/saf_stream_platform_interface.dart';
import 'package:saf_util/saf_util.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/features/downloads/logic/storage_service.dart';

class SafStorageService extends StorageService {
  final SafUtil _safUtil;

  new(super.location) : _safUtil = SafUtil();

  @override
  Future<String> folderPath({
    required String libraryItemId,
    String? episodeId,
  }) async {
    try {
      final folder = await _safUtil.mkdirp(location.uri, [
        libraryItemId,
        ?episodeId,
      ]);
      return folder.uri;
    } catch (e) {
      LogService.log(
        'Folder doesn\'t exist or permission revoked at ${location.uri}',
        originalError: e,
        level: .error,
        source: 'SafStorageService',
      );
      throw Exception('Folder doesn\'t exist or permission revoked');
    }
  }

  @override
  Future<String?> trackPathIfExists({
    required String libraryItemId,
    String? episodeId,
    required String filename,
  }) async {
    final file = await _safUtil.child(location.uri, [
      libraryItemId,
      ?episodeId,
      filename,
    ]);
    return file?.isDir == true ? null : file?.uri;
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
    final f = await _safUtil.stat(filePath, false);
    return f?.length ?? 0;
  }

  @override
  Future<StreamSink<List<int>>> openAppendSink({
    required String libraryItemId,
    String? episodeId,
    required String filename,
    required String? mimeType,
  }) async {
    final path = await folderPath(
      libraryItemId: libraryItemId,
      episodeId: episodeId,
    );
    final adapter = SafStreamSinkAdapter(path);
    await adapter.init(filename, mimeType);
    return adapter;
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
    final stat = await _safUtil.stat(filePath, false);
    final actual = stat?.length ?? 0;
    if (actual <= 0) return false;
    return expectedBytes <= 0 || actual >= expectedBytes;
  }

  @override
  Future<void> deleteItem(String libraryItemId) async {
    final path = await folderPath(libraryItemId: libraryItemId);
    try {
      await _safUtil.delete(path, true);
    } catch (e) {
      LogService.log(
        'Unable to delete item at $path',
        originalError: e,
        level: .error,
        source: 'SafStorageService',
      );
    }
  }

  @override
  Future<void> deleteEpisode(String libraryItemId, String episodeId) async {
    final path = await folderPath(
      libraryItemId: libraryItemId,
      episodeId: episodeId,
    );
    try {
      await _safUtil.delete(path, true);
    } catch (e) {
      LogService.log(
        'Unable to delete episode at $path',
        originalError: e,
        level: .error,
        source: 'SafStorageService',
      );
    }
  }
}

class SafStreamSinkAdapter implements StreamSink<List<int>> {
  new(this.folderPath) : _saf = SafStream();

  final String folderPath;
  late final SafStream _saf;
  late final SafWriteStreamInfo _info;

  Future<void> init(String filename, String? mimeType) async {
    _info = await _saf.startWriteStream(
      folderPath,
      filename,
      mimeType ?? 'audio/mpeg',
    );
  }

  @override
  void add(List<int> data) =>
      _saf.writeChunk(_info.session, Uint8List.fromList(data));

  @override
  Future<void> close() async => await _saf.endWriteStream(_info.session);

  @override
  void addError(Object error, [StackTrace? stackTrace]) =>
      throw UnimplementedError();

  @override
  Future<void> addStream(Stream<List<int>> stream) =>
      throw UnimplementedError();

  @override
  Future<void> get done => throw UnimplementedError();
}
