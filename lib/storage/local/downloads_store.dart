import 'dart:convert';

import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'downloads_store.g.dart';

DownloadItem? _decode(String? value, String key) {
  if (value == null) return null;
  try {
    return DownloadItem.fromJson(jsonDecode(value));
  } catch (e, st) {
    LogService.log(
      'failed to decode download item: ${value.substring(0, 200)}'
      '\nrecovery: files are safe, db entry removed. re-download',
      level: .error,
      originalError: e,
      stackTrace: st,
      source: 'DownloadsStore',
    );
    _box.delete(key);
    return null;
  }
}

LazyBox<String> get _box => Hive.lazyBox(downloadsBoxName);

class DownloadsStore {
  const new();

  Future<void> save(DownloadItem item) async {
    await _box.put(item.key, jsonEncode(item));
  }

  Future<void> remove(String id) => _box.delete(id);

  Future<DownloadItem?> get(String mediaItemIdKey) async {
    final value = await _box.get(mediaItemIdKey);
    return _decode(value, mediaItemIdKey);
  }

  Future<Map<String, DownloadItem>> getAll() async {
    final map = <String, DownloadItem>{};
    for (final key in _box.keys) {
      final value = await _box.get(key);
      if (value == null) continue;
      final item = _decode(value, key);
      if (item != null) map[item.key] = item;
    }
    return map;
  }

  Future<void> removeAllFromLocation(String uri) async {
    final map = await getAll();
    final keys = map.values.where((i) => i.folderPath == uri).map((d) => d.key);
    await _box.deleteAll(keys);
  }

  Future<void> clear() => _box.clear();

  Stream<Map<String, DownloadItem>> watch() async* {
    final map = await getAll();
    yield* _box
        .watch()
        .map((e) {
          if (e.deleted) {
            map.remove(e.key);
          } else {
            final item = _decode(e.value, e.key);
            if (item != null) {
              map[item.key] = item;
            } else {
              map.remove(e.key);
            }
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
