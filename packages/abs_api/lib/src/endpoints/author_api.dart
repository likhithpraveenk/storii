import 'package:abs_api/src/client/api_client.dart';
import 'package:abs_api/src/endpoints/api_routes.dart';
import 'package:abs_api/src/models/author.dart';
import 'package:abs_api/src/models/json_helpers.dart';

class AuthorApi {
  final ApiClient api;
  const AuthorApi(this.api);

  Future<Author> get(String authorId, String libraryId) async {
    final response = await api.request(
      ApiRoutes.authorById(authorId),
      method: .get,
      query: {'include': 'items,series'},
    );
    return fromJson(response.data, Author.fromJson);
  }
}
