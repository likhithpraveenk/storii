import 'package:abs_api/src/client/api_client.dart';
import 'package:abs_api/src/endpoints/api_routes.dart';
import 'package:abs_api/src/models/json_helpers.dart';
import 'package:abs_api/src/models/login_response.dart';

class ServerApi {
  final ApiClient api;
  const ServerApi(this.api);

  Future<LoginResponse> authorize() async {
    final response = await api.request(ApiRoutes.authorize, method: .post);

    return fromJson(response.data, LoginResponse.fromJson);
  }

  Future<void> logout() async {
    await api.request(ApiRoutes.logout, method: .post);
  }
}
