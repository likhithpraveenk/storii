import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
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

@Riverpod(keepAlive: true)
Future<UserPermissions?> userPermissions(Ref ref) async {
  final user = await ref.watch(serverUserProvider.future);
  return user.permissions;
}
