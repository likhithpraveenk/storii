import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/app/providers/token_provider.dart';

part 'user_session_controller.g.dart';

enum UsesSessionState { idle, loading, success }

@Riverpod(keepAlive: true)
class UserSessionController extends _$UserSessionController {
  @override
  UsesSessionState build() => .idle;

  Future<void> logout(UserDomain user) async {
    state = .loading;
    try {
      await ref.read(serverApiProvider(user)).logout();
      LogService.log('"${user.username}" logged out', level: .info);
      await _clearLocalSession(user);
    } catch (e, st) {
      LogService.log(
        'Unexpected error during logout for ${user.username}: $e',
        source: 'UserSessionController',
        level: .error,
        stackTrace: st,
      );
      await _clearLocalSession(user);
    }
    state = .success;
  }

  Future<void> forceLogout(UserDomain user, {String? reason}) async {
    state = .loading;
    try {
      LogService.log(
        'Forcing logout for user "${user.username}" - $reason',
        level: .info,
      );
      await _clearLocalSession(user);
    } catch (e, st) {
      LogService.log(
        'Unexpected error during force logout for ${user.username}: $e',
        source: 'UserSessionController',
        level: .error,
        stackTrace: st,
      );
      await _clearLocalSession(user);
    }
    state = .success;
  }

  Future<void> switchUser() async {
    final user = ref.read(currentUserProvider);
    if (user != null) {
      ref.invalidate(apiClientProvider(user));
    }
    await ref.read(appSettingsProvider.notifier).setCurrentUser(null);
  }

  Future<void> _clearLocalSession(UserDomain user) async {
    await ref.read(tokenProvider).clearTokens(user.id);
    await ref.read(appSettingsProvider.notifier).setCurrentUser(null);
    ref.invalidate(apiClientProvider(user));
  }
}
