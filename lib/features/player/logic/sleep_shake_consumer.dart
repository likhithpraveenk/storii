import 'dart:async';
import 'dart:math' as math;

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/sleep_timer_provider.dart';
import 'package:vibration/vibration.dart';

part 'sleep_shake_consumer.g.dart';

@riverpod
class SleepShakeConsumerNotifier extends _$SleepShakeConsumerNotifier {
  StreamSubscription<AccelerometerEvent>? _subscription;
  DateTime _lastShake = DateTime(0);

  static const _debounce = Duration(milliseconds: 500);

  @override
  void build() {
    _subscription = accelerometerEventStream().listen(_onEvent);

    ref.onDispose(() {
      _subscription?.cancel();
    });
  }

  void _onEvent(AccelerometerEvent event) {
    final action = ref.read(shakeDuringSleepTimerProvider);
    if (action == .off) return;

    final timer = ref.read(sleepTimerProvider);
    if (timer == null) return;

    final threshold = switch (ref.read(shakeSensitivityProvider)) {
      .low => 42,
      .medium => 33,
      .high => 25,
    };

    final magnitude = math.sqrt(
      event.x * event.x + event.y * event.y + event.z * event.z,
    );

    if (magnitude < threshold) return;

    final now = DateTime.now();
    if (now.difference(_lastShake) <= _debounce) return;

    _lastShake = now;
    _handleShake(action, ref.read(sleepTimerProvider.notifier));
  }

  Future<void> _handleShake(
    ShakeDuringSleepTimerAction action,
    SleepTimer timer,
  ) async {
    final success = switch (action) {
      .restart => timer.restart(),
      .addTime => timer.add(
        Duration(minutes: ref.read(shakeSleepTimerAddMinutesProvider)),
      ),
      .off => false,
    };

    if (success && await Vibration.hasVibrator()) {
      await Vibration.vibrate(preset: .quickSuccessAlert);
    }
  }
}
