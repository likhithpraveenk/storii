import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/features/downloads/logic/cover_helper.dart';
import 'package:storii/features/downloads/logic/storage_service.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/features/player/logic/session_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';

Future<bool> isItemFullyDownloaded({
  required DownloadItem item,
  required StorageService? service,
}) async {
  if (item.tracks.isEmpty) return false;
  if (service == null) return false;

  final results = await Future.wait(
    item.tracks.map((track) async {
      final stat = await service.stat(
        relativePath: item.relativePath,
        trackPath: track.trackPath,
      );
      return stat?.isIntact(track.bytesTotal) ?? false;
    }),
  );
  return results.every((intact) => intact);
}

Future<(Map<int, String>, String?)> resolveLocalPaths({
  required PlaybackSession session,
  required DownloadItem downloadItem,
  required StorageService? service,
  required CoverHelper coverHelper,
}) async {
  final tracks = session.audioTracks;
  final trackPaths = <int, String>{};
  if (tracks == null || tracks.isEmpty || service == null) {
    return (trackPaths, null);
  }

  final coverPath = await coverHelper.coverPathIfExists(
    session.libraryItemId,
    isPodcast: session.isPodcastEpisode,
  );

  for (final track in tracks) {
    final dTrack = downloadItem.tracks.firstWhereOrNull(
      (t) => t.audioTrack.index == track.index,
    );
    if (dTrack == null) {
      LogService.log(
        'no download track matched session track index=${track.index} ${track.title}',
        source: 'resolveLocalPaths',
      );
      return (trackPaths, null);
    }

    final stat = await service.stat(
      relativePath: downloadItem.relativePath,
      trackPath: dTrack.trackPath,
    );
    if (stat == null) {
      LogService.log(
        'track missing index=${track.index} path=${dTrack.trackPath}',
        level: .warning,
        source: 'resolveLocalPaths',
      );
    }

    if (stat != null) trackPaths[track.index] = stat.path;
  }

  return (trackPaths, coverPath);
}
