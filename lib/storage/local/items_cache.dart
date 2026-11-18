import 'dart:convert';

import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'items_cache.g.dart';

LibraryItem? _decode(String? value, String key) {
  if (value == null) return null;
  try {
    return LibraryItem.fromJson(jsonDecode(value));
  } catch (e, st) {
    LogService.log(
      'failed to decode library item',
      level: .error,
      originalError: e,
      stackTrace: st,
      source: 'ItemsCache',
    );
    _box.delete(key);
    return null;
  }
}

LazyBox<String> get _box => Hive.lazyBox(itemsBoxName);

class ItemsCache {
  const new();

  Future<LibraryItem?> get(String id) async {
    return _decode(await _box.get(id), id);
  }

  Future<void> delete(String id) => _box.delete(id);
}

@riverpod
ItemsCache itemsCache(Ref ref) => const ItemsCache();
