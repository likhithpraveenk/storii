import 'package:storii/abs_api/client/api_client.dart';
import 'package:storii/abs_api/endpoints/api_routes.dart';
import 'package:storii/abs_api/models/json_helpers.dart';
import 'package:storii/abs_api/models/library_item.dart';

class ItemApi {
  final ApiClient api;
  const ItemApi(this.api);

  Future<LibraryItem> get(
    String libraryItemId, {
    bool isExpanded = true,
  }) async {
    final response = await api.request(
      ApiRoutes.itemById(libraryItemId),
      method: .get,
      query: isExpanded ? {'expanded': 1, 'include': 'progress'} : null,
    );
    return fromJson(response.data, LibraryItem.fromJson);
  }
}
