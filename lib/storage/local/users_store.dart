import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'users_store.g.dart';

@Riverpod(keepAlive: true)
class UsersStore extends _$UsersStore {
  Stream<List<UserDomain>> _watch() {
    return usersBox
        .watch()
        .map((_) => usersBox.values.toList())
        .startWith(usersBox.values.toList());
  }

  @override
  Stream<List<UserDomain>> build() => _watch();

  Future<void> upsert(UserDomain user) => usersBox.put(user.id, user);

  Future<void> delete(String id) => usersBox.delete(id);

  Future<void> removeAll(Iterable<String> ids) async {
    if (ids.isNotEmpty) {
      await usersBox.deleteAll(ids);
    }
  }

  Future<void> updateServerUrl(Uri oldUrl, Uri newUrl) async {
    final usersToUpdate = usersBox.values
        .where((u) => u.serverUrl == oldUrl)
        .toList();
    for (final user in usersToUpdate) {
      await usersBox.put(user.id, user.copyWith(serverUrl: newUrl));
    }
  }

  List<UserDomain> getAll() => usersBox.values.toList();

  Future<List<String>> removeUsersByServer(Uri url) async {
    final keysToDelete = usersBox.values
        .where((u) => u.serverUrl == url)
        .map((u) => u.id)
        .toList();
    if (keysToDelete.isNotEmpty) {
      await removeAll(keysToDelete);
    }
    return keysToDelete;
  }
}
