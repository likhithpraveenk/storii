import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/shared/helpers/extensions.dart';

class LogsInterceptor extends Interceptor {
  final _stopwatch = Stopwatch();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _stopwatch.start();
    final path = options.uri.path;
    final query = options.queryParameters.isNotEmpty
        ? '\nqueryParameters: ${options.queryParameters}'
        : '';
    LogService.log(
      'REQUEST: ${options.method} $path$query',
      source: 'ApiClient',
      level: .http,
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _stopwatch.stop();
    final duration = _stopwatch.elapsedMilliseconds;
    final path = response.requestOptions.uri.path;
    final prettyBody = response.data != null
        ? '\n${jsonEncode(response.data).toPrettyJson()}'
        : '';
    LogService.log(
      'RESPONSE: [${response.statusCode}] (${duration}ms) $path$prettyBody',
      source: 'ApiClient',
      level: .http,
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _stopwatch.stop();
    final path = err.requestOptions.uri.path;
    LogService.log(
      'ERROR: [${err.response?.statusCode ?? "No Status"}] $path\n'
      'Message: ${err.message}',
      source: 'ApiClient',
      level: .http,
      stackTrace: err.stackTrace,
    );
    super.onError(err, handler);
  }
}
