import 'package:storii/app/models/playback_event.dart';
import 'package:storii/features/player/logic/playback_history.dart';

class FakePlaybackHistoryNotifier extends PlaybackHistoryNotifier {
  final List<PlaybackEvent> events = [];

  @override
  Future<void> addEvent(
    String sessionId,
    PlaybackEvent event, {
    required Duration position,
  }) async {
    events.add(event);
  }

  @override
  Future<void> updateEvent(PlaybackEvent event) async {
    final index = events.indexWhere((e) => e.timestamp == event.timestamp);
    if (index != -1) events[index] = event;
  }
}
