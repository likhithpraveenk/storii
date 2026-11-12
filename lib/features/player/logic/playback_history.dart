import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/playback_event.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/storage/local/playback_history_store.dart';

part 'playback_history.g.dart';

@Riverpod(keepAlive: true)
class PlaybackHistoryNotifier extends _$PlaybackHistoryNotifier {
  PlaybackHistoryStore get _store => ref.read(playbackHistoryStoreProvider);

  @override
  Future<List<PlaybackEvent>> build(String mediaItemId) async {
    final user = ref.read(currentUserProvider);
    if (user == null) return const [];
    final events = await _store.get(user.id, mediaItemId);
    return events ?? const [];
  }

  Future<void> addEvent(PlaybackEvent event) async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    final stateEvents = await future;
    final current = [...stateEvents, event];

    final historyLimit = ref.read(historyLimitProvider);
    final events = current.length > historyLimit
        ? current.sublist(current.length - historyLimit)
        : current;
    state = AsyncData(events);

    await _store.put(user.id, mediaItemId, state.value ?? const []);
  }

  Future<void> updateEvent(PlaybackEvent event) async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    final stateEvents = await future;
    final current = [...stateEvents];
    final index = current.indexWhere((e) => e.timestamp == event.timestamp);
    if (index == -1) return;
    current[index] = event;
    state = AsyncData(_store.collapseLikeEvents(current));
    await _store.put(user.id, mediaItemId, state.value ?? const []);
  }

  Future<void> clearHistory() async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;
    state = const AsyncData([]);
    await _store.remove(user.id, mediaItemId);
  }
}
