import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/client/api_client.dart';
import 'package:storii/api/client/base_api_client.dart';
import 'package:storii/api/endpoints/auth_api.dart';
import 'package:storii/api/endpoints/author_api.dart';
import 'package:storii/api/endpoints/item_api.dart';
import 'package:storii/api/endpoints/library_api.dart';
import 'package:storii/api/endpoints/me_api.dart';
import 'package:storii/api/endpoints/server_api.dart';
import 'package:storii/api/endpoints/sessions_api.dart';
import 'package:storii/api/endpoints/socket_api.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/features/home/logic/user_session_controller.dart';

part 'api_providers.g.dart';

@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref, User user) {
  final tokenService = ref.watch(tokenProvider);
  final logNotifier = ref.read(logsProvider.notifier);

  final cancelToken = CancelToken();

  final apiClient = ApiClient(
    baseUrl: user.serverUrl,
    cancelToken: cancelToken,
    getAccessToken: () async {
      final token = await tokenService.getAccessToken(user.id);
      if (token == null) {
        logNotifier.log(
          'Access token not available for user ${user.username}',
          source: 'API Client',
          level: .error,
        );
      }
      return token;
    },
    getRefreshToken: () async {
      final token = await tokenService.getRefreshToken(user.id);
      if (token == null) {
        logNotifier.log(
          'Refresh token not available for user ${user.username}',
          source: 'API Client',
          level: .error,
        );
      }
      return token;
    },
    onTokensUpdated: (newAccess, newRefresh) async {
      await tokenService.saveTokens(user.id, newAccess, newRefresh);
    },
    onTokensFailure: () async {
      await ref
          .read(userSessionControllerProvider.notifier)
          .forceLogout(user, reason: 'Token refresh failed');
    },
  );

  ref.onDispose(() {
    cancelToken.cancel('User session disposed or logged out');
  });

  return apiClient;
}

@riverpod
AuthApi authApi(Ref ref, Uri baseUrl) {
  return AuthApi(BaseApiClient(baseUrl: baseUrl));
}

@Riverpod(keepAlive: true)
ServerApi serverApi(Ref ref, User user) {
  final apiClient = ref.watch(apiClientProvider(user));
  return ServerApi(apiClient);
}

@Riverpod(keepAlive: true)
LibraryApi libraryApi(Ref ref, User user) {
  final apiClient = ref.watch(apiClientProvider(user));
  return LibraryApi(apiClient);
}

@Riverpod(keepAlive: true)
ItemApi itemApi(Ref ref, User user) {
  final apiClient = ref.watch(apiClientProvider(user));
  return ItemApi(apiClient);
}

@Riverpod(keepAlive: true)
AuthorApi authorApi(Ref ref, User user) {
  final apiClient = ref.watch(apiClientProvider(user));
  return AuthorApi(apiClient);
}

@Riverpod(keepAlive: true)
MeApi meApi(Ref ref, User user) {
  final apiClient = ref.watch(apiClientProvider(user));
  return MeApi(apiClient);
}

@Riverpod(keepAlive: true)
SessionsApi sessionsApi(Ref ref, User user) {
  final apiClient = ref.watch(apiClientProvider(user));
  return SessionsApi(apiClient);
}

@Riverpod(keepAlive: true)
Future<SocketApi> socketApi(Ref ref, User user) async {
  final apiClient = ref.watch(apiClientProvider(user));
  final token = await apiClient.getAccessToken?.call();
  if (token != null) {
    return SocketApi(apiClient.baseUrl.toString(), token);
  } else {
    throw StateError('No access token for sockets');
  }
}
