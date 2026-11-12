import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'servers_store.g.dart';

Box<Server> get _box => Hive.box(serversBoxName);

class ServersStore {
  const new();

  Future<void> add(Server server) => _box.put(server.id, server);

  Future<void> remove(String id) => _box.delete(id);

  List<Server> getAll() => _box.values.toList();

  Server? get(Uri url) {
    return _box.values.firstWhereOrNull((s) => s.url == url);
  }
}

@riverpod
ServersStore serversStore(Ref ref) => const ServersStore();

@riverpod
Stream<List<Server>> servers(Ref ref) {
  return _box
      .watch()
      .map((_) => _box.values.toList())
      .startWith(_box.values.toList());
}

@riverpod
Stream<Server?> serverStream(Ref ref, Uri url) {
  return _box
      .watch()
      .map((_) => _box.values.firstWhereOrNull((s) => s.url == url))
      .startWith(_box.values.firstWhereOrNull((s) => s.url == url));
}
