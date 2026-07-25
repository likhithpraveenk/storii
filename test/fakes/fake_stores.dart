import 'package:storii/app/models/playback_event.dart';
import 'package:storii/storage/local/playback_history_store.dart';

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
