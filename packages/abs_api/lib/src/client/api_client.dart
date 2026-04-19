import 'dart:developer';
import 'dart:io';

import 'package:abs_api/src/client/interceptors.dart';
import 'package:abs_api/src/endpoints/api_exception.dart';
import 'package:abs_api/src/endpoints/api_routes.dart';
import 'package:abs_api/src/models/enums.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;
  final Uri baseUrl;
  final Future<String?> Function()? getAccessToken;
  final Future<String?> Function()? getRefreshToken;
  final Future<void> Function(String access, String refresh)? onTokensUpdated;
  final Future<void> Function()? onTokensFailure;
  final CancelToken? cancelToken;
  final List<Interceptor>? interceptors;

  Future<bool>? _refreshFuture;

  ApiClient({
    required this.baseUrl,
    this.getAccessToken,
    this.getRefreshToken,
    this.onTokensUpdated,
    this.onTokensFailure,
    this.cancelToken,
    this.interceptors,
  }) : _dio = Dio(
         BaseOptions(
           baseUrl: baseUrl.toString(),
           connectTimeout: const Duration(seconds: 30),
           receiveTimeout: const Duration(seconds: 30),
           sendTimeout: const Duration(seconds: 30),
         ),
       ) {
    _dio.options.headers = {'Content-Type': 'application/json'};
    _dio.interceptors.addAll([AuthInterceptor(this), ...?interceptors]);
  }

  Future<Response> handleUnauthorized(RequestOptions failedRequest) async {
    final failedToken = failedRequest.headers['Authorization']
        ?.toString()
        .replaceFirst('Bearer ', '');

    final currentToken = await getAccessToken?.call();
    if (currentToken != null && currentToken != failedToken) {
      log(
        'Token was refreshed by another request, retrying with new token',
        name: 'ApiClient',
      );
      return _retryRequest(failedRequest, currentToken);
    }

    _refreshFuture ??= refreshAccessToken();

    try {
      final success = await _refreshFuture;

      if (success == false || success == null) {
        await onTokensFailure?.call();
        throw const ApiException(
          'Your session has expired. Please login again.',
          statusCode: 401,
        );
      }

      final newToken = await getAccessToken?.call();
      return _retryRequest(failedRequest, newToken!);
    } finally {
      _refreshFuture = null;
    }
  }

  Future<Response> _retryRequest(RequestOptions options, String token) {
    options.headers['Authorization'] = 'Bearer $token';
    return _dio.fetch(options);
  }

  Future<bool> refreshAccessToken() async {
    final refreshToken = await getRefreshToken?.call();
    if (refreshToken == null) return false;

    try {
      final refreshDio = Dio(BaseOptions(baseUrl: baseUrl.toString()))
        ..interceptors.addAll([...?interceptors]);

      final res = await refreshDio.post(
        ApiRoutes.authRefresh,
        options: Options(headers: {'x-refresh-token': refreshToken}),
      );

      if (res.data case {
        'user': {
          'accessToken': final String access,
          'refreshToken': final String refresh,
        },
      }) {
        await onTokensUpdated?.call(access, refresh);
        return true;
      }
      return false;
    } catch (e, st) {
      log('Token Refresh Failed: $e', name: 'ApiClient', stackTrace: st);
      return false;
    }
  }

  Future<Response<T>> request<T>(
    String path, {
    required HttpMethod method,
    Map<String, dynamic>? query,
    Object? body,
    Map<String, dynamic>? headers,
    bool? followRedirects,
    Cookie? cookie,
    ResponseType? responseType,
    Options? options,
  }) async {
    try {
      final response = await _dio.request<T>(
        path,
        data: body,
        queryParameters: query,
        options:
            options ??
            Options(
              method: method.name,
              responseType: responseType,
              headers: {
                ...?headers,
                if (cookie != null &&
                    cookie.name.isNotEmpty &&
                    cookie.value.isNotEmpty)
                  'Cookie': '${cookie.name}=${cookie.value}',
              },
              followRedirects: followRedirects,
            ),
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e, stack) {
      throw apiExceptionFromDio(e, stack);
    } catch (e) {
      rethrow;
    }
  }

  void dispose() => _dio.close();
}
