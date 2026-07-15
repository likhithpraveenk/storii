import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'servers_store.g.dart';

@Riverpod(keepAlive: true)
class ServersStore extends _$ServersStore {
  Stream<List<Server>> _watch() {
    return serversBox
        .watch()
        .map((_) => serversBox.values.toList())
        .startWith(serversBox.values.toList());
  }

  @override
  Stream<List<Server>> build() => _watch();

  Future<void> add(Server server) => serversBox.put(server.id, server);

  Future<void> remove(String id) => serversBox.delete(id);

  List<Server> getAll() => serversBox.values.toList();

  Server? get(Uri url) {
    return serversBox.values.firstWhereOrNull((s) => s.url == url);
  }
}
