import 'package:dio/dio.dart';
import 'package:storii/app/logs/log_service.dart';

class LogsInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
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
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final duration = _getDuration(response.requestOptions);
    final path = response.requestOptions.uri.path;

    // final prettyBody = response.data != null
    //     ? '\n${jsonEncode(response.data).toPrettyJson()}'
    //     : '';

    LogService.log(
      'RESPONSE: [${response.statusCode}] (${duration}ms) $path',
      source: 'ApiClient',
      level: .http,
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final duration = _getDuration(err.requestOptions);
    final path = err.requestOptions.uri.path;
    LogService.log(
      'ERROR: [${err.response?.statusCode ?? "No Status"}] (${duration}ms) $path\n'
      'Message: ${err.message}',
      source: 'ApiClient',
      level: .http,
      stackTrace: err.stackTrace,
    );
    super.onError(err, handler);
  }

  int _getDuration(RequestOptions options) {
    final startTime = options.extra['startTime'] as int?;
    if (startTime == null) return 0;
    return DateTime.now().millisecondsSinceEpoch - startTime;
  }
}
