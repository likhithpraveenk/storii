import 'package:dio/dio.dart';
import 'package:storii/abs_api/client/api_client.dart';
import 'package:storii/abs_api/endpoints/api_exception.dart';
import 'package:storii/abs_api/endpoints/api_routes.dart';
import 'package:storii/abs_api/models/json_helpers.dart';
import 'package:storii/abs_api/models/login_response.dart';

class ServerApi {
  final ApiClient api;
  const ServerApi(this.api);

  Future<LoginResponse> authorize() async {
    try {
      final response = await api.request(ApiRoutes.authorize, method: .post);
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

  Future<void> logout() async {
    await api.request(ApiRoutes.logout, method: .post);
  }
}
