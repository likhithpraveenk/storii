import 'dart:convert';
import 'dart:developer';

import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'download_storage.g.dart';

@Riverpod(keepAlive: true)
DownloadStorage downloadStorage(Ref ref) {
  final box = Hive.box<String>(downloadsBox);
  return DownloadStorage(box);
}

class DownloadStorage {
  final Box<String> _box;

  DownloadStorage(this._box);

  Map<String, DownloadItem> loadAll() {
    final out = <String, DownloadItem>{};
    for (final key in _box.keys) {
      try {
        final data = _box.get(key);
        if (data != null) {
          out[key as String] = DownloadItem.fromJson(jsonDecode(data));
        }
      } catch (e, st) {
        log('Failed to load download item $key: $e', stackTrace: st);
      }
    }
    return out;
  }

  Future<void> save(DownloadItem item) async {
    try {
      await _box.put(item.libraryItemId, jsonEncode(item.toJson()));
    } catch (e) {
      log('Failed to save download item [${item.title}]: $e');
    }
  }

  Future<void> remove(String id) async {
    await _box.delete(id);
  }
}
