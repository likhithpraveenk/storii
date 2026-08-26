import 'dart:convert';
import 'dart:developer';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'progress_store.g.dart';

@Riverpod(keepAlive: true)
class ProgressStore extends _$ProgressStore {
  String _key(String id, String? episodeId) =>
      '$userId:${mediaItemIdKey(id, episodeId)}';

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
    final prefix = '$userId:';

    final items = <String, MediaProgress>{};
    for (final entry in userMediaProgressBox.toMap().entries) {
      final key = entry.key as String;
      if (!key.startsWith(prefix)) continue;
      final item = _itemFromValue(entry.value as String?);
      if (item != null) {
        items[mediaItemIdKey(item.libraryItemId, item.episodeId)] = item;
      }
    }

    return userMediaProgressBox
        .watch()
        .where((event) => (event.key as String).startsWith(prefix))
        .map((event) {
          if (event.deleted) {
            items.remove(event.key);
          } else {
            final item = _itemFromValue(event.value as String?);
            if (item != null) {
              items[mediaItemIdKey(item.libraryItemId, item.episodeId)] = item;
            } else {
              items.remove(event.key);
            }
          }
          return Map<String, MediaProgress>.from(items);
        })
        .startWith(Map<String, MediaProgress>.from(items));
  }

  void put(MediaProgress progress) {
    try {
      userMediaProgressBox.put(
        _key(progress.libraryItemId, progress.episodeId),
        jsonEncode(progress),
      );
    } catch (e) {
      log('Failed to save media progress: $e');
    }
  }

  void putAll(List<MediaProgress> list) => list.forEach(put);
}
