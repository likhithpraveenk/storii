import 'dart:async';

import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/settings_provider.dart';

part 'users_provider.g.dart';

@Riverpod(keepAlive: true)
class UsersNotifier extends _$UsersNotifier {
  final _box = Hive.box<Map>('users');

  @override
  Stream<List<UserDomain>> build() {
    List<UserDomain> mapToUsers() => _box.values
        .map((u) => UserDomain.fromJson(Map<String, dynamic>.from(u)))
        .toList();

    return _box.watch().map((_) => mapToUsers()).startWith(mapToUsers());
  }

  Future<void> add(UserDomain user) async {
    await _box.put(user.id, user.toJson());
  }

  Future<void> delete(UserDomain user) async {
    await _box.delete(user.id);
    await ref.read(appSettingsProvider.notifier).deleteUserSettings(user.id);
    LogService.log('User deleted: ${user.username}', source: 'UsersNotifier');
  }

  Future<List<String>> deleteUsersByServer(Uri url) async {
    final keysToDelete = <String>[];

    for (var entry in _box.toMap().entries) {
      final user = UserDomain.fromJson(Map<String, dynamic>.from(entry.value));
      if (user.serverUrl == url) {
        keysToDelete.add(entry.key as String);
      }
    }

    if (keysToDelete.isNotEmpty) {
      await _box.deleteAll(keysToDelete);
    }
    return keysToDelete;
  }

  Future<void> editServerUrl(Uri oldUrl, Uri newUrl) async {
    final Map<dynamic, Map<dynamic, dynamic>> updates = {};
    for (var entry in _box.toMap().entries) {
      final user = UserDomain.fromJson(Map<String, dynamic>.from(entry.value));

      if (user.serverUrl == oldUrl) {
        updates[entry.key] = user.copyWith(serverUrl: newUrl).toJson();
      }
    }
    if (updates.isNotEmpty) {
      await _box.putAll(updates);
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
