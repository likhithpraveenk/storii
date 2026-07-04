import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/downloads_filesystem_helper.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/storage/local/downloads_store.dart';

part 'download_migration.g.dart';

@Riverpod(keepAlive: true)
class DownloadMigrationV2 extends _$DownloadMigrationV2 {
  @override
  void build() {}

  Future<void> runIfNeeded() async {
    final isV2Migrated = ref.read(downloadPathsV2MigratedProvider);
    if (isV2Migrated) return;

    final store = ref.read(downloadsStoreProvider.notifier);
    final fs = ref.read(downloadsFsHelperProvider);

    final items = store.getAll();

    for (final item in items.values) {
      await _migrateItem(item, store, fs);
    }

    await ref
        .read(appSettingsProvider.notifier)
        .setDownloadPathsV2Migrated(true);
  }

  Future<void> _migrateItem(
    DownloadItem item,
    DownloadsStore store,
    DownloadsFilesystemHelper fs,
  ) async {
    final isOldStyle = item.tracks.any(
      (t) =>
          !t.localPath.contains('/$audiobooksSubDir/') &&
          !t.localPath.contains('/$podcastsSubDir/'),
    );
    if (!isOldStyle) return;

    final updatedTracks = <DownloadTrack>[];
    for (final track in item.tracks) {
      final newPath = item.episodeId != null
          ? await fs.podcastTrackPath(
              item.libraryItemId,
              item.episodeId!,
              p.basename(track.localPath),
            )
          : await fs.audiobookTrackPath(
              item.libraryItemId,
              p.basename(track.localPath),
            );

      final oldFile = File(track.localPath);
      DownloadStatus newStatus = track.status;

      if (await oldFile.exists()) {
        try {
          await Directory(p.dirname(newPath)).create(recursive: true);
          await oldFile.rename(newPath);
        } catch (_) {
          try {
            await oldFile.copy(newPath);
            await oldFile.delete();
          } catch (_) {
            newStatus = .queued;
          }
        }
      }

      updatedTracks.add(track.copyWith(localPath: newPath, status: newStatus));
    }

    await store.save(item.copyWith(tracks: updatedTracks));
  }
}
