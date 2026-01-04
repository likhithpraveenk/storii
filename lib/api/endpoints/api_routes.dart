class ApiRoutes {
  static String _build(String template, Map<String, String?> params) {
    String path = template;
    params.forEach((k, v) {
      if (v != null && v.isNotEmpty) {
        path = path.replaceAll(':$k', v);
      } else {
        path = path.replaceAll('/:$k?', '');
      }
    });
    return path;
  }

  // Server
  static const healthCheck = '/healthcheck';

  // Auth Routes
  static const login = '/login';
  static const authRefresh = '/auth/refresh';
  static const authorize = '/api/authorize';
  static const logout = '/logout';

  // Library
  static const libraries = '/api/libraries';
  static const _libraryById = '/api/libraries/:id';
  static const _libraryItems = '/api/libraries/:id/items';
  static const _libraryPersonalized = '/api/libraries/:id/personalized';
  static const _series = '/api/libraries/:id/series';
  static const _librarySeriesById = '/api/libraries/:id/series/:seriesId';
  static const _authors = '/api/libraries/:id/authors';

  static String libraryById(String id) => _build(_libraryById, {'id': id});
  static String libraryItems(String id) => _build(_libraryItems, {'id': id});
  static String libraryPersonalized(String id) =>
      _build(_libraryPersonalized, {'id': id});
  static String series(String id) => _build(_series, {'id': id});
  static String seriesById(String id, String seriesId) =>
      _build(_librarySeriesById, {'id': id, 'seriesId': seriesId});
  static String authors(String id) => _build(_authors, {'id': id});

  // Items
  static const _itemById = '/api/items/:id';
  static const _itemDownload = '/api/items/:id/download';
  static const _itemMedia = '/api/items/:id/media';
  static const _itemCover = '/api/items/:id/cover';

  static String itemById(String id) => _build(_itemById, {'id': id});
  static String itemDownload(String id) => _build(_itemDownload, {'id': id});
  static String itemMedia(String id) => _build(_itemMedia, {'id': id});
  static String itemCover(String id) => _build(_itemCover, {'id': id});

  // Author
  static const _authorById = '/api/authors/:id';

  static String authorById(String id) => _build(_authorById, {'id': id});
}
