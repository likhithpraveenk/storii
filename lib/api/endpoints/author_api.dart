import 'package:storii/api/client/api_client.dart';
import 'package:storii/api/endpoints/api_routes.dart';
import 'package:storii/api/models/books/author.dart';
import 'package:storii/api/models/utils/json_helpers.dart';

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
