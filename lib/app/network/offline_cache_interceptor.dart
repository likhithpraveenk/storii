import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class OfflineCacheInterceptor extends Interceptor {
  final bool Function() isConnected;
  final CacheOptions cacheOptions;

  OfflineCacheInterceptor({
    required this.isConnected,
    required this.cacheOptions,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!isConnected()) {
      options.extra.addAll(
        cacheOptions.copyWith(policy: CachePolicy.forceCache).toExtra(),
      );
      options.connectTimeout = const Duration(seconds: 1);
      options.receiveTimeout = const Duration(seconds: 1);
    }
    super.onRequest(options, handler);
  }
}
