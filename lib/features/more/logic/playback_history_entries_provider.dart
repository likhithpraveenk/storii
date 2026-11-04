import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/storage/local/playback_history_store.dart';

part 'playback_history_entries_provider.g.dart';

class PlaybackHistoryEntry {
  const new({
    required this.itemId,
    this.episodeId,
    required this.lastTimestamp,
  });

  final String itemId;
  final String? episodeId;
  final DateTime lastTimestamp;
}

@riverpod
List<PlaybackHistoryEntry> playbackHistoryEntries(Ref ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null) return const [];

  final store = ref.read(playbackHistoryStoreProvider);
  final map = store.getAllForUser(user.id);

  final entries = map.entries.map<PlaybackHistoryEntry>((e) {
    final (id: itemId, :episodeId) = fromMediaItemIdKey(e.key);
    final events = e.value;
    return .new(
      itemId: itemId,
      episodeId: episodeId,
      lastTimestamp: events.isEmpty
          ? DateTime.fromMillisecondsSinceEpoch(0)
          : events.last.timestamp,
    );
  }).toList()..sort((a, b) => b.lastTimestamp.compareTo(a.lastTimestamp));
  return entries;
}
