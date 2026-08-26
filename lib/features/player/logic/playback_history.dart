import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/playback_event.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/storage/local/playback_history_store.dart';

part 'playback_history.g.dart';

@Riverpod(keepAlive: true)
class PlaybackHistoryNotifier extends _$PlaybackHistoryNotifier {
  PlaybackHistoryStore get _store =>
      ref.read(playbackHistoryStoreProvider.notifier);

  @override
  List<PlaybackEvent> build(String mediaItemId) {
    final user = ref.read(currentUserProvider);
    if (user == null) return [];
    return _store.get(user.id, mediaItemId) ?? [];
  }

  Future<void> addEvent(PlaybackEvent event) async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    final current = [...state, event];

    final historyLimit = ref.read(historyLimitProvider);
    state = current.length > historyLimit
        ? current.sublist(current.length - historyLimit)
        : current;

    await _store.put(user.id, mediaItemId, state);
  }

  Future<void> updateEvent(PlaybackEvent event) async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    final current = [...state];
    final index = current.indexWhere((e) => e.timestamp == event.timestamp);
    if (index == -1) return;

    current[index] = event;
    state = _store.collapseLikeEvents(current);
    await _store.put(user.id, mediaItemId, state);
  }

  Future<void> clearHistory() async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    state = [];
    await _store.remove(user.id, mediaItemId);
  }
}
