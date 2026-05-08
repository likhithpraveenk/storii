import 'dart:io';
import 'dart:typed_data';

import 'package:abs_api/abs_api.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'downloads_filesystem_helper.g.dart';

@Riverpod(keepAlive: true)
DownloadsFilesystemHelper downloadsFsHelper(Ref ref) {
  return DownloadsFilesystemHelper();
}

class DownloadsFilesystemHelper {
  Directory? _cachedRoot;

  static const int _maxNameLength = 200;

  Future<Directory> rootDirectory() async {
    if (_cachedRoot != null) return _cachedRoot!;

    final base = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(base.path, downloadsDir));

    if (!await dir.exists()) await dir.create(recursive: true);

    _cachedRoot = dir;
    return _cachedRoot!;
  }

  Future<Directory> itemDirectory(String itemTitle) async {
    final root = await rootDirectory();
    final name = _sanitize(itemTitle);
    final dir = Directory(p.join(root.path, name));
    if (!await dir.exists()) await dir.create();
    return dir;
  }

  Future<String> trackPath({
    required String itemTitle,
    required String filename,
  }) async {
    final dir = await itemDirectory(itemTitle);
    return p.join(dir.path, filename);
  }

  Future<String?> trackPathIfExists({
    required String itemTitle,
    required String filename,
  }) async {
    final path = await trackPath(itemTitle: itemTitle, filename: filename);
    final fileExists = await fileIntact(path);
    return fileExists ? path : null;
  }

  Future<String> coverPath(String itemTitle) async {
    final dir = await itemDirectory(itemTitle);
    return p.join(dir.path, 'cover.jpg');
  }

  Future<void> saveCover(String itemTitle, Uint8List data) async {
    final path = await coverPath(itemTitle);
    await File(path).writeAsBytes(data);
  }

  Future<String?> coverPathIfExists(String itemTitle) async {
    final path = await coverPath(itemTitle);
    final fileExists = await fileIntact(path);
    return fileExists ? path : null;
  }

  Future<bool> fileIntact(String path) async {
    final f = File(path);
    return await f.exists() && await f.length() > 0;
  }

  Future<int> fileSize(String path) async {
    final f = File(path);
    return await f.length();
  }

  Future<void> deleteItem(String itemTitle) async {
    final dir = await itemDirectory(itemTitle);
    await dir.delete(recursive: true);
  }

  Future<bool> isFullyDownloaded(DownloadItem item) async {
    if (item.tracks.isEmpty) return false;
    final results = await Future.wait(
      item.tracks.map((t) => fileIntact(t.localPath)),
    );
    return results.every((intact) => intact);
  }

  Future<int> existingBytes(String path) async {
    final f = File(path);
    if (!await f.exists()) return 0;
    return await f.length();
  }

  Future<IOSink> openAppendSink(String path) async {
    final f = File(path);
    return f.openWrite(mode: FileMode.append);
  }

  Future<void> truncate(String path) async {
    final f = File(path);
    await f.writeAsBytes([]);
  }

  Future<bool> exists(String path) async {
    return await File(path).exists();
  }

  String _sanitize(String name) {
    final cleaned = name.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_').trim();

    return cleaned.length > _maxNameLength
        ? cleaned.substring(0, _maxNameLength)
        : cleaned;
  }
}

extension ToDownloadItemX on LibraryItem {
  Future<DownloadItem> toDownloadItem({
    required String userId,
    required Uri serverUrl,
    DownloadItem? existing,
  }) async {
    final filesystem = DownloadsFilesystemHelper();
    final downloadTracks = await Future.wait(
      tracks.map((track) async {
        final path = await filesystem.trackPath(
          itemTitle: title ?? id,
          filename: track.metadata?.filename ?? track.index.toString(),
        );
        final prev = existing?.tracks.firstWhereOrNull(
          (dt) => dt.audioTrack.index == track.index,
        );

        final intact =
            prev?.status == .completed && await filesystem.fileIntact(path);

        final existingBytes = await filesystem.existingBytes(path);

        final audioFile = audioFiles.firstWhere((f) => f.index == track.index);
        return DownloadTrack(
          audioTrack: track,
          localPath: path,
          ino: audioFile.ino,
          status: intact ? .completed : (existingBytes > 0 ? .paused : .queued),
          bytesReceived: existingBytes,
          bytesTotal: audioFile.metadata.size,
        );
      }),
    );

    final downloadItem =
        existing?.copyWith(tracks: downloadTracks, status: .queued) ??
        DownloadItem(
          libraryItemId: id,
          title: title ?? id,
          author: authorName ?? l10n.noAuthor,
          tracks: downloadTracks,
          startedAt: DateTime.now(),
          serverUrl: serverUrl,
          userId: userId,
        );
    return downloadItem;
  }
}
