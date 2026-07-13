import 'dart:async';
import 'dart:convert';

import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/features/cast/models/cast_session.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'cast_session_store.g.dart';

@Riverpod(keepAlive: true)
class CastSessionStore extends _$CastSessionStore {
  Box<String> get _box => Hive.box<String>(castSessionsBox);

  @override
  void build() {}

  Future<void> save(CastSession session) async {
    if (session.id == null) return;
    await _box.put(session.id, jsonEncode(session));
  }

  Future<void> delete(String sessionId) async {
    await _box.delete(sessionId);
  }

  List<CastSession> getAll() {
    return _box.values.map(_parseSession).toList();
  }

  CastSession? getSession(String id) {
    final json = _box.get(id);
    if (json == null) return null;
    return _parseSession(json);
  }

  Stream<CastSession?> watchSession(String id) {
    return _box.watch().map((_) => getSession(id)).startWith(getSession(id));
  }

  CastSession _parseSession(String json) =>
      CastSession.fromJson(jsonDecode(json));
}
