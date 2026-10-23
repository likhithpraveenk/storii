import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storii/app/network/offline_cache_interceptor.dart';

class _FakeCacheStore implements CacheStore {
  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

void main() {
  final cacheOptions = CacheOptions(
    policy: CachePolicy.refreshForceCache,
    hitCacheOnNetworkFailure: true,
    store: _FakeCacheStore(),
  );

  RequestOptions newRequest() => RequestOptions(path: '/api/libraries');

  test('forces cache and short timeouts while offline', () {
    final interceptor = OfflineCacheInterceptor(
      isOffline: () => true,
      cacheOptions: cacheOptions,
    );
    final request = newRequest();

    interceptor.onRequest(request, RequestInterceptorHandler());

    expect(request.getCacheOptions()?.policy, CachePolicy.forceCache);
    expect(request.getCacheOptions()?.hitCacheOnNetworkFailure, isTrue);
    expect(request.connectTimeout, const Duration(seconds: 1));
    expect(request.receiveTimeout, const Duration(seconds: 1));
  });

  test('leaves requests untouched while online', () {
    final interceptor = OfflineCacheInterceptor(
      isOffline: () => false,
      cacheOptions: cacheOptions,
    );
    final request = newRequest();

    interceptor.onRequest(request, RequestInterceptorHandler());

    expect(request.getCacheOptions(), isNull);
    expect(request.connectTimeout, isNull);
    expect(request.receiveTimeout, isNull);
  });
}
