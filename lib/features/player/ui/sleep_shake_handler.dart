import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/sleep_timer_provider.dart';

class SleepShakeHandler extends ConsumerStatefulWidget {
  const new({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<SleepShakeHandler> createState() => _SleepShakeHandlerState();
}

class _SleepShakeHandlerState extends ConsumerState<SleepShakeHandler> {
  StreamSubscription<AccelerometerEvent>? _subscription;
  int _lastShakeTime = 0;

  @override
  void initState() {
    super.initState();
    _subscription = accelerometerEventStream().listen(_onAccelerometer);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  static const gAcc = 9.80665;

  void _onAccelerometer(AccelerometerEvent event) {
    final action = ref.read(shakeDuringSleepTimerProvider);
    if (action == .off) return;

    final sleep = ref.read(sleepTimerProvider);
    if (sleep == null) return;

    final threshold = switch (ref.read(shakeSensitivityProvider)) {
      .low => 3.5,
      .medium => 2.7,
      .high => 2.0,
    };

    final gX = event.x / gAcc;
    final gY = event.y / gAcc;
    final gZ = event.z / gAcc;
    final gForce = math.sqrt(gX * gX + gY * gY + gZ * gZ);

    final now = DateTime.now().millisecondsSinceEpoch;
    if (gForce > threshold && now - _lastShakeTime > 500) {
      _lastShakeTime = now;
      _handleShake(action, ref.read(sleepTimerProvider.notifier));
    }
  }

  void _handleShake(ShakeDuringSleepTimerAction action, SleepTimer timer) {
    switch (action) {
      case .restart:
        timer.restart();
        HapticFeedback.vibrate();
      case .addTime:
        final minutes = ref.read(shakeSleepTimerAddMinutesProvider);
        timer.add(Duration(minutes: minutes));
        HapticFeedback.vibrate();
      case .off:
        break;
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
