import 'dart:async';
import 'dart:convert';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'session_store.g.dart';

@Riverpod(keepAlive: true)
class SessionStore extends _$SessionStore {
  @override
  void build() {}

  Future<void> save(PlaybackSession session) async {
    await localSessionsBox.put(session.id, jsonEncode(session));
  }

  Future<void> delete(String sessionId) async {
    await localSessionsBox.delete(sessionId);
  }

  List<PlaybackSession> getAll() {
    return localSessionsBox.values.map(_parseSession).toList();
  }

  PlaybackSession? getSession(String itemId, [String? episodeId]) {
    return localSessionsBox.values
        .map(_parseSession)
        .firstWhereOrNull(
          (s) => s.libraryItemId == itemId && s.episodeId == episodeId,
        );
  }

  Stream<PlaybackSession?> watchSession(String itemId, [String? episodeId]) {
    return localSessionsBox
        .watch()
        .map((_) {
          return localSessionsBox.values
              .map(_parseSession)
              .firstWhereOrNull(
                (s) => s.libraryItemId == itemId && s.episodeId == episodeId,
              );
        })
        .startWith(getSession(itemId, episodeId));
  }

  PlaybackSession _parseSession(String json) =>
      PlaybackSession.fromJson(jsonDecode(json));
}
