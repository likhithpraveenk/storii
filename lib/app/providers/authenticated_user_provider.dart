import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';
import 'package:storii/storage/local/server_settings_store.dart';
import 'package:storii/storage/local/servers_store.dart';
import 'package:storii/storage/local/users_store.dart';

part 'authenticated_user_provider.g.dart';

@Riverpod(keepAlive: true)
Future<UserDomain> authenticatedUser(Ref ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) throw StateError('No current user');

  final ifOffline = ref.watch(isOfflineProvider);
  if (ifOffline) return user;

  try {
    final response = await ref.logApiCall(
      () => ref.read(serverApiProvider(user)).authorize(),
      source: 'authenticatedUser',
      logMessage: 'Error authenticating user',
      debug: true,
    );
    LogService.log('user auth success!', source: 'authenticatedUser');
    final serverId = ref.read(serversStoreProvider).get(user.serverUrl)?.id;
    if (serverId != null) {
      await ref
          .read(serverSettingsStoreProvider)
          .save(serverId, response.serverSettings);
    }
    final refreshed = UserDomain(
      id: user.id,
      username: response.user.username,
      userType: response.user.type.name,
      serverUrl: user.serverUrl,
    );
    if (refreshed != user) {
      await ref.read(usersStoreProvider).upsert(refreshed);
    }
    return refreshed;
  } on AppError catch (error) {
    if (error.type == .network || error.type == .timeout) return user;
    rethrow;
  }
}
