import 'package:abs_api/src/client/api_client.dart';
import 'package:abs_api/src/endpoints/api_routes.dart';
import 'package:abs_api/src/models/models.dart';

class PlaylistsApi {
  final ApiClient api;
  const PlaylistsApi(this.api);

  Future<Playlist> create({required CreatePlaylistRequestParams params}) async {
    final response = await api.request(
      ApiRoutes.playlists,
      method: .post,
      body: params.toJson(),
    );
    return fromJson(response.data, Playlist.fromJson);
  }

  Future<List<Playlist>> getAll() async {
    final response = await api.request(ApiRoutes.playlists, method: .get);
    return listFromJsonKey(response.data, 'results', Playlist.fromJson);
  }

  Future<Playlist> get({required String playlistId}) async {
    final response = await api.request(
      ApiRoutes.playlistById(playlistId),
      method: .get,
    );
    return fromJson(response.data, Playlist.fromJson);
  }

  Future<Playlist> updateMetadata({
    required String playlistId,
    required String name,
    required String? description,
  }) async {
    final response = await api.request(
      ApiRoutes.playlistById(playlistId),
      method: .patch,
      body: {'name': name, 'description': description},
    );
    return fromJson(response.data, Playlist.fromJson);
  }

  Future<Playlist> reorder({
    required String playlistId,
    required List<PlaylistItem> items,
  }) async {
    final response = await api.request(
      ApiRoutes.playlistById(playlistId),
      method: .patch,
      body: {'items': items},
    );
    return fromJson(response.data, Playlist.fromJson);
  }

  Future<void> delete({required String playlistId}) async {
    await api.request(ApiRoutes.playlistById(playlistId), method: .delete);
  }

  Future<Playlist> batchAdd({
    required String playlistId,
    required List<PlaylistItem> items,
  }) async {
    final response = await api.request(
      ApiRoutes.playlistBatchAdd(playlistId),
      method: .post,
      body: {'items': items.map((i) => i.toJson()).toList()},
    );
    return fromJson(response.data, Playlist.fromJson);
  }

  Future<Playlist> batchRemove({
    required String playlistId,
    required List<PlaylistItem> items,
  }) async {
    final response = await api.request(
      ApiRoutes.playlistBatchRemove(playlistId),
      method: .post,
      body: {'items': items.map((i) => i.toJson()).toList()},
    );
    return fromJson(response.data, Playlist.fromJson);
  }

  Future<Playlist> createFromCollection({required String collectionId}) async {
    final response = await api.request(
      ApiRoutes.playlistCollection(collectionId),
      method: .post,
    );
    return fromJson(response.data, Playlist.fromJson);
  }
}
