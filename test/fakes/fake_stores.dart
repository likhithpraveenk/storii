import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/models/playback_event.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/storage/local/downloads_store.dart';
import 'package:storii/storage/local/items_cache.dart';
import 'package:storii/storage/local/playback_history_store.dart';
import 'package:storii/storage/local/progress_store.dart';
import 'package:storii/storage/local/session_store.dart';

class FakePlaybackHistoryStore extends PlaybackHistoryStore {
  final Map<String, List<PlaybackEvent>> _data = {};
  int putCalls = 0;
  int removeCalls = 0;

  String _key(String userId, String mediaItemId) => '${userId}_$mediaItemId';

  void seed(String userId, String mediaItemId, List<PlaybackEvent> events) {
    _data[_key(userId, mediaItemId)] = events;
  }

  @override
  List<PlaybackEvent>? get(String userId, String mediaItemId) =>
      _data[_key(userId, mediaItemId)];

  @override
  Future<void> put(
    String userId,
    String mediaItemId,
    List<PlaybackEvent> events,
  ) async {
    putCalls++;
    _data[_key(userId, mediaItemId)] = events;
  }

  @override
  Future<void> remove(String userId, String mediaItemId) async {
    removeCalls++;
    _data.remove(_key(userId, mediaItemId));
  }
}

class FakeSessionStore extends SessionStore {
  final Map<String, PlaybackSession> _sessions = {};
  int saveCalls = 0;
  int deleteCalls = 0;

  Map<String, PlaybackSession> get sessions => _sessions;

  @override
  Future<void> save(PlaybackSession session) async {
    saveCalls++;
    _sessions[session.id] = session;
  }

  @override
  Future<void> delete(String sessionId) async {
    deleteCalls++;
    _sessions.remove(sessionId);
  }

  @override
  List<PlaybackSession> getAll() => _sessions.values.toList();

  @override
  PlaybackSession? getSession(String itemId, [String? episodeId]) {
    for (final s in _sessions.values) {
      if (s.libraryItemId == itemId && s.episodeId == episodeId) {
        return s;
      }
    }
    return null;
  }
}

class FakeProgressStore extends ProgressStore {
  new({required super.userId});

  final Map<String, MediaProgress> _progress = {};
  int saveCalls = 0;

  Map<String, MediaProgress> get progressMap => _progress;

  @override
  Future<void> put(MediaProgress progress) async {
    saveCalls++;
    _progress[progress.id] = progress;
  }
}

class FakeDownloadsStore extends DownloadsStore {
  new() : super();

  final Map<String, DownloadItem> _data = <String, DownloadItem>{};
  int saveCalls = 0;
  final List<DownloadItem> saved = <DownloadItem>[];
  Object? saveError;

  @override
  DownloadItem? get(String key) => _data[key];

  @override
  Map<String, DownloadItem> getAll() => Map.unmodifiable(_data);

  @override
  Future<void> save(DownloadItem item) async {
    saveCalls++;
    final error = saveError;
    if (error != null) throw error;
    _data[item.key] = item;
    saved.add(item);
  }
}

class FakeItemsCache extends ItemsCache {
  new() : super();
  final List<LibraryItem> puts = <LibraryItem>[];

  @override
  Future<void> put(LibraryItem item) async => puts.add(item);
}
