import 'dart:async';
import 'dart:convert';

import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'session_store.g.dart';

Box<String> get _box => Hive.box(localSessionsBoxName);

class SessionStore {
  const new();

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
}

@riverpod
SessionStore sessionStore(Ref ref) => const SessionStore();

@riverpod
Stream<List<PlaybackSession>> localSessions(Ref ref) {
  final items = _box.values.map(_parseSession).toList();
  return _box
      .watch()
      .map((_) => _box.values.map(_parseSession).toList())
      .startWith(items);
}

@riverpod
Stream<PlaybackSession?> localSessionById(
  Ref ref,
  String itemId, [
  String? episodeId,
]) {
  final session = ref.read(sessionStoreProvider).getSession(itemId, episodeId);
  return _box
      .watch()
      .map((_) => ref.read(sessionStoreProvider).getSession(itemId, episodeId))
      .startWith(session);
}

PlaybackSession _parseSession(String json) =>
    PlaybackSession.fromJson(jsonDecode(json));
