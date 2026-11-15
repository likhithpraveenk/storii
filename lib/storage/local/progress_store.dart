import 'dart:convert';

import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'progress_store.g.dart';

MediaProgress? _decode(String? value) {
  if (value == null) return null;
  try {
    return MediaProgress.fromJson(jsonDecode(value));
  } catch (e, st) {
    LogService.log(
      'failed to decode media progress: $value',
      level: .error,
      originalError: e,
      stackTrace: st,
      source: 'ProgressStore',
    );
    return null;
  }
}

String? _splitKey(dynamic key, String userId) {
  if (key is! String) return null;
  final index = key.indexOf(':');
  if (index == -1) return null;
  final keyUserId = key.substring(0, index);
  if (keyUserId != userId) return null;
  return key.substring(index + 1);
}

LazyBox<String> get _box => Hive.lazyBox(userMediaProgressBoxName);

class ProgressStore {
  const new({required this.userId});

  final String userId;

  String _key(String id, String? episodeId) =>
      '$userId:${mediaItemIdKey(id, episodeId)}';

  Future<Map<String, MediaProgress>> getAll() async {
    final items = <String, MediaProgress>{};
    for (final key in _box.keys) {
      final mapKey = _splitKey(key, userId);
      if (mapKey == null) continue;
      final item = _decode(await _box.get(key));
      if (item != null) {
        items[mediaItemIdKey(item.libraryItemId, item.episodeId)] = item;
      }
    }
    return items;
  }

  Future<void> put(MediaProgress progress) async {
    await _box.put(
      _key(progress.libraryItemId, progress.episodeId),
      jsonEncode(progress),
    );
  }

  Future<void> putAll(List<MediaProgress> list) async {
    final entries = <String, String>{
      for (final p in list) _key(p.libraryItemId, p.episodeId): jsonEncode(p),
    };

    final keysToDelete = _box.keys
        .where((k) => _splitKey(k, userId) != null && !entries.containsKey(k))
        .toList();

    try {
      await _box.deleteAll(keysToDelete);
      await _box.putAll(entries);
    } catch (e) {
      LogService.log(
        'Failed to sync media progress',
        originalError: e,
        level: .error,
      );
    }
  }

  Stream<Map<String, MediaProgress>> watch() async* {
    final map = await getAll();
    yield* _box
        .watch()
        .map((e) {
          final mapKey = _splitKey(e.key, userId);
          if (mapKey == null) return null;

          final item = e.deleted ? null : _decode(e.value);
          if (item != null) {
            map[mediaItemIdKey(item.libraryItemId, item.episodeId)] = item;
          } else {
            map.remove(mapKey);
          }
          return Map<String, MediaProgress>.from(map);
        })
        .whereType<Map<String, MediaProgress>>()
        .startWith(Map<String, MediaProgress>.from(map));
  }
}

@riverpod
ProgressStore progressStore(Ref ref, String userId) =>
    ProgressStore(userId: userId);

@riverpod
Stream<Map<String, MediaProgress>> progressMap(Ref ref, String userId) =>
    ref.watch(progressStoreProvider(userId)).watch();
