import 'package:dio/dio.dart';
import 'package:storii/app/logs/log_service.dart';

class LogsInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!LogService.isHttpLoggingEnabled()) {
      handler.next(options);
      return;
    }
    options.extra['startTime'] = DateTime.now().millisecondsSinceEpoch;
    final path = options.uri.path;
    final query = options.queryParameters.isNotEmpty
        ? ' query: ${options.queryParameters}'
        : '';
    LogService.log(
      'REQUEST: ${options.method} $path$query',
      source: 'ApiClient',
      level: .http,
    );
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!LogService.isHttpLoggingEnabled()) {
      handler.next(response);
      return;
    }
    final duration = _getDuration(response.requestOptions);
    final path = response.requestOptions.uri.path;

    LogService.log(
      'RESPONSE: [${response.statusCode}] (${duration}ms) $path',
      source: 'ApiClient',
      level: .http,
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!LogService.isHttpLoggingEnabled()) {
      handler.next(err);
      return;
    }
    final duration = _getDuration(err.requestOptions);
    final path = err.requestOptions.uri.path;
    LogService.log(
      'ERROR: [${err.response?.statusCode ?? "No Status"}] (${duration}ms) $path\n'
      'Message: ${err.message}',
      source: 'ApiClient',
      level: .http,
      stackTrace: err.stackTrace,
    );
    handler.next(err);
  }

  int _getDuration(RequestOptions options) {
    final startTime = options.extra['startTime'] as int?;
    if (startTime == null) return 0;
    return DateTime.now().millisecondsSinceEpoch - startTime;
  }
}
