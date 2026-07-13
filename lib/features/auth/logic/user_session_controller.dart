import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'user_session_controller.g.dart';

enum UsesSessionState { idle, loading, success }

@Riverpod(keepAlive: true)
class UserSessionController extends _$UserSessionController {
  @override
  UsesSessionState build() => .idle;

  Future<void> logout(UserDomain user) async {
    state = .loading;
    if (ref.read(sessionProvider) != null) {
      LogService.log('user logout. audio handler stop', level: .info);
      await audioHandler.stop();
    }
    await ref
        .logApiCall(
          ref.read(serverApiProvider(user)).logout,
          source: 'UserSessionController',
        )
        .then(
          (_) => LogService.log('"${user.username}" logged out', level: .info),
        )
        .catchError((_, _) {});
    await _clearLocalSession(user);
    state = .success;
  }

  Future<void> forceLogout(UserDomain user, {String? reason}) async {
    final currentUser = ref.read(currentUserProvider);
    if (currentUser != null && currentUser.id != user.id) return;
    state = .loading;
    if (ref.read(sessionProvider) != null) {
      LogService.log('user force logout. audio handler stop', level: .info);
      await audioHandler.stop();
    }

    LogService.log(
      'Forcing logout for user "${user.username}" - $reason',
      level: .warning,
    );
    await _clearLocalSession(user);
    state = .success;
  }

  Future<void> switchUser() async {
    final user = ref.read(currentUserProvider);
    if (ref.read(sessionProvider) != null) {
      LogService.log('user switch. audio handler stop', level: .info);
      await audioHandler.stop();
    }
    if (user != null) {
      ref.invalidate(apiClientProvider(user));
    }
    await ref.read(appSettingsProvider.notifier).setCurrentUser(null);
    await ref.read(appSettingsProvider.notifier).setServerUrl(null);
  }

  Future<void> _clearLocalSession(UserDomain user) async {
    try {
      await ref.read(tokenProvider).clearTokens(user.id);
    } catch (e) {
      LogService.log(
        'clearing auth tokens failed',
        source: 'UserSessionController',
        originalError: e,
        level: .error,
      );
    }
    await ref.read(appSettingsProvider.notifier).setCurrentUser(null);
    await ref.read(appSettingsProvider.notifier).setServerUrl(null);
    ref.invalidate(apiClientProvider(user));
  }
}
