import 'package:abs_api/src/client/api_client.dart';
import 'package:abs_api/src/endpoints/api_routes.dart';
import 'package:abs_api/src/models/json_helpers.dart';
import 'package:abs_api/src/models/search_book.dart';

class SearchApi {
  final ApiClient api;
  const new(this.api);

  Future<List<SearchBook>> books({
    required String provider,
    required String itemId,
    required String title,
    String? author,
  }) async {
    final response = await api.request(
      ApiRoutes.searchBooks,
      method: .get,
      query: {
        'provider': provider,
        'id': itemId,
        'title': title,
        'author': ?author,
      },
    );

    return listFromJson(response.data, SearchBook.fromJson);
  }

  Future<List<String>> covers({
    required String provider,
    required String itemId,
    required String title,
    String? author,
    required bool isPodcast,
  }) async {
    final response = await api.request(
      ApiRoutes.searchCovers,
      method: .get,
      query: {
        'provider': provider,
        'id': itemId,
        'title': title,
        'author': ?author,
        'isPodcast': isPodcast ? 1 : null,
      },
    );

    return fromJsonKey(response.data, 'results');
  }

  // Future<List<SearchPodcast>> podcasts({
  //   required String term,
  //   String? country,
  // }) async {
  //   final response = await api.request(
  //     ApiRoutes.searchPodcasts,
  //     method: .get,
  //     query: {'term': term, 'country': ?country},
  //   );

  //   return listFromJson(response.data, SearchPodcast.fromJson);
  // }

  // Future<List<SearchEpisode>> episodes({
  //   required String podcastId,
  //   required String title,
  // }) async {
  //   final response = await api.request(
  //     ApiRoutes.searchEpisodes(podcastId),
  //     method: .get,
  //     query: {'title': title},
  //   );
  //   final episodes = fromJsonKey(response.data, 'episodes');

  //   return listFromJson(episodes, SearchEpisode.fromJson);
  // }
}
