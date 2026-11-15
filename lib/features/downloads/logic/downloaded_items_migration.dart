import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/storage/local/downloaded_items_store.dart';
import 'package:storii/storage/local/downloads_store.dart';
import 'package:storii/storage/local/items_cache.dart';

part 'downloaded_items_migration.g.dart';

@Riverpod(keepAlive: true)
class DownloadedItemsMigration extends _$DownloadedItemsMigration {
  @override
  Future<void> build() async {
    if (ref.read(downloadedItemsMigratedProvider)) return;

    final cacheStore = ref.read(itemsCacheProvider);
    final dItemsStore = ref.read(downloadedItemsStoreProvider);

    final map = await ref.read(downloadsStoreProvider).getAll();
    if (map.values.isEmpty) {
      await ref
          .read(appSettingsProvider.notifier)
          .setDownloadedItemsMigrated(true);
      return;
    }

    final missing = <String>[];
    for (final dItem in map.values) {
      try {
        final item = await cacheStore.get(dItem.libraryItemId);
        if (item == null) {
          missing.add(dItem.title);
          continue;
        }
        await dItemsStore.put(item);
        await cacheStore.delete(item.id);
      } catch (_) {
        missing.add(dItem.title);
        continue;
      }
    }

    if (missing.isNotEmpty) {
      LogService.log(
        'downloaded items migration: missing from cache: $missing',
        level: .warning,
        source: 'DownloadedItemsMigration',
      );
    }
    await ref
        .read(appSettingsProvider.notifier)
        .setDownloadedItemsMigrated(true);
  }
}
