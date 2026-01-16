import 'package:storii/abs_api/client/api_client.dart';
import 'package:storii/abs_api/endpoints/api_routes.dart';
import 'package:storii/abs_api/models/books/author.dart';
import 'package:storii/abs_api/models/books/series.dart';
import 'package:storii/abs_api/models/library/library.dart';
import 'package:storii/abs_api/models/library/shelf.dart';
import 'package:storii/abs_api/models/requests/authors_request_params.dart';
import 'package:storii/abs_api/models/requests/library_items_request_params.dart';
import 'package:storii/abs_api/models/requests/series_request_params.dart';
import 'package:storii/abs_api/models/responses/library_items_response.dart';
import 'package:storii/abs_api/models/responses/series_response.dart';
import 'package:storii/abs_api/models/utils/json_helpers.dart';

class LibraryApi {
  final ApiClient api;
  const LibraryApi(this.api);

  Future<List<Library>> getAll() async {
    final response = await api.request(ApiRoutes.libraries, method: .get);
    return listFromJsonKey(response.data, 'libraries', Library.fromJson);
  }

  Future<Library> get(String libraryId) async {
    final response = await api.request(
      ApiRoutes.libraryById(libraryId),
      method: .get,
    );
    return fromJson(response.data, Library.fromJson);
  }

  Future<LibraryItemsResponse> getItems(
    String libraryId,
    LibraryItemsRequestParams? params,
  ) async {
    final response = await api.request(
      ApiRoutes.libraryItems(libraryId),
      method: .get,
      query: params?.toJson(),
    );
    return fromJson(response.data, LibraryItemsResponse.fromJson);
  }

  Future<List<Shelf>> getPersonalized(String libraryId) async {
    final response = await api.request(
      ApiRoutes.libraryPersonalized(libraryId),
      method: .get,
    );
    return listFromJson(response.data, Shelf.fromJson);
  }

  Future<SeriesResponse> getSeries(
    String libraryId,
    SeriesRequestParams? params,
  ) async {
    final response = await api.request(
      ApiRoutes.series(libraryId),
      method: .get,
      query: params?.toJson(),
    );
    return fromJson(response.data, SeriesResponse.fromJson);
  }

  Future<Series> getSeriesById(String libraryId, String seriesId) async {
    final response = await api.request(
      ApiRoutes.seriesById(libraryId, seriesId),
      method: .get,
      query: {'include': 'progress'},
    );
    return fromJson(response.data, Series.fromJson);
  }

  Future<List<Author>> getAuthors(
    String libraryId,
    AuthorsRequestParams? params,
  ) async {
    final response = await api.request(
      ApiRoutes.authors(libraryId),
      method: .get,
      query: params?.toJson(),
    );
    return listFromJsonKey(response.data, 'authors', Author.fromJson);
  }
}
