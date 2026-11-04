import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/playback_event.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'playback_history_store.g.dart';

class PlaybackHistoryStore {
  const new();

  Future<void> put(
    String userId,
    String mediaItemId,
    List<PlaybackEvent> events,
  ) async {
    final collapsed = collapseLikeEvents(events);
    final raw = collapsed.map((e) => e.toJson()).toList();
    await playbackHistoryBox.put(userMediaItemIdKey(userId, mediaItemId), raw);
  }

  List<PlaybackEvent>? get(String userId, String mediaItemId) {
    final raw = playbackHistoryBox.get(userMediaItemIdKey(userId, mediaItemId));
    final events = raw
        ?.map(
          (e) => PlaybackEvent.fromJson(Map<String, dynamic>.from(e as Map)),
        )
        .toList();
    return events == null ? null : collapseLikeEvents(events);
  }

  Future<void> remove(String userId, String mediaItemId) =>
      playbackHistoryBox.delete(userMediaItemIdKey(userId, mediaItemId));

  Map<String, List<PlaybackEvent>> getAllForUser(String userId) {
    final result = <String, List<PlaybackEvent>>{};
    final prefix = '${userId}_';
    for (final key in playbackHistoryBox.keys) {
      if (key is! String || !key.startsWith(prefix)) continue;
      final mediaItemId = key.substring(prefix.length);
      final raw = playbackHistoryBox.get(key);
      final events = raw
          ?.map(
            (e) => PlaybackEvent.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList();
      if (events != null) {
        result[mediaItemId] = collapseLikeEvents(events);
      }
    }
    return result;
  }

  List<PlaybackEvent> collapseLikeEvents(List<PlaybackEvent> events) {
    if (events.isEmpty) return events;

    final collapsed = <PlaybackEvent>[events.first];
    for (final event in events.skip(1)) {
      final last = collapsed.last;
      if (_isLikeEvent(last, event)) {
        collapsed[collapsed.length - 1] = event.copyWith(
          listened: last.listened + event.listened,
        );
      } else {
        collapsed.add(event);
      }
    }
    return collapsed;
  }

  bool _isLikeEvent(PlaybackEvent a, PlaybackEvent b) {
    if (a.kind != b.kind) return false;

    return switch (a.kind) {
      .sync => a.syncSuccess == b.syncSuccess,
      _ => false,
    };
  }
}

@riverpod
PlaybackHistoryStore playbackHistoryStore(Ref ref) =>
    const PlaybackHistoryStore();
