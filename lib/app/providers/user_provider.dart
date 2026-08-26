import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/local/server_settings_store.dart';
import 'package:storii/storage/local/servers_store.dart';

part 'user_provider.g.dart';

@riverpod
class ServerUser extends _$ServerUser {
  StreamSubscription? _userSub;

  @override
  Future<User> build() async {
    ref.onDispose(() {
      _userSub?.cancel();
    });
    await _userSub?.cancel();
    final userDomain = await ref.watch(authenticatedUserProvider.future);
    final user = await ref.read(meApiProvider(userDomain)).getUser();

    final socket = await ref.watch(socketApiProvider(userDomain).future);
    _userSub = socket.user.onUserUpdated.listen((update) {
      state = AsyncData(update);
    });

    return user;
  }
}

@riverpod
Future<UserPermissions?> userPermissions(Ref ref) async {
  final user = await ref.watch(serverUserProvider.future);
  return user.permissions;
}

@riverpod
bool isUserAdmin(Ref ref) {
  final user = ref.watch(authenticatedUserProvider).value;
  if (user == null) return false;
  final type = UserType.values.firstWhereOrNull((t) => t.name == user.userType);
  if (type == null) return false;
  return type.isAdmin;
}

@riverpod
ServerSettings? currentServerSettings(Ref ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null) return null;
  final serverId = ref
      .read(serversStoreProvider.notifier)
      .get(user.serverUrl)
      ?.id;
  if (serverId == null) return null;
  return ref.watch(serverSettingsStoreProvider).value?[serverId];
}

@riverpod
Future<bool> canUserUpdate(Ref ref) async {
  final permissions = await ref.watch(userPermissionsProvider.future);
  return permissions?.update ?? false;
}

@riverpod
Future<bool> canUserDelete(Ref ref) async {
  final permissions = await ref.watch(userPermissionsProvider.future);
  return permissions?.delete ?? false;
}
