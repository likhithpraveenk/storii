import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/storage_service_provider.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/storage/local/downloads_store.dart';
import 'package:storii/storage/local/items_cache.dart';

part 'download_migration.g.dart';

@Riverpod(keepAlive: true)
class DownloadMigrationV4 extends _$DownloadMigrationV4 {
  @override
  void build() {}

  Future<void> runIfNeeded() async {
    final isV4Migrated = ref.read(downloadPathsV4MigratedProvider);
    if (isV4Migrated) return;

    final store = ref.read(downloadsStoreProvider.notifier);
    final items = store.getAll();
    final errorItems = <String>[];

    await Future.wait(
      items.values.map((i) async {
        if (!i.isMigratedV4) {
          final error = await _migrateItem(i, store);
          if (error != null) {
            errorItems.add(error);
          }
        }
      }),
    );
    if (errorItems.isEmpty) {
      await ref
          .read(appSettingsProvider.notifier)
          .setDownloadPathsV4Migrated(true);
    } else {
      LogService.log('Error migrating downloads: $errorItems', level: .warning);
    }
  }

  Future<String?> _migrateItem(DownloadItem item, DownloadsStore store) async {
    final service = ref.read(storageServiceForItemProvider(item));
    if (service == null) return item.title;

    var newItem = item.copyWith();
    LibraryItem libraryItem;
    try {
      final cachedItem = ref
          .read(itemsCacheProvider.notifier)
          .get(item.libraryItemId);
      if (cachedItem == null ||
          (cachedItem.relPath.isEmpty && !cachedItem.isFile)) {
        libraryItem = await ref.read(
          itemDetailProvider(item.libraryItemId).future,
        );
        await ref.read(itemsCacheProvider.notifier).put(libraryItem);
        if (libraryItem.relPath.isEmpty && !libraryItem.isFile) {
          return item.title;
        }
      } else {
        libraryItem = cachedItem;
      }
    } catch (_) {
      return item.title;
    }

    if (libraryItem.relPath.isEmpty && !libraryItem.isFile) {
      return item.title;
    } else {
      final remoteList = {for (final f in libraryItem.audioFiles) f.ino: f};
      newItem = newItem.copyWith(
        relativePath: libraryItem.relPath,
        tracks: item.tracks.map((t) {
          final match = remoteList[t.ino];
          return match != null
              ? t.copyWith(trackPath: match.metadata.relPath)
              : t;
        }).toList(),
      );
    }

    for (final track in newItem.tracks) {
      final success = await service.migrateToV4Path(
        libraryItemId: newItem.libraryItemId,
        filename: track.filename ?? '',
        relativePath: newItem.relativePath,
        trackPath: track.trackPath,
      );
      if (!success) return item.title;
    }

    await store.save(newItem);
    unawaited(service.cleanupEmptyFolders());
    return null;
  }
}
