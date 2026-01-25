import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/providers/database_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/storage/drift/database.dart';

part 'servers_provider.g.dart';

@Riverpod(keepAlive: true)
class ServersNotifier extends _$ServersNotifier {
  AppDatabase get _db => ref.read(databaseProvider);

  @override
  Stream<List<Server>> build() {
    return _db.managers.servers.watch();
  }

  Future<void> add(Uri url) async {
    await _db.managers.servers.create(
      (o) => o(url: url),
      mode: .insertOrIgnore,
    );
  }

  Future<void> delete(Server server) async {
    await _db.managers.servers.filter((f) => f.url.equals(server.url)).delete();
    await ref.read(appSettingsProvider.notifier).deleteSettings(server.url);
    LogService.log('Server deleted: ${server.url}', source: 'ServersNotifier');
  }
}
