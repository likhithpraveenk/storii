import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final FlutterSecureStorage _storage;
  final _tokenStreams = <String, StreamController<String?>>{};

  new(this._storage);

  String _access(String userId) => '$userId:access';
  String _refresh(String userId) => '$userId:refresh';

  Future<void> saveTokens(
    String userId,
    String? access,
    String? refresh,
  ) async {
    await _storage.write(key: _access(userId), value: access);
    await _storage.write(key: _refresh(userId), value: refresh);
    _tokenStreams[userId]?.add(access);
  }

  Future<String?> getAccessToken(String userId) =>
      _storage.read(key: _access(userId));

  Future<String?> getRefreshToken(String userId) =>
      _storage.read(key: _refresh(userId));

  Future<void> clearTokens(String userId) async {
    await _storage.delete(key: _access(userId));
    await _storage.delete(key: _refresh(userId));
    await _tokenStreams[userId]?.close();
    _tokenStreams.remove(userId);
  }

  Future<bool> hasAccessToken(String userId) async {
    final token = await _storage.read(key: _access(userId));
    return token != null && token.isNotEmpty;
  }

  Stream<String?> tokenStream(String userId) {
    return (_tokenStreams[userId] ??= StreamController<String?>.broadcast(
      onCancel: () {
        if (_tokenStreams[userId]?.hasListener == false) {
          _tokenStreams[userId]?.close();
          _tokenStreams.remove(userId);
        }
      },
    )).stream;
  }
}
