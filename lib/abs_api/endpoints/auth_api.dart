import 'package:dio/dio.dart';
import 'package:storii/abs_api/client/base_api_client.dart';
import 'package:storii/abs_api/endpoints/api_exception.dart';
import 'package:storii/abs_api/endpoints/api_routes.dart';
import 'package:storii/abs_api/models/responses/login_response.dart';
import 'package:storii/abs_api/models/utils/json_helpers.dart';

class AuthApi {
  final BaseApiClient api;
  const AuthApi(this.api);

  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await api.dio.post(
        ApiRoutes.login,
        data: {'username': username, 'password': password},
        options: Options(headers: {'x-return-tokens': true}),
      );

      return fromJson(response.data, LoginResponse.fromJson);
    } on DioException catch (e, st) {
      throw ApiException(
        mapDioToMessage(e),
        statusCode: e.response?.statusCode,
        originalError: e.error,
        stackTrace: st,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> healthCheck() async {
    try {
      await api.dio.get(ApiRoutes.healthCheck);
    } on DioException catch (e, st) {
      throw ApiException(
        mapDioToMessage(e),
        statusCode: e.response?.statusCode,
        originalError: e.error,
        stackTrace: st,
      );
    } catch (e) {
      rethrow;
    }
  }
}
