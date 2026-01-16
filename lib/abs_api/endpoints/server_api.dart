import 'package:storii/abs_api/client/api_client.dart';
import 'package:storii/abs_api/endpoints/api_routes.dart';

class ServerApi {
  final ApiClient api;
  const ServerApi(this.api);

  Future<void> authorize() async {
    await api.request(ApiRoutes.authorize, method: .post);
  }

  Future<void> logout() async {
    await api.request(ApiRoutes.logout, method: .post);
  }
}
