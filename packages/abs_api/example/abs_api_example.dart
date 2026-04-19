import 'package:abs_api/abs_api.dart';

void main() async {
  final api = ApiClient(
    baseUrl: Uri.parse('https://abs.example.com'),
    getAccessToken: () async => 'current_access_token',
    getRefreshToken: () async => 'current_refresh_token',
    onTokensUpdated: (access, refresh) async {
      print('Tokens refreshed: $access');
    },
    onTokensFailure: () async {
      print('Session expired');
    },
  );

  try {
    // Access library endpoints via specialized APIs
    final libraryApi = LibraryApi(api);
    final libraries = await libraryApi.getAll();

    for (final lib in libraries) {
      print('Library: ${lib.name} (ID: ${lib.id})');
    }

    // Example: Fetch author details
    final authorApi = AuthorApi(api);
    final author = await authorApi.get('author_id_123', libraries.first.id);
    print('Author: ${author.name}, Books: ${author.numBooks}');
  } on ApiException catch (e) {
    print('API Error: ${e.message} (Status: ${e.statusCode})');
  } finally {
    api.dispose();
  }
}
