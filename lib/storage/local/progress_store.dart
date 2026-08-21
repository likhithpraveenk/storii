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
  MediaProgress? _itemFromValue(String? value) {
    if (value == null) return null;
    try {
      return MediaProgress.fromJson(jsonDecode(value));
    } catch (e) {
      log('Failed to decode media progress: $e');
      return null;
    }
  }

  Map<String, MediaProgress> _decode(Iterable<String> values) {
    return Map.fromEntries(
      values
          .map(_itemFromValue)
          .whereType<MediaProgress>()
          .map(
            (p) => MapEntry(mediaItemIdKey(p.libraryItemId, p.episodeId), p),
          ),
    );
  }

  @override
  Stream<Map<String, MediaProgress>> build() {
    final items = _decode(mediaProgressBox.values);
    return mediaProgressBox
        .watch()
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
      mediaProgressBox.put(
        mediaItemIdKey(progress.libraryItemId, progress.episodeId),
        jsonEncode(progress),
      );
    } catch (e) {
      log('Failed to save media progress: $e');
    }
  }

  void putAll(List<MediaProgress> list) {
    for (final progress in list) {
      put(progress);
    }
  }
}
