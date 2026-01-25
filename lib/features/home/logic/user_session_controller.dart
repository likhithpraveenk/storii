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
      LogService.log(
        'User "${user.username}" logged out',
        source: 'UserSessionController',
      );
      await _clearLocalSession(user.id);
    } catch (e, st) {
      LogService.log(
        'Unexpected error during logout for user ${user.username}:$e',
        source: 'UserSessionController',
        level: .error,
        stackTrace: st,
      );
      await _clearLocalSession(user.id);
    }
    state = .success;
  }

  Future<void> forceLogout(UserDomain user, {String? reason}) async {
    state = .loading;
    try {
      LogService.log(
        'Forcing logout for user "${user.username}" - $reason',
        source: 'UserSessionController',
      );
      await _clearLocalSession(user.id);
    } catch (e, st) {
      LogService.log(
        'Unexpected error during force logout for user ${user.username}: $e',
        source: 'UserSessionController',
        stackTrace: st,
      );
      await _clearLocalSession(user.id);
    }
    state = .success;
  }

  Future<void> _clearLocalSession(String userId) async {
    await ref.read(tokenProvider).clearTokens(userId);
    await ref.read(appSettingsProvider.notifier).setCurrentUser(null);
  }
}
