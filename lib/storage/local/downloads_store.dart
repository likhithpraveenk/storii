import 'dart:convert';
import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'downloads_store.g.dart';

@Riverpod(keepAlive: true)
class DownloadsStore extends _$DownloadsStore {
  DownloadItem? _itemFromValue(String? value) {
    if (value == null) return null;
    try {
      return DownloadItem.fromJson(jsonDecode(value));
    } catch (e) {
      log('Failed to decode download item: $e');
      return null;
    }
  }

  Map<String, DownloadItem> _decode(Iterable<String> values) {
    return Map.fromEntries(
      values
          .map(_itemFromValue)
          .whereType<DownloadItem>()
          .map((item) => MapEntry(item.key, item)),
    );
  }

  @override
  Stream<Map<String, DownloadItem>> build() {
    final items = _decode(downloadsBox.values);
    return downloadsBox
        .watch()
        .map((event) {
          if (event.deleted) {
            items.remove(event.key);
          } else {
            final item = _itemFromValue(event.value as String?);
            if (item != null) {
              items[item.key] = item;
            } else {
              items.remove(event.key);
            }
          }
          return Map<String, DownloadItem>.from(items);
        })
        .startWith(Map<String, DownloadItem>.from(items));
  }

  Future<void> save(DownloadItem item) async {
    try {
      await downloadsBox.put(item.key, jsonEncode(item));
    } catch (e) {
      log('Failed to save download item [${item.title}]: $e');
    }
  }

  Future<void> remove(String id) => downloadsBox.delete(id);

  Map<String, DownloadItem> getAll() => _decode(downloadsBox.values);

  Future<void> removeAll(Iterable<String> ids) async {
    for (final id in ids) {
      await downloadsBox.delete(id);
    }
  }

  Future<void> clear() => downloadsBox.clear();
}
