import 'dart:convert';

import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'downloaded_items_store.g.dart';

class DownloadedItemsStore {
  const new();

  LazyBox<String> get _box => Hive.lazyBox(downloadedItemsBoxName);

  Future<void> put(LibraryItem item) async {
    await _box.put(item.id, jsonEncode(item));
  }

  Future<LibraryItem?> get(String id) async {
    final json = await _box.get(id);
    if (json == null) return null;
    try {
      return LibraryItem.fromJson(jsonDecode(json) as Map<String, dynamic>);
    } catch (e, st) {
      LogService.log(
        'failed to decode downloaded item: $id',
        level: .error,
        originalError: e,
        stackTrace: st,
        source: 'DownloadedItemsStore',
      );
      return null;
    }
  }

  Future<void> delete(String id) => _box.delete(id);
}

@riverpod
DownloadedItemsStore downloadedItemsStore(Ref ref) =>
    const DownloadedItemsStore();

@riverpod
Future<LibraryItem?> downloadedItem(Ref ref, String id) =>
    ref.read(downloadedItemsStoreProvider).get(id);
