import 'dart:io';

import 'package:abs_api/abs_api.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/features/downloads/models/download_item.dart';

part 'downloads_filesystem_helper.g.dart';

@Riverpod(keepAlive: true)
DownloadsFilesystemHelper downloadsFsHelper(Ref ref) {
  return const DownloadsFilesystemHelper();
}

class DownloadsFilesystemHelper {
  const DownloadsFilesystemHelper();

  Future<Directory> rootDirectory() async {
    // if (externalPath != null) {
    //   final external = Directory(externalPath!);
    //   if (await external.exists()) {
    //     try {
    //       final testFile = File(p.join(external.path, '.storii_write_test'));
    //       await testFile.writeAsString('');
    //       await testFile.delete();
    //       return external;
    //     } catch (e) {
    //       LogService.log(
    //         'Failed to write to download location: $externalPath',
    //         originalError: e,
    //         level: .error,
    //         source: 'DownloadsFilesystemHelper',
    //       );
    //     }
    //   }
    // }

    final base = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(base.path, downloadsDir));

    if (!await dir.exists()) await dir.create(recursive: true);

    return dir;
  }

  Future<Directory> audiobookDirectory(String libraryItemId) async {
    final root = await rootDirectory();
    final dir = Directory(p.join(root.path, audiobooksSubDir, libraryItemId));
    if (!await dir.exists()) await dir.create(recursive: true);
    return dir;
  }

  Future<String> audiobookTrackPath(
    String libraryItemId,
    String filename,
  ) async {
    final dir = await audiobookDirectory(libraryItemId);
    return p.join(dir.path, filename);
  }

  Future<String?> audiobookTrackPathIfExists(
    String libraryItemId,
    String filename,
  ) async {
    final path = await audiobookTrackPath(libraryItemId, filename);
    final fileExists = await fileIntact(path);
    return fileExists ? path : null;
  }

  Future<String> audiobookCoverPath(String libraryItemId) async {
    final dir = await audiobookDirectory(libraryItemId);
    return p.join(dir.path, coverName);
  }

  Future<String?> audiobookCoverPathIfExists(String libraryItemId) async {
    final path = await audiobookCoverPath(libraryItemId);
    final fileExists = await fileIntact(path);
    return fileExists ? path : null;
  }

  Future<void> saveAudiobookCover(String libraryItemId, List<int> data) async {
    final path = await audiobookCoverPath(libraryItemId);
    await File(path).writeAsBytes(data);
  }

  Future<void> deleteAudiobook(String libraryItemId) async {
    final root = await rootDirectory();
    final dir = Directory(p.join(root.path, audiobooksSubDir, libraryItemId));
    if (await dir.exists()) await dir.delete(recursive: true);
  }

  Future<Directory> podcastDirectory(String libraryItemId) async {
    final root = await rootDirectory();
    final dir = Directory(p.join(root.path, podcastsSubDir, libraryItemId));
    if (!await dir.exists()) await dir.create(recursive: true);
    return dir;
  }

  Future<Directory> episodeDirectory(
    String libraryItemId,
    String episodeId,
  ) async {
    final root = await rootDirectory();
    final dir = Directory(
      p.join(root.path, podcastsSubDir, libraryItemId, episodeId),
    );
    if (!await dir.exists()) await dir.create(recursive: true);
    return dir;
  }

  Future<String> podcastTrackPath(
    String libraryItemId,
    String episodeId,
    String filename,
  ) async {
    final dir = await episodeDirectory(libraryItemId, episodeId);
    return p.join(dir.path, filename);
  }

  Future<String?> podcastTrackPathIfExists(
    String libraryItemId,
    String episodeId,
    String filename,
  ) async {
    final path = await podcastTrackPath(libraryItemId, episodeId, filename);
    final fileExists = await fileIntact(path);
    return fileExists ? path : null;
  }

  Future<String> podcastCoverPath(String libraryItemId) async {
    final dir = await podcastDirectory(libraryItemId);
    return p.join(dir.path, coverName);
  }

  Future<String?> podcastCoverPathIfExists(String libraryItemId) async {
    final path = await podcastCoverPath(libraryItemId);
    final fileExists = await fileIntact(path);
    return fileExists ? path : null;
  }

  Future<void> savePodcastCover(String libraryItemId, List<int> data) async {
    final path = await podcastCoverPath(libraryItemId);
    await File(path).writeAsBytes(data);
  }

  Future<void> deletePodcastEpisode(
    String libraryItemId,
    String episodeId,
  ) async {
    final root = await rootDirectory();
    final dir = Directory(
      p.join(root.path, podcastsSubDir, libraryItemId, episodeId),
    );
    if (await dir.exists()) await dir.delete(recursive: true);
  }

  Future<void> deletePodcastIfEmpty(String libraryItemId) async {
    final root = await rootDirectory();
    final dir = Directory(p.join(root.path, podcastsSubDir, libraryItemId));
    if (await dir.exists()) {
      final entities = dir.listSync();
      if (entities.isEmpty) {
        await dir.delete(recursive: true);
      }
    }
  }

  Future<bool> fileIntact(String path, {int expectedBytes = 0}) async {
    final f = File(path);
    if (!await f.exists()) return false;
    final actual = await f.length();
    if (actual <= 0) return false;
    return expectedBytes <= 0 || actual >= expectedBytes;
  }

  Future<int> fileSize(String path) async {
    final f = File(path);
    return await f.length();
  }

  Future<bool> isFullyDownloaded(DownloadItem item) async {
    if (item.tracks.isEmpty) return false;
    final results = await Future.wait(
      item.tracks.map(
        (t) => fileIntact(t.localPath, expectedBytes: t.bytesTotal),
      ),
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

  Future<bool> exists(String path) async {
    return await File(path).exists();
  }

  Future<(Map<int, String>, String?)> resolveLocalPaths(
    PlaybackSession session,
  ) async {
    final tracks = session.audioTracks;
    final trackPaths = <int, String>{};
    if (tracks == null || tracks.isEmpty) return (trackPaths, null);

    final String? coverPath;
    if (session.episodeId != null) {
      coverPath = await podcastCoverPathIfExists(session.libraryItemId);
      final track = tracks.first;
      final local = await podcastTrackPathIfExists(
        session.libraryItemId,
        session.episodeId!,
        track.metadata?.filename ?? session.episodeId!,
      );
      if (local != null) trackPaths[track.index] = local;
    } else {
      coverPath = await audiobookCoverPathIfExists(session.libraryItemId);
      for (final track in tracks) {
        final local = await audiobookTrackPathIfExists(
          session.libraryItemId,
          track.metadata?.filename ?? track.index.toString(),
        );
        if (local != null) trackPaths[track.index] = local;
      }
    }

    return (trackPaths, coverPath);
  }
}
