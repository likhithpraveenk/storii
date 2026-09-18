import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/logic/sleep_timer_provider.dart';

part 'sleep_window_consumer.g.dart';

@riverpod
void sleepWindowConsumer(Ref ref) {
  ref.listen(sessionProvider, (previous, next) {
    if (previous == null && next != null) _maybeStartSleepTimer(ref);
  });
}

void _maybeStartSleepTimer(Ref ref) {
  final enabled = ref.read(isSleepWindowOnProvider);
  if (!enabled) return;

  final timer = ref.read(sleepTimerProvider);
  if (timer != null) return;

  final (startMinutes, endMinutes) = ref.read(sleepWindowProvider);
  final now = DateTime.now();
  final currentMinutes = now.hour * 60 + now.minute;

  if (!_isInWindow(currentMinutes, startMinutes, endMinutes)) return;

  final duration = ref.read(sleepTimerWindowDurationProvider);
  ref.read(sleepTimerProvider.notifier).set(duration);
}

bool _isInWindow(int current, int start, int end) {
  if (start <= end) return current >= start && current < end;
  return current >= start || current < end;
}
