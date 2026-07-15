import 'dart:async';
import 'dart:convert';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'items_cache.g.dart';

@Riverpod(keepAlive: true)
class ItemsCache extends _$ItemsCache {
  @override
  void build() {}

  Future<void> put(LibraryItem item) async {
    await itemsBox.put(item.id, jsonEncode(item));
  }

  LibraryItem? get(String id) {
    final json = itemsBox.get(id);
    if (json == null) return null;
    return LibraryItem.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }

  Future<void> delete(String id) => itemsBox.delete(id);
}
