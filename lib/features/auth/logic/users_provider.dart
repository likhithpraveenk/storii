import 'dart:async';

import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'users_provider.g.dart';

@Riverpod(keepAlive: true)
class UsersNotifier extends _$UsersNotifier {
  final _box = Hive.box<UserDomain>(usersBox);

  @override
  Stream<List<UserDomain>> build() {
    return _box
        .watch()
        .map((_) => _box.values.toList())
        .startWith(_box.values.toList());
  }

  Future<void> add(UserDomain user) async {
    await _box.put(user.id, user);
  }

  Future<void> delete(UserDomain user) async {
    await _box.delete(user.id);
    await ref.read(appSettingsProvider.notifier).deleteUserSettings(user.id);
    LogService.log('User deleted: ${user.username}', source: 'UsersNotifier');
  }

  Future<List<String>> deleteUsersByServer(Uri url) async {
    final keysToDelete = _box.values
        .where((u) => u.serverUrl == url)
        .map((u) => u.id)
        .toList();

    if (keysToDelete.isNotEmpty) {
      await _box.deleteAll(keysToDelete);
    }
    return keysToDelete;
  }

  Future<void> editServerUrl(Uri oldUrl, Uri newUrl) async {
    final usersToUpdate = _box.values
        .where((user) => user.serverUrl == oldUrl)
        .toList();

    for (var user in usersToUpdate) {
      await _box.put(user.id, user.copyWith(serverUrl: newUrl));
    }
  }
}

@riverpod
AsyncValue<List<UserDomain>> usersOfServer(Ref ref, Uri url) {
  final usersAsync = ref.watch(usersProvider);
  return usersAsync.whenData(
    (users) => users.where((u) => u.serverUrl == url).toList(),
  );
}
