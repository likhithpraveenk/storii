import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/features/auth/logic/users_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/oauth_helpers.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

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
  static const _redirectUri = 'storii://oauth';
  Completer<Uri>? _oidcCompleter;

  @override
  UserState build() => const UserState();

  Future<void> login(Uri url, String username, String password) async {
    state = state.copyWith(status: .loading);
    try {
      final authApi = ref.read(authApiProvider(url));
      final response = await ref.logApiCall(
        () => authApi.login(username: username.trim(), password: password),
        source: 'AddUserNotifier',
        logMessage: 'Error while adding ${username.trim()}',
      );
      await _finalize(response, url);
      LogService.log('${username.trim()} logged in', level: .info);
      state = state.copyWith(status: .success);
    } on AppError catch (error) {
      state = state.copyWith(status: .error, message: error.localizedMessage);
    }
  }

  void handleOidcCallback(Uri url) => _oidcCompleter?.complete(url);

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
    } on TimeoutException catch (e) {
      state = state.copyWith(status: .error, message: e.message);
    } on PlatformException catch (e) {
      state = state.copyWith(status: .error, message: e.message);
    } on AppError catch (error) {
      state = state.copyWith(status: .error, message: error.localizedMessage);
    } finally {
      _oidcCompleter = null;
    }
  }

  Future<LoginResponse> _performOidcFlow(Uri url) async {
    final verifier = generateRandom();
    final challenge = generateCodeChallenge(verifier);
    final authApi = ref.read(authApiProvider(url));

    final (providerUri, cookie) = await ref.logApiCall(
      () => authApi.oauthRequest(
        codeChallenge: challenge,
        redirectUri: _redirectUri,
        clientId: 'Storii',
      ),
      source: 'AddUserNotifier',
      logMessage: 'OIDC request failed',
    );

    if (providerUri == null) throw Exception('OIDC not available');

    _oidcCompleter = Completer<Uri>();
    await launchUrl(providerUri, mode: .externalApplication);

    final callbackUri = await _oidcCompleter!.future.timeout(
      const Duration(minutes: 5),
      onTimeout: () => throw TimeoutException('OIDC login timed out'),
    );
    final code = callbackUri.queryParameters['code'];
    final returnedState = callbackUri.queryParameters['state'];

    if (code == null || returnedState == null) {
      throw Exception('Invalid OIDC callback');
    }

    return ref.logApiCall(
      () => authApi.oauthCallback(
        code: code,
        state: returnedState,
        codeVerifier: verifier,
        cookie: cookie,
      ),
      source: 'AddUserNotifier',
      logMessage: 'OIDC callback failed',
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
    await ref.read(appSettingsProvider.notifier).setServerUrl(user.serverUrl);
  }
}
