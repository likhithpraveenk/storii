import 'dart:convert';

import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'items_cache.g.dart';

class ItemsCache {
  const new();

  LazyBox<String> get _box => Hive.lazyBox(itemsBoxName);

  Future<void> put(LibraryItem item) async {
    await _box.put(item.id, jsonEncode(item));
  }

  Future<LibraryItem?> get(String id) async {
    final json = await _box.get(id);
    if (json == null) return null;
    return LibraryItem.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }

  Future<void> delete(String id) => _box.delete(id);
}

@riverpod
ItemsCache itemsCache(Ref ref) => const ItemsCache();

@riverpod
Future<LibraryItem?> cachedItem(Ref ref, String id) =>
    ref.watch(itemsCacheProvider).get(id);
