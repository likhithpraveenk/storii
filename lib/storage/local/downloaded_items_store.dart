import 'dart:convert';

import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'downloaded_items_store.g.dart';

LibraryItem? _decode(String? value, String key) {
  if (value == null) return null;
  try {
    return LibraryItem.fromJson(jsonDecode(value) as Map<String, dynamic>);
  } catch (e, st) {
    LogService.log(
      'failed to decode downloaded item'
      '\nrecovery: go to book details screen when connected to server',
      level: .error,
      originalError: e,
      stackTrace: st,
      source: 'DownloadedItemsStore',
    );
    _box.delete(key);
    return null;
  }
}

LazyBox<String> get _box => Hive.lazyBox(downloadedItemsBoxName);

class DownloadedItemsStore {
  const new();

  Future<void> put(LibraryItem item) async {
    await _box.put(item.id, jsonEncode(item));
  }

  Future<LibraryItem?> get(String id) async {
    final json = await _box.get(id);
    return _decode(json, id);
  }

  Future<void> delete(String id) => _box.delete(id);
}

@riverpod
DownloadedItemsStore downloadedItemsStore(Ref ref) =>
    const DownloadedItemsStore();

@riverpod
Future<LibraryItem?> downloadedItem(Ref ref, String id) =>
    ref.read(downloadedItemsStoreProvider).get(id);
