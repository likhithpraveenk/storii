import 'package:dio/dio.dart';
import 'package:storii/api/client/api_client.dart';
import 'package:storii/api/endpoints/api_routes.dart';

class AuthInterceptor extends QueuedInterceptorsWrapper {
  final ApiClient api;

  AuthInterceptor(this.api);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await api.getAccessToken?.call();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final isAuthRoute =
        err.requestOptions.path.contains(ApiRoutes.authRefresh) ||
        err.requestOptions.path.contains(ApiRoutes.login);
    if (err.response?.statusCode == 401 && !isAuthRoute) {
      try {
        final response = await api.handleUnauthorized(err.requestOptions);
        return handler.resolve(response);
      } catch (e) {
        return handler.next(err);
      }
    }

    handler.next(err);
  }
}
