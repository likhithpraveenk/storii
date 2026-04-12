import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/models/download_item.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';

class DownloadService {
  final Dio _dio = Dio();

  static Future<Directory> _rootDir() async {
    final base = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(base.path, downloadsDir));

    if (!await dir.exists()) await dir.create(recursive: true);
    return dir;
  }

  static Future<Directory> itemDir(String libraryItemId) async {
    final root = await _rootDir();
    final dir = Directory(p.join(root.path, libraryItemId));

    if (!await dir.exists()) await dir.create();
    return dir;
  }

  static Future<String> trackPath(
    String libraryItemId,
    int trackIndex,
    String mimeType,
  ) async {
    final dir = await itemDir(libraryItemId);
    final ext = _extForMime(mimeType);

    return p.join(
      dir.path,
      'track_${trackIndex.toString().padLeft(3, '0')}$ext',
    );
  }

  static String _extForMime(String mime) {
    if (mime.contains('mpeg')) return '.mp3';
    if (mime.contains('mp4') || mime.contains('m4a')) return '.m4a';
    if (mime.contains('ogg')) return '.ogg';
    if (mime.contains('opus')) return '.opus';
    if (mime.contains('flac')) return '.flac';
    if (mime.contains('wav')) return '.wav';
    return '.audio';
  }

  Future<String> downloadTrack({
    required Uri serverUrl,
    required String token,
    required String libraryItemId,
    required AudioTrack track,
    required void Function(int received, int total) onProgress,
    CancelToken? cancelToken,
  }) async {
    final localPath = await trackPath(
      libraryItemId,
      track.index,
      track.mimeType,
    );

    final file = File(localPath);
    if (await file.exists()) {
      final size = await file.length();
      if (size > 0) return localPath;
    }

    final url = serverUrl.resolve(track.contentUrl).toString();

    await _dio.download(
      url,
      localPath,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      onReceiveProgress: onProgress,
      cancelToken: cancelToken,
    );

    return localPath;
  }

  static Future<void> deleteItem(String libraryItemId) async {
    final dir = await itemDir(libraryItemId);
    if (await dir.exists()) await dir.delete(recursive: true);
  }

  static Future<int> itemSizeOnDisk(String libraryItemId) async {
    final dir = await itemDir(libraryItemId);
    if (!await dir.exists()) return 0;
    int total = 0;
    await for (final f in dir.list()) {
      if (f is File) total += await f.length();
    }
    return total;
  }

  static Future<List<DownloadTrack>> buildTrackStubs(LibraryItem item) async {
    final tracks = item.tracks;
    return Future.wait(
      tracks.map((t) async {
        final path = await trackPath(item.id, t.index, t.mimeType);
        return DownloadTrack(
          index: t.index,
          contentUrl: t.contentUrl,
          localPath: path,
          mimeType: t.mimeType,
        );
      }),
    );
  }

  static Future<String?> localPathIfDownloaded(
    String libraryItemId,
    AudioTrack track,
  ) async {
    final path = await trackPath(libraryItemId, track.index, track.mimeType);
    final file = File(path);
    if (await file.exists() && await file.length() > 0) return path;
    return null;
  }

  static Future<bool> isFullyDownloaded(
    String libraryItemId,
    List<AudioTrack> tracks,
  ) async {
    for (final track in tracks) {
      final local = await localPathIfDownloaded(libraryItemId, track);
      if (local == null) return false;
    }
    return tracks.isNotEmpty;
  }
}
