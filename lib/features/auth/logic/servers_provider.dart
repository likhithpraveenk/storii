import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/auth/logic/users_provider.dart';
import 'package:storii/storage/local/servers_store.dart';
import 'package:storii/storage/local/users_store.dart';

part 'servers_provider.g.dart';

@Riverpod(keepAlive: true)
class ServersNotifier extends _$ServersNotifier {
  @override
  Stream<List<Server>> build() async* {
    final servers = await ref.watch(serversStoreProvider.future);
    yield servers;
  }

  Future<void> add(Uri url) async {
    final id = DateTime.now().microsecondsSinceEpoch.toString();
    final server = Server(id: id, url: url);
    await ref.read(serversStoreProvider.notifier).add(server);
  }

  Future<void> edit(Uri oldUrl, Server server) async {
    await ref.read(serversStoreProvider.notifier).add(server);
    await ref
        .read(usersStoreProvider.notifier)
        .updateServerUrl(oldUrl, server.url);
  }

  Future<void> delete(Server server) async {
    final users = await ref
        .read(usersProvider.notifier)
        .deleteUsersByServer(server.url);
    await ref.read(appSettingsProvider.notifier).deleteSettings(users);
    await ref.read(serversStoreProvider.notifier).remove(server.id);
  }
}
