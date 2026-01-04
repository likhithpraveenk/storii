import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/database_provider.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/storage/drift/database.dart';

part 'users_provider.g.dart';

@Riverpod(keepAlive: true)
class UsersNotifier extends _$UsersNotifier {
  AppDatabase get _db => ref.read(databaseProvider);

  @override
  Stream<List<User>> build() {
    return _db.managers.users.watch();
  }

  Future<void> upsert(User user) async {
    await _db.managers.users.create(
      (_) => user.toInsertable(),
      mode: .insertOrReplace,
    );
  }

  Future<void> delete(User user) async {
    await _db.managers.users.filter((f) => f.id.equals(user.id)).delete();
    await ref.read(userSettingsProvider(user.id).notifier).delete();
    ref
        .read(logsProvider.notifier)
        .log('User deleted: ${user.username}', source: 'UsersNotifier');
  }
}

@riverpod
AsyncValue<List<User>> usersOfServer(Ref ref, Uri url) {
  return ref
      .watch(usersProvider)
      .whenData((users) => users.where((u) => u.serverUrl == url).toList());
}
