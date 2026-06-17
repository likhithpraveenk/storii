import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/storage/local/users_store.dart';

part 'users_provider.g.dart';

@Riverpod(keepAlive: true)
class UsersNotifier extends _$UsersNotifier {
  @override
  Stream<List<UserDomain>> build() async* {
    final users = await ref.watch(usersStoreProvider.future);
    yield users;
  }

  Future<void> add(UserDomain user) async {
    await ref.read(usersStoreProvider.notifier).upsert(user);
  }

  Future<void> delete(UserDomain user) async {
    await ref.read(usersStoreProvider.notifier).delete(user.id);
  }

  Future<List<String>> deleteUsersByServer(Uri url) async {
    return ref.read(usersStoreProvider.notifier).removeUsersByServer(url);
  }

  Future<void> editServerUrl(Uri oldUrl, Uri newUrl) async {
    await ref.read(usersStoreProvider.notifier).updateServerUrl(oldUrl, newUrl);
  }
}

@riverpod
AsyncValue<List<UserDomain>> usersOfServer(Ref ref, Uri url) {
  final usersAsync = ref.watch(usersProvider);
  return usersAsync.whenData(
    (users) => users.where((u) => u.serverUrl == url).toList(),
  );
}
