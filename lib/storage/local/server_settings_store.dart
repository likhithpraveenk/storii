import 'dart:convert';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'server_settings_store.g.dart';

@Riverpod(keepAlive: true)
class ServerSettingsStore extends _$ServerSettingsStore {
  @override
  Stream<Map<String, ServerSettings>> build() =>
      serverSettingsBox.watch().map((_) => _readAll()).startWith(_readAll());

  Map<String, ServerSettings> _readAll() {
    return {
      for (final entry in serverSettingsBox.toMap().entries)
        entry.key as String: ServerSettings.fromJson(
          jsonDecode(entry.value) as Map<String, dynamic>,
        ),
    };
  }

  Future<void> save(String serverId, ServerSettings settings) =>
      serverSettingsBox.put(serverId, jsonEncode(settings.toJson()));

  Future<void> remove(String serverId) => serverSettingsBox.delete(serverId);

  ServerSettings? get(String serverId) {
    final raw = serverSettingsBox.get(serverId);
    if (raw == null) return null;
    return ServerSettings.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }
}
