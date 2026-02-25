import 'dart:async';

import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/auth/logic/users_provider.dart';
import 'package:storii/storage/hive/boxes.dart';
import 'package:uuid/uuid.dart';

part 'servers_provider.g.dart';

@Riverpod(keepAlive: true)
class ServersNotifier extends _$ServersNotifier {
  final _box = Hive.box<Server>(serversBox);

  @override
  Stream<List<Server>> build() {
    return _box
        .watch()
        .map((_) => _box.values.toList())
        .startWith(_box.values.toList());
  }

  Future<void> add(Uri url) async {
    final id = const Uuid().v4();
    final server = Server(id: id, url: url);
    await _box.put(id, server);
  }

  Future<void> edit(Uri oldUrl, Server server) async {
    await _box.put(server.id, server);
    await ref.read(usersProvider.notifier).editServerUrl(oldUrl, server.url);
  }

  Future<void> delete(Server server) async {
    await _box.delete(server.id);
    final users = await ref
        .read(usersProvider.notifier)
        .deleteUsersByServer(server.url);
    await ref.read(appSettingsProvider.notifier).deleteSettings(users);

    LogService.log('Server deleted: ${server.url}', source: 'ServersNotifier');
  }
}
