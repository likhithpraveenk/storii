import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:storii/api/client/interceptors.dart';
import 'package:storii/api/endpoints/api_exception.dart';
import 'package:storii/api/endpoints/api_routes.dart';
import 'package:storii/api/models/utils/enums.dart';
import 'package:synchronized/synchronized.dart';

class ApiClient {
  final Dio _dio;
  final Uri baseUrl;
  final Future<String?> Function()? getAccessToken;
  final Future<String?> Function()? getRefreshToken;
  final Future<void> Function(String access, String refresh)? onTokensUpdated;
  final Future<void> Function()? onTokensFailure;
  final Lock _refreshLock = Lock();
  final CancelToken? cancelToken;

  ApiClient({
    required this.baseUrl,
    this.getAccessToken,
    this.getRefreshToken,
    this.onTokensUpdated,
    this.onTokensFailure,
    this.cancelToken,
  }) : _dio = Dio(
         BaseOptions(
           baseUrl: baseUrl.toString(),
           connectTimeout: const Duration(seconds: 10),
           receiveTimeout: const Duration(seconds: 15),
           sendTimeout: const Duration(seconds: 5),
         ),
       ) {
    _dio.options.headers = {'Content-Type': 'application/json'};
    _dio.interceptors.addAll([
      AuthInterceptor(this),
      if (kDebugMode) PrettyDioLogger(responseBody: false),
    ]);
  }

  Future<Response> handleUnauthorized(RequestOptions failedRequest) async {
    return _refreshLock.synchronized(() async {
      final latestToken = await getAccessToken?.call();
      final oldToken = failedRequest.headers['Authorization']
          ?.toString()
          .replaceFirst('Bearer ', '');

      if (latestToken != null && latestToken != oldToken) {
        return _dio.fetch(failedRequest.copyWith());
      }

      if (failedRequest.extra['__retried'] == true) {
        throw const ApiException('Session expired', statusCode: 401);
      }
      failedRequest.extra['__retried'] = true;

      final success = await _refreshAccessToken();
      if (!success) {
        await onTokensFailure?.call();
        throw const ApiException(
          'Your session has expired. Please login again.',
          statusCode: 401,
        );
      }
      return _dio.fetch(failedRequest.copyWith());
    });
  }

  Future<bool> _refreshAccessToken() async {
    final refreshToken = await getRefreshToken?.call();
    if (refreshToken == null) return false;

    try {
      final refreshDio = Dio(BaseOptions(baseUrl: _dio.options.baseUrl));

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
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Token Refresh Failed: $e');
      }
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
      throw ApiException(
        mapDioToMessage(e),
        statusCode: e.response?.statusCode,
        originalError: e.error,
        stackTrace: stack,
      );
    } catch (e) {
      rethrow;
    }
  }

  void dispose() => _dio.close();
}
