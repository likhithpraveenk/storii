import 'dart:convert';
import 'dart:developer';

import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'downloads_store.g.dart';

@Riverpod(keepAlive: true)
class DownloadsStore extends _$DownloadsStore {
  Box<String> get _box => Hive.box<String>(downloadsBox);

  Map<String, DownloadItem> _decode(Iterable<String> values) {
    return Map.fromEntries(
      values.map((v) {
        try {
          final item = DownloadItem.fromJson(jsonDecode(v));
          return MapEntry(item.key, item);
        } catch (e) {
          log('Failed to decode download item: $e');
          return null;
        }
      }).nonNulls,
    );
  }

  @override
  Stream<Map<String, DownloadItem>> build() {
    return _box
        .watch()
        .map((_) => _decode(_box.values))
        .startWith(_decode(_box.values));
  }

  Future<void> save(DownloadItem item) async {
    try {
      await _box.put(item.key, jsonEncode(item));
    } catch (e) {
      log('Failed to save download item [${item.title}]: $e');
    }
  }

  Future<void> remove(String id) => _box.delete(id);

  Map<String, DownloadItem> getAll() => _decode(_box.values);

  Future<void> removeAll(Iterable<String> ids) async {
    for (final id in ids) {
      await _box.delete(id);
    }
  }

  Future<void> clear() => _box.clear();
}
