import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/playback_event.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/storage/local/playback_history_store.dart';

part 'playback_history.g.dart';

@Riverpod(keepAlive: true)
class PlaybackHistory extends _$PlaybackHistory {
  PlaybackHistoryStore get _store =>
      ref.read(playbackHistoryStoreProvider.notifier);

  @override
  List<PlaybackEvent> build(String mediaItemId) {
    final user = ref.read(currentUserProvider);
    if (user == null) return [];
    return _store.get(user.id, mediaItemId) ?? [];
  }

  Future<void> addEvent(
    String sessionId,
    PlaybackEvent event, {
    required Duration position,
  }) async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    final current = [...state];
    final last = current.lastOrNull;

    final isConsecutiveSync =
        last?.kind == .sync &&
        event.kind == .sync &&
        last?.syncSuccess == event.syncSuccess;

    if (isConsecutiveSync) {
      current[current.length - 1] = event;
    } else {
      current.add(event);
    }

    final historyLimit = ref.read(historyLimitProvider);
    if (current.length > historyLimit) {
      state = current.sublist(1);
    } else {
      state = current;
    }

    await _store.put(user.id, mediaItemId, state);
  }

  Future<void> updateEvent(PlaybackEvent event) async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    final current = [...state];
    final index = current.indexWhere((e) => e.timestamp == event.timestamp);
    if (index == -1) return;

    current[index] = event;
    state = current;
    await _store.put(user.id, mediaItemId, state);
  }

  Future<void> clearHistory() async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    state = [];
    await _store.remove(user.id, mediaItemId);
  }
}
