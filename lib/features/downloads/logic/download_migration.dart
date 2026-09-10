import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/storage_location.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/storage/local/downloads_store.dart';

part 'download_migration.g.dart';

@Riverpod(keepAlive: true)
class DownloadMigrationV3 extends _$DownloadMigrationV3 {
  @override
  void build() {}

  Future<void> runIfNeeded() async {
    final isV3Migrated = ref.read(downloadPathsV3MigratedProvider);
    if (isV3Migrated) return;

    final store = ref.read(downloadsStoreProvider.notifier);
    final items = store.getAll();

    for (final item in items.values) {
      await _migrateItem(item, store);
    }

    await ref
        .read(appSettingsProvider.notifier)
        .setDownloadPathsV3Migrated(true);
  }

  Future<void> _migrateItem(DownloadItem item, DownloadsStore store) async {
    if (item.folderPath == kMigrateToV3Sentinel) {
      final folderPath = item.isPodcast
          ? defaultInternalPodcasts.uri
          : defaultInternalAudiobooks.uri;
      await store.save(item.copyWith(folderPath: folderPath));
    }
  }
}
