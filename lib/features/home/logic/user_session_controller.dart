import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'user_session_controller.g.dart';

enum UsesSessionState { idle, loading, success }

@Riverpod(keepAlive: true)
class UserSessionController extends _$UserSessionController {
  @override
  UsesSessionState build() => .idle;

  Future<void> logout(User user) async {
    state = .loading;
    final logger = ref.read(logsProvider.notifier);
    try {
      await ref.read(serverApiProvider(user)).logout();
      logger.log(
        'User "${user.username}" logged out',
        source: 'UserSessionController',
      );
      await _clearLocalSession(user.id);
    } catch (e, st) {
      logger.log(
        'Unexpected error during logout for user ${user.username}',
        source: 'UserSessionController',
        level: .error,
        stackTrace: '$e\n${st.toLimitedString()}',
      );
      await _clearLocalSession(user.id);
    }
    state = .success;
  }

  Future<void> forceLogout(User user, {String? reason}) async {
    state = .loading;

    final logger = ref.read(logsProvider.notifier);
    try {
      logger.log(
        'Forcing logout for user "${user.username}" - $reason',
        source: 'UserSessionController',
      );
      await _clearLocalSession(user.id);
    } catch (e, _) {
      logger.log(
        'Unexpected error during force logout for user ${user.username}',
        source: 'UserSessionController',
        stackTrace: 'Error: $e',
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
