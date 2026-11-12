import 'dart:convert';

import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'downloads_store.g.dart';

DownloadItem? _decode(String? value) {
  if (value == null) return null;
  try {
    return DownloadItem.fromJson(jsonDecode(value));
  } catch (e, st) {
    LogService.log(
      'failed to decode download item: $value',
      level: .error,
      originalError: e,
      stackTrace: st,
      source: 'DownloadsStore',
    );
    return null;
  }
}

Box<String> get _box => Hive.box(downloadsBoxName);

class DownloadsStore {
  const new();

  Future<void> save(DownloadItem item) async {
    await _box.put(item.key, jsonEncode(item));
  }

  Future<void> remove(String id) => _box.delete(id);

  DownloadItem? get(String mediaItemIdKey) => _decode(_box.get(mediaItemIdKey));

  Map<String, DownloadItem> getAll() => Map.fromEntries(
    _box.values
        .map(_decode)
        .whereType<DownloadItem>()
        .map((item) => MapEntry(item.key, item)),
  );

  Future<void> removeAllFromLocation(String uri) async {
    final keys = getAll().values
        .where((i) => i.folderPath == uri)
        .map((d) => d.key);
    await _box.deleteAll(keys);
  }

  Future<void> clear() => _box.clear();

  Stream<Map<String, DownloadItem>> watch() {
    final map = getAll();
    return _box
        .watch()
        .map((e) {
          final item = e.deleted ? null : _decode(e.value);
          if (item != null) {
            map[item.key] = item;
          } else {
            map.remove(e.key);
          }
          return Map<String, DownloadItem>.from(map);
        })
        .startWith(Map<String, DownloadItem>.from(map));
  }
}

@riverpod
DownloadsStore downloadsStore(Ref ref) => const DownloadsStore();

@riverpod
Stream<Map<String, DownloadItem>> downloads(Ref ref) =>
    ref.watch(downloadsStoreProvider).watch();
