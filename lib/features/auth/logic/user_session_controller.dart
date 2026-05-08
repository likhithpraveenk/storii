import 'dart:async';
import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';

part 'user_session_controller.g.dart';

enum UsesSessionState { idle, loading, success }

@Riverpod(keepAlive: true)
class UserSessionController extends _$UserSessionController {
  @override
  UsesSessionState build() => .idle;

  Future<void> logout(UserDomain user) async {
    state = .loading;
    if (ref.read(sessionProvider) != null) {
      log('user logout. audio handler stop');
      await audioHandler.stop();
    }
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
    if (ref.read(sessionProvider) != null) {
      log('user force logout. audio handler stop');
      await audioHandler.stop();
    }
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
    if (ref.read(sessionProvider) != null) {
      log('user switch. audio handler stop');
      await audioHandler.stop();
    }
    if (user != null) {
      ref.invalidate(apiClientProvider(user));
    }
    await ref.read(appSettingsProvider.notifier).setCurrentUser(null);
    await ref.read(appSettingsProvider.notifier).setServerUrl(null);
  }

  Future<void> _clearLocalSession(UserDomain user) async {
    await ref.read(tokenProvider).clearTokens(user.id);
    await ref.read(appSettingsProvider.notifier).setCurrentUser(null);
    await ref.read(appSettingsProvider.notifier).setServerUrl(null);
    ref.invalidate(apiClientProvider(user));
  }
}
