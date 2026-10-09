import 'package:abs_api/abs_api.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/logs/logs_interceptor.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/network/offline_cache_interceptor.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/features/auth/logic/servers_provider.dart';
import 'package:storii/features/auth/logic/user_session_controller.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'api_providers.g.dart';

@Riverpod(keepAlive: true)
Future<ApiClient> apiClient(Ref ref, UserDomain user) async {
  final tokenService = ref.watch(tokenProvider);
  final cancelToken = CancelToken();
  final serverUrl = await ref.watch(activeServerUrlProvider(user).future);

  final cacheOptions = CacheOptions(
    store: networkCacheStore,
    policy: .refreshForceCache,
    hitCacheOnNetworkFailure: true,
    maxStale: const Duration(days: 7),
  );

  final headers = ref
      .read(serversProvider.notifier)
      .getServerHeaders(user.serverUrl);

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
Future<ServerApi> serverApi(Ref ref, UserDomain user) async {
  final apiClient = await ref.watch(apiClientProvider(user).future);
  return ServerApi(apiClient);
}

@riverpod
Future<LibraryApi> libraryApi(Ref ref, UserDomain user) async {
  final apiClient = await ref.watch(apiClientProvider(user).future);
  return LibraryApi(apiClient);
}

@riverpod
Future<ItemApi> itemApi(Ref ref, UserDomain user) async {
  final apiClient = await ref.watch(apiClientProvider(user).future);
  return ItemApi(apiClient);
}

@riverpod
Future<AuthorApi> authorApi(Ref ref, UserDomain user) async {
  final apiClient = await ref.watch(apiClientProvider(user).future);
  return AuthorApi(apiClient);
}

@riverpod
Future<MeApi> meApi(Ref ref, UserDomain user) async {
  final apiClient = await ref.watch(apiClientProvider(user).future);
  return MeApi(apiClient);
}

@riverpod
Future<SessionsApi> sessionsApi(Ref ref, UserDomain user) async {
  final apiClient = await ref.watch(apiClientProvider(user).future);
  return SessionsApi(apiClient);
}

@riverpod
Future<SocketApi> socketApi(Ref ref, UserDomain user) async {
  final tokenService = ref.read(tokenProvider);
  final token = await tokenService.getAccessToken(user.id);
  final serverUrl = await ref.watch(activeServerUrlProvider(user).future);
  final api = SocketApi(
    baseUrl: serverUrl.toString(),
    token: token,
    tokenUpdates: tokenService.tokenStream(user.id),
    onAuthFailure: () {
      LogService.log('Socket authentication failed');
    },
  );
  ref.onDispose(api.dispose);
  return api;
}

@riverpod
Future<CollectionsApi> collectionsApi(Ref ref, UserDomain user) async {
  final apiClient = await ref.watch(apiClientProvider(user).future);
  return CollectionsApi(apiClient);
}

@riverpod
Future<PlaylistsApi> playlistsApi(Ref ref, UserDomain user) async {
  final apiClient = await ref.watch(apiClientProvider(user).future);
  return PlaylistsApi(apiClient);
}

@riverpod
Future<SearchApi> searchApi(Ref ref, UserDomain user) async {
  final apiClient = await ref.watch(apiClientProvider(user).future);
  return SearchApi(apiClient);
}
