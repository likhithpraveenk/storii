import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'users_store.g.dart';

Box<UserDomain> get _box => Hive.box(usersBoxName);

class UsersStore {
  const new();

  Future<void> upsert(UserDomain user) => _box.put(user.id, user);

  Future<void> delete(String id) => _box.delete(id);

  Future<void> removeAll(Iterable<String> ids) async {
    if (ids.isNotEmpty) {
      await _box.deleteAll(ids);
    }
  }

  Future<void> updateServerUrl(Uri oldUrl, Uri newUrl) async {
    final usersToUpdate = _box.values
        .where((u) => u.serverUrl == oldUrl)
        .toList();
    for (final user in usersToUpdate) {
      await _box.put(user.id, user.copyWith(serverUrl: newUrl));
    }
  }

  List<UserDomain> getAll() => _box.values.toList();

  Future<List<String>> removeUsersByServer(Uri url) async {
    final keysToDelete = _box.values
        .where((u) => u.serverUrl == url)
        .map((u) => u.id)
        .toList();
    if (keysToDelete.isNotEmpty) {
      await removeAll(keysToDelete);
    }
    return keysToDelete;
  }
}

@riverpod
UsersStore usersStore(Ref ref) => const UsersStore();

@riverpod
Stream<List<UserDomain>> users(Ref ref) {
  return _box
      .watch()
      .map((_) => _box.values.toList())
      .startWith(_box.values.toList());
}

@riverpod
Future<List<UserDomain>> usersOfServer(Ref ref, Uri url) async {
  final users = await ref.watch(usersProvider.future);
  return users.where((u) => u.serverUrl == url).toList();
}
