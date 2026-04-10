import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/features/auth/logic/users_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/oauth_helpers.dart';

part 'add_user_notifier.g.dart';

enum LoginStatus { idle, loading, success, error }

class UserState {
  final LoginStatus status;
  final String? message;

  const UserState({this.status = .idle, this.message});

  UserState copyWith({LoginStatus? status, String? message}) {
    return UserState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}

@riverpod
class AddUserNotifier extends _$AddUserNotifier {
  static const _appScheme = 'audiobookshelf';

  @override
  UserState build() => const UserState();

  Future<void> login(Uri url, String username, String password) async {
    state = state.copyWith(status: .loading);
    try {
      final authApi = ref.read(authApiProvider(url));
      final response = await authApi.login(
        username: username.trim(),
        password: password,
      );
      await _finalize(response, url);
      LogService.log('${username.trim()} logged in', level: .info);
      state = state.copyWith(status: .success);
    } catch (e, st) {
      _handleError(e, st, 'Error while adding ${username.trim()}');
    }
  }

  Future<void> loginWithOIDC(Uri url) async {
    state = state.copyWith(status: .loading);
    try {
      final response = await _performOidcFlow(url);
      await _finalize(response, url);
      LogService.log(
        '${response.user.username} logged in via OIDC',
        level: .info,
      );
      state = state.copyWith(status: .success);
    } on PlatformException catch (e) {
      state = state.copyWith(status: .error, message: e.message);
    } catch (e, st) {
      _handleError(e, st, 'OIDC login error');
    }
  }

  Future<LoginResponse> _performOidcFlow(Uri url) async {
    final verifier = generateRandom();
    final challenge = generateCodeChallenge(verifier);
    final authApi = ref.read(authApiProvider(url));

    final (providerUri, cookie) = await authApi.oauthRequest(
      codeChallenge: challenge,
      redirectUri: '$_appScheme://oauth',
      clientId: 'Storii',
    );

    if (providerUri == null) throw Exception('OIDC not available');

    final callbackUrl = await FlutterWebAuth2.authenticate(
      url: providerUri.toString(),
      callbackUrlScheme: _appScheme,
    );

    final callbackUri = Uri.parse(callbackUrl);
    final code = callbackUri.queryParameters['code'];
    final returnedState = callbackUri.queryParameters['state'];

    if (code == null || returnedState == null) {
      throw Exception('Invalid OIDC callback');
    }

    return authApi.oauthCallback(
      code: code,
      state: returnedState,
      codeVerifier: verifier,
      cookie: cookie,
    );
  }

  Future<void> _finalize(LoginResponse response, Uri serverUrl) async {
    final user = UserDomain(
      id: response.user.id,
      username: response.user.username,
      userType: response.user.type.name,
      serverUrl: serverUrl,
    );
    await ref.read(usersProvider.notifier).add(user);
    await ref
        .read(tokenProvider)
        .saveTokens(
          user.id,
          response.user.accessToken,
          response.user.refreshToken,
        );
    await ref.read(appSettingsProvider.notifier).setCurrentUser(user);
  }

  void _handleError(Object e, StackTrace st, String message) {
    final error = AppError.resolve(e);
    LogService.log(
      message,
      source: 'AddUserNotifier',
      level: .error,
      stackTrace: st,
    );
    state = state.copyWith(status: .error, message: error.message);
  }
}
