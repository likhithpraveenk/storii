import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/playback_event.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'playback_history.g.dart';

@Riverpod(keepAlive: true)
class PlaybackHistory extends _$PlaybackHistory {
  Box<List<dynamic>> get box => Hive.box<List<dynamic>>(playbackHistoryBox);

  @override
  List<PlaybackEvent> build(String mediaItemId) {
    final user = ref.watch(currentUserProvider);
    if (user == null) return [];

    final raw = box.get('${user.id}_$mediaItemId');
    return (raw ?? [])
        .map((e) => PlaybackEvent.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  Future<void> addEvent(
    String sessionId,
    PlaybackEvent event, {
    required Duration position,
  }) async {
    final currentHistory = [...state];
    final last = currentHistory.lastOrNull;

    final isConsecutiveSync =
        last?.kind == .sync &&
        event.kind == .sync &&
        last?.syncSuccess == event.syncSuccess;

    if (isConsecutiveSync) {
      currentHistory[currentHistory.length - 1] = event;
    } else {
      currentHistory.add(event);
    }

    if (currentHistory.length > ref.read(historyLimitProvider)) {
      currentHistory.removeAt(0);
    }

    state = currentHistory;
    final raw = currentHistory.map((e) => e.toJson()).toList();
    await box.put(mediaItemId, raw);
    // log('playback history event: ${state.lastOrNull}');
  }

  Future<void> clearHistory() async {
    state = [];
    await box.delete(mediaItemId);
  }
}
