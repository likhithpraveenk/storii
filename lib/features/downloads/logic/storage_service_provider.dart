import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/storage_location.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/cover_helper.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';
import 'package:storii/features/downloads/logic/internal_storage_service.dart';
import 'package:storii/features/downloads/logic/saf_storage_service.dart';
import 'package:storii/features/downloads/logic/storage_service.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/features/player/logic/session_extensions.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'storage_service_provider.g.dart';

@riverpod
StorageService storageService(Ref ref, StorageLocation location) {
  if (location.isInternal) {
    return InternalStorageService(location);
  }
  return SafStorageService(location);
}

@riverpod
StorageService? storageServiceForItem(Ref ref, DownloadItem? item) {
  final locations = ref.watch(storageLocationsProvider);
  final location = locations.firstWhereOrNull((l) => l.uri == item?.folderPath);
  if (location == null) return null;
  return ref.watch(storageServiceProvider(location));
}

@riverpod
Future<bool> isItemFullyDownloaded(Ref ref, DownloadItem item) async {
  if (item.tracks.isEmpty) return false;
  final service = ref.read(storageServiceForItemProvider(item));
  if (service == null) return false;
  final results = await Future.wait(
    item.tracks.map((t) {
      if (item.isMigratedV4) {
        return service.isFileIntact(
          relativePath: item.relativePath,
          trackPath: t.trackPath,
          expectedBytes: t.bytesTotal,
        );
      }

      return service.fileIntact(
        libraryItemId: item.libraryItemId,
        episodeId: item.episodeId,
        filename: t.filename ?? '',
        expectedBytes: t.bytesTotal,
      );
    }),
  );
  return results.every((intact) => intact);
}

@riverpod
Future<(Map<int, String>, String?)> resolveLocalPaths(
  Ref ref,
  PlaybackSession session,
) async {
  final tracks = session.audioTracks;
  final key = mediaItemIdKey(session.libraryItemId, session.episodeId);
  final downloadItem = ref.read(downloadsProvider).value?[key];

  final trackPaths = <int, String>{};
  if (tracks == null || tracks.isEmpty || downloadItem == null) {
    if (downloadItem == null && tracks != null && tracks.isNotEmpty) {
      LogService.log(
        'no download item found for ${session.displayTitle}',
        source: 'resolveLocalPaths',
      );
    }
    return (trackPaths, null);
  }
  final service = ref.read(storageServiceForItemProvider(downloadItem));
  if (service == null) return (trackPaths, null);

  final coverPath = await ref
      .read(coverHelperProvider)
      .coverPathIfExists(
        session.libraryItemId,
        isPodcast: session.isPodcastEpisode,
      );

  for (final track in tracks) {
    final String? local;
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

    if (downloadItem.isMigratedV4) {
      local = await service.getTrackPath(
        relativePath: downloadItem.relativePath,
        trackPath: dTrack.trackPath,
      );
      if (local == null) {
        LogService.log(
          'track missing index=${track.index} path=${dTrack.trackPath}',
          level: .warning,
          source: 'StorageServiceProvider',
        );
      }
    } else {
      final filename = track.metadata?.filename ?? track.index.toString();
      local = await service.trackPathIfExists(
        libraryItemId: session.libraryItemId,
        episodeId: session.episodeId,
        filename: filename,
      );
      if (local == null) {
        LogService.log(
          'legacy track missing index=${track.index} filename=$filename',
          level: .warning,
          source: 'StorageServiceProvider',
        );
      }
    }

    if (local != null) trackPaths[track.index] = local;
  }

  return (trackPaths, coverPath);
}
