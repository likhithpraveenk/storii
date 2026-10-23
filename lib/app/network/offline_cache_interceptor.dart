import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class OfflineCacheInterceptor extends Interceptor {
  final bool Function() isOffline;
  final CacheOptions cacheOptions;

  new({required this.isOffline, required this.cacheOptions});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (isOffline()) {
      options.extra.addAll(
        cacheOptions.copyWith(policy: CachePolicy.forceCache).toExtra(),
      );
      options
        ..connectTimeout = const Duration(seconds: 1)
        ..receiveTimeout = const Duration(seconds: 1);
    }
    super.onRequest(options, handler);
  }
}
