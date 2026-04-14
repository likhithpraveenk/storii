import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/models/download_item.dart';

abstract final class DownloadsHelper {
  static Directory? _cachedRoot;

  static Future<Directory> rootDirectory() async {
    if (_cachedRoot != null) return _cachedRoot!;

    final base = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(base.path, downloadsDir));

    if (!await dir.exists()) await dir.create(recursive: true);

    _cachedRoot = dir;
    return _cachedRoot!;
  }

  static Future<Directory> itemDirectory(String libraryItemId) async {
    final root = await rootDirectory();
    final dir = Directory(p.join(root.path, libraryItemId));

    if (!await dir.exists()) await dir.create();
    return dir;
  }

  static String extFromUrl(String contentUrl) {
    final ext = p.extension(Uri.parse(contentUrl).path);
    return ext.isNotEmpty ? ext : '.audio';
  }

  static const int _trackIndexPadding = 3;

  static Future<String> trackPath(
    String libraryItemId,
    int trackIndex,
    String contentUrl,
  ) async {
    final dir = await itemDirectory(libraryItemId);
    final ext = extFromUrl(contentUrl);
    final name =
        'track_${trackIndex.toString().padLeft(_trackIndexPadding, '0')}$ext';
    return p.join(dir.path, name);
  }
}

class DownloadService {
  DownloadService._();
  static final DownloadService instance = DownloadService._();

  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(minutes: 10),
    ),
  );

  Future<String> downloadTrack({
    required Uri serverUrl,
    required String token,
    required String libraryItemId,
    required AudioTrack track,
    required void Function(int received, int total) onProgress,
    CancelToken? cancelToken,
  }) async {
    final localPath = await DownloadsHelper.trackPath(
      libraryItemId,
      track.index,
      track.contentUrl,
    );

    if (await _isFileIntact(localPath, track)) return localPath;

    final url = serverUrl.resolve(track.contentUrl).toString();
    final file = File(localPath);

    try {
      await _dio.download(
        url,
        localPath,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
        onReceiveProgress: onProgress,
        cancelToken: cancelToken,
      );
    } catch (_) {
      await _deleteIfExists(file);
      rethrow;
    }

    return localPath;
  }

  static Future<void> deleteItem(String libraryItemId) async {
    final dir = await DownloadsHelper.itemDirectory(libraryItemId);
    if (await dir.exists()) await dir.delete(recursive: true);
  }

  static Future<int> itemSizeOnDisk(String libraryItemId) async {
    final dir = await DownloadsHelper.itemDirectory(libraryItemId);
    if (!await dir.exists()) return 0;

    int total = 0;
    await for (final entity in dir.list()) {
      if (entity is File) total += await entity.length();
    }
    return total;
  }

  static Future<List<DownloadTrack>> buildTrackStubs(
    String itemId,
    List<AudioTrack> tracks,
  ) async {
    await DownloadsHelper.itemDirectory(itemId);

    return Future.wait(
      tracks.map((t) async {
        final path = await DownloadsHelper.trackPath(
          itemId,
          t.index,
          t.contentUrl,
        );
        return DownloadTrack(audioTrack: t, localPath: path);
      }),
    );
  }

  static Future<String?> localPathIfDownloaded(
    String libraryItemId,
    AudioTrack track,
  ) async {
    final path = await DownloadsHelper.trackPath(
      libraryItemId,
      track.index,
      track.contentUrl,
    );
    final file = File(path);
    if (await file.exists() && await file.length() > 0) return path;
    return null;
  }

  static Future<bool> isFullyDownloaded(
    String libraryItemId,
    List<AudioTrack> tracks,
  ) async {
    if (tracks.isEmpty) return false;

    final results = await Future.wait(
      tracks.map((t) => localPathIfDownloaded(libraryItemId, t)),
    );
    return results.every((path) => path != null);
  }

  static Future<bool> _isFileIntact(String path, AudioTrack track) async {
    final file = File(path);
    return await file.exists() && await file.length() > 0;
  }

  static Future<void> _deleteIfExists(File file) async {
    if (await file.exists()) await file.delete();
  }
}
