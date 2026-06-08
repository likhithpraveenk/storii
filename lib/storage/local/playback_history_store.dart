import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/playback_event.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'playback_history_store.g.dart';

@Riverpod(keepAlive: true)
class PlaybackHistoryStore extends _$PlaybackHistoryStore {
  Box<List<dynamic>> get _box => Hive.box<List<dynamic>>(playbackHistoryBox);

  String _key(String userId, String mediaItemId) => '${userId}_$mediaItemId';

  @override
  FutureOr<void> build() {}

  Future<void> put(
    String userId,
    String mediaItemId,
    List<PlaybackEvent> events,
  ) async {
    final raw = events.map((e) => e.toJson()).toList();
    await _box.put(_key(userId, mediaItemId), raw);
  }

  List<PlaybackEvent>? get(String userId, String mediaItemId) {
    final raw = _box.get(_key(userId, mediaItemId));
    return raw
        ?.map(
          (e) => PlaybackEvent.fromJson(Map<String, dynamic>.from(e as Map)),
        )
        .toList();
  }

  Future<void> remove(String userId, String mediaItemId) =>
      _box.delete(_key(userId, mediaItemId));
}
