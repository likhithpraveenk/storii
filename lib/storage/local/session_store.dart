import 'dart:async';
import 'dart:convert';

import 'package:abs_api/abs_api.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'session_store.g.dart';

@Riverpod(keepAlive: true)
class SessionStore extends _$SessionStore {
  Box<String> get _box => Hive.box<String>(localSessionsBox);

  @override
  void build() {}

  Future<void> save(PlaybackSession session) async {
    await _box.put(session.id, jsonEncode(session));
  }

  Future<void> delete(String sessionId) async {
    await _box.delete(sessionId);
  }

  List<PlaybackSession> getAll() {
    return _box.values.map(_parseSession).toList();
  }

  PlaybackSession? getSession(String itemId, [String? episodeId]) {
    return _box.values
        .map(_parseSession)
        .firstWhereOrNull(
          (s) => s.libraryItemId == itemId && s.episodeId == episodeId,
        );
  }

  Stream<PlaybackSession?> watchSession(String itemId, [String? episodeId]) {
    return _box
        .watch()
        .map((_) => getSession(itemId, episodeId))
        .startWith(getSession(itemId, episodeId));
  }

  PlaybackSession _parseSession(String json) =>
      PlaybackSession.fromJson(jsonDecode(json));
}
