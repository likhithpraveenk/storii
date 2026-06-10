import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'servers_store.g.dart';

@Riverpod(keepAlive: true)
class ServersStore extends _$ServersStore {
  Box<Server> get _box => Hive.box<Server>(serversBox);

  Stream<List<Server>> _watch() {
    return _box
        .watch()
        .map((_) => _box.values.toList())
        .startWith(_box.values.toList());
  }

  @override
  Stream<List<Server>> build() => _watch();

  Future<void> add(Server server) => _box.put(server.id, server);

  Future<void> remove(String id) => _box.delete(id);

  List<Server> getAll() => _box.values.toList();
}
