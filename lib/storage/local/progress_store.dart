import 'dart:convert';
import 'dart:developer';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'progress_store.g.dart';

@Riverpod(keepAlive: true)
class ProgressStore extends _$ProgressStore {
  String _key(String id, String? episodeId) =>
      '$userId:${mediaItemIdKey(id, episodeId)}';

  String? _splitKey(dynamic key) {
    if (key is! String) return null;
    final index = key.indexOf(':');
    if (index == -1) return null;
    final keyUserId = key.substring(0, index);
    if (keyUserId != userId) return null;
    return key.substring(index + 1);
  }

  MediaProgress? _itemFromValue(String? value) {
    if (value == null) return null;
    try {
      return MediaProgress.fromJson(jsonDecode(value));
    } catch (e) {
      log('Failed to decode media progress: $e');
      return null;
    }
  }

  @override
  Stream<Map<String, MediaProgress>> build(String userId) {
    final items = _getAll();
    return userMediaProgressBox
        .watch()
        .map((event) {
          final mapKey = _splitKey(event.key);
          if (mapKey == null) return null;

          if (event.deleted) {
            items.remove(mapKey);
          } else {
            final item = _itemFromValue(event.value);
            if (item != null) {
              items[mediaItemIdKey(item.libraryItemId, item.episodeId)] = item;
            } else {
              items.remove(mapKey);
            }
          }
          return Map<String, MediaProgress>.from(items);
        })
        .whereType<Map<String, MediaProgress>>()
        .startWith(Map<String, MediaProgress>.from(items));
  }

  Map<String, MediaProgress> _getAll() {
    final entries = userMediaProgressBox.toMap().entries;
    final items = <String, MediaProgress>{};
    for (final entry in entries) {
      final mapKey = _splitKey(entry.key);
      if (mapKey == null) continue;
      final item = _itemFromValue(entry.value);
      if (item != null) {
        items[mediaItemIdKey(item.libraryItemId, item.episodeId)] = item;
      }
    }
    return items;
  }

  void put(MediaProgress progress) {
    try {
      userMediaProgressBox.put(
        _key(progress.libraryItemId, progress.episodeId),
        jsonEncode(progress),
      );
    } catch (e) {
      LogService.log(
        'Failed to save media progress',
        originalError: e,
        level: .error,
      );
    }
  }

  void putAll(List<MediaProgress> list) {
    final keysToDelete = userMediaProgressBox.keys
        .where((k) => _splitKey(k) != null)
        .toList();

    final entries = <String, String>{
      for (final p in list) _key(p.libraryItemId, p.episodeId): jsonEncode(p),
    };

    try {
      userMediaProgressBox
        ..deleteAll(keysToDelete)
        ..putAll(entries);
    } catch (e) {
      LogService.log(
        'Failed to sync media progress',
        originalError: e,
        level: .error,
      );
    }
  }
}
