import 'dart:convert';

import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'server_settings_store.g.dart';

ServerSettings? _decode(String? value) {
  if (value == null) return null;
  try {
    return ServerSettings.fromJson(jsonDecode(value));
  } catch (e, st) {
    LogService.log(
      'failed to decode server settings: $value',
      level: .error,
      originalError: e,
      stackTrace: st,
      source: 'ServerSettingsStore',
    );
    return null;
  }
}

Box<String> get _box => Hive.box(serverSettingsBoxName);

class ServerSettingsStore {
  const new();

  Future<void> save(String serverId, ServerSettings settings) =>
      _box.put(serverId, jsonEncode(settings.toJson()));

  Future<void> remove(String serverId) => _box.delete(serverId);

  ServerSettings? get(String serverId) => _decode(_box.get(serverId));
}

@riverpod
ServerSettingsStore serverSettingsStore(Ref ref) => const ServerSettingsStore();

@riverpod
Stream<ServerSettings?> serverSettings(Ref ref, String id) {
  final store = ref.read(serverSettingsStoreProvider);
  return _box.watch().map((_) => store.get(id)).startWith(store.get(id));
}
