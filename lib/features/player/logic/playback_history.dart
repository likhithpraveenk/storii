import 'dart:developer';

import 'package:hive_ce/hive_ce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/playback_event.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/local_position_provider.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'playback_history.g.dart';

@Riverpod(keepAlive: true)
class PlaybackHistory extends _$PlaybackHistory {
  late Box<List<dynamic>> _box;

  @override
  List<PlaybackEvent> build(String mediaItemId) {
    _box = Hive.box<List<dynamic>>(playbackHistoryBox);

    final raw = _box.get(mediaItemId);
    return (raw ?? [])
        .map((e) => PlaybackEvent.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  Future<void> addEvent(
    String sessionId,
    PlaybackEventKind type, {
    ServerSyncResult? syncResult,
  }) async {
    final position = ref.read(localPositionProvider(sessionId));
    if (position == null) return;

    final event = PlaybackEvent(
      timestamp: DateTime.now(),
      position: position,
      kind: type,
    );

    final currentHistory = [...state];
    final last = currentHistory.lastOrNull;

    final isConsecutiveSync =
        last?.kind == .sync &&
        event.kind == .sync &&
        last?.syncResult?.success == event.syncResult?.success;

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
    await _box.put(mediaItemId, raw);
    log('playback history event: ${state.lastOrNull}');
  }

  Future<void> clearHistory() async {
    state = [];
    await _box.delete(mediaItemId);
  }
}
