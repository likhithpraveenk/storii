class ApiRoutes {
  static String _build(String template, Map<String, String?> params) {
    var path = template;
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
  static const _authorImage = '/api/authors/:id/image';

  static String authorById(String id) => _build(_authorById, {'id': id});
  static String authorImage(String id) => _build(_authorImage, {'id': id});

  //
  // Current User Routes (Me)
  //
  static const me = '/api/me';
  static const meListeningSessions = '/api/me/listening-sessions';
  static const meListeningStats = '/api/me/listening-stats';
  static const meItemsInProgress = '/api/me/items-in-progress';
  static const _meProgressRemove =
      '/api/me/progress/:id/remove-from-continue-listening';
  static const _meProgressById = '/api/me/progress/:libraryItemId/:episodeId?';
  static const _meItemBookmark = '/api/me/item/:id/bookmark';
  static const _meItemBookmarkTime = '/api/me/item/:id/bookmark/:time';
  static const _meSeriesRemove =
      '/api/me/series/:id/remove-from-continue-listening';

  static String meProgressRemove(String id) =>
      _build(_meProgressRemove, {'id': id});
  static String meProgressById(String libraryItemId, [String? episodeId]) =>
      _build(_meProgressById, {
        'libraryItemId': libraryItemId,
        'episodeId': episodeId,
      });
  static String meItemBookmark(String id) =>
      _build(_meItemBookmark, {'id': id});
  static String meItemBookmarkTime(String id, String time) =>
      _build(_meItemBookmarkTime, {'id': id, 'time': time});
  static String meSeriesRemove(String id) =>
      _build(_meSeriesRemove, {'id': id});

  //
  // Playback Session Routes
  //
  static const sessions = '/api/sessions';
  static const sessionOpen = '/api/sessions/open';
  static const sessionBatchDelete = '/api/sessions/batch/delete';
  static const sessionLocal = '/api/session/local';
  static const sessionLocalAll = '/api/session/local-all';
  static const _sessionById = '/api/sessions/:id';
  static const _sessionSync = '/api/session/:id/sync';
  static const _sessionClose = '/api/session/:id/close';

  static String sessionById(String id) => _build(_sessionById, {'id': id});
  static String sessionSync(String id) => _build(_sessionSync, {'id': id});
  static String sessionClose(String id) => _build(_sessionClose, {'id': id});
}
