import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/logs/logs_interceptor.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/network/offline_cache_interceptor.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/is_background_provider.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/features/auth/logic/servers_provider.dart';
import 'package:storii/features/auth/logic/user_session_controller.dart';
import 'package:storii/storage/hive/boxes.dart';
import 'package:storii/storage/local/servers_store.dart';

part 'api_providers.g.dart';

@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref, UserDomain user) {
  final tokenService = ref.watch(tokenProvider);
  final cancelToken = CancelToken();
  final serverUrl = ref.watch(activeServerUrlProvider);

  final cacheOptions = CacheOptions(
    store: networkCacheStore,
    policy: .refreshForceCache,
    hitCacheOnNetworkFailure: true,
    maxStale: const Duration(days: 7),
  );

  final headers = ref.read(serversStoreProvider).get(user.serverUrl)?.headers;

  final apiClient = ApiClient(
    baseUrl: serverUrl,
    cancelToken: cancelToken,
    headers: headers,
    interceptors: [
      LogsInterceptor(),
      OfflineCacheInterceptor(
        isConnected: () => ref.read(serverConnectionProvider),
        cacheOptions: cacheOptions,
      ),
      DioCacheInterceptor(options: cacheOptions),
    ],
    getAccessToken: () async {
      final token = await tokenService.getAccessToken(user.id);
      return token;
    },
    getRefreshToken: () async {
      final token = await tokenService.getRefreshToken(user.id);
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
  final headers = ref.read(tempServerProvider)?.headers;
  return AuthApi(
    BaseApiClient(
      baseUrl: baseUrl,
      headers: headers,
      interceptors: [LogsInterceptor()],
    ),
  );
}

@riverpod
ServerApi serverApi(Ref ref, UserDomain user) =>
    ServerApi(ref.watch(apiClientProvider(user)));

@riverpod
LibraryApi libraryApi(Ref ref, UserDomain user) =>
    LibraryApi(ref.watch(apiClientProvider(user)));

@riverpod
ItemApi itemApi(Ref ref, UserDomain user) =>
    ItemApi(ref.watch(apiClientProvider(user)));

@riverpod
MeApi meApi(Ref ref, UserDomain user) =>
    MeApi(ref.watch(apiClientProvider(user)));

@riverpod
SessionsApi sessionsApi(Ref ref, UserDomain user) =>
    SessionsApi(ref.watch(apiClientProvider(user)));

@riverpod
Future<SocketApi> socketApi(Ref ref, UserDomain user) async {
  final tokenService = ref.read(tokenProvider);
  final serverUrl = ref.watch(activeServerUrlProvider);
  final headers = ref
      .watch(serverStreamProvider(user.serverUrl))
      .value
      ?.headers;

  final api = SocketApi(
    baseUrl: serverUrl.toString(),
    headers: headers,
    getToken: () => tokenService.getAccessToken(user.id),
    onAuthFailure: (reason) {
      LogService.log('Socket authentication failed: $reason');
    },
  );

  ref
    ..listen(isBackgroundProvider, (_, isBackground) {
      if (!isBackground) unawaited(api.refresh());
    })
    ..listen(isOfflineProvider, (previous, next) {
      if (previous == true && !next) unawaited(api.refresh());
    });

  final sub = tokenService
      .tokenStream(user.id)
      .listen((_) => unawaited(api.refresh()));

  ref.onDispose(() {
    sub.cancel();
    api.dispose();
  });
  return api;
}

@riverpod
CollectionsApi collectionsApi(Ref ref, UserDomain user) =>
    CollectionsApi(ref.watch(apiClientProvider(user)));

@riverpod
PlaylistsApi playlistsApi(Ref ref, UserDomain user) =>
    PlaylistsApi(ref.watch(apiClientProvider(user)));

@riverpod
SearchApi searchApi(Ref ref, UserDomain user) =>
    SearchApi(ref.watch(apiClientProvider(user)));
