import 'package:abs_api/src/client/api_client.dart';
import 'package:abs_api/src/endpoints/api_routes.dart';
import 'package:abs_api/src/models/models.dart';

class CollectionsApi {
  final ApiClient api;
  const new(this.api);

  Future<Collection> create({
    required CreateCollectionRequestParams params,
  }) async {
    final response = await api.request(
      ApiRoutes.collections,
      method: .post,
      body: params.toJson(),
    );
    return fromJson(response.data, Collection.fromJson);
  }

  Future<List<Collection>> getAll() async {
    final response = await api.request(ApiRoutes.collections, method: .get);
    return listFromJsonKey(response.data, 'results', Collection.fromJson);
  }

  Future<Collection> get({required String collectionId}) async {
    final response = await api.request(
      ApiRoutes.collectionById(collectionId),
      method: .get,
    );
    return fromJson(response.data, Collection.fromJson);
  }

  Future<Collection> updateMetadata({
    required String collectionId,
    required String name,
    required String? description,
  }) async {
    final response = await api.request(
      ApiRoutes.collectionById(collectionId),
      method: .patch,
      body: {'name': name, 'description': description},
    );
    return fromJson(response.data, Collection.fromJson);
  }

  Future<Collection> reorder({
    required String collectionId,
    required List<String> books,
  }) async {
    final response = await api.request(
      ApiRoutes.collectionById(collectionId),
      method: .patch,
      body: {'books': books},
    );
    return fromJson(response.data, Collection.fromJson);
  }

  Future<void> delete({required String collectionId}) async {
    await api.request(ApiRoutes.collectionById(collectionId), method: .delete);
  }

  Future<Collection> batchAdd({
    required String collectionId,
    required List<String> libraryItemIds,
  }) async {
    final response = await api.request(
      ApiRoutes.collectionBatchAdd(collectionId),
      method: .post,
      body: {'books': libraryItemIds},
    );
    return fromJson(response.data, Collection.fromJson);
  }

  Future<Collection> batchRemove({
    required String collectionId,
    required List<String> libraryItemIds,
  }) async {
    final response = await api.request(
      ApiRoutes.collectionBatchRemove(collectionId),
      method: .post,
      body: {'books': libraryItemIds},
    );
    return fromJson(response.data, Collection.fromJson);
  }
}
