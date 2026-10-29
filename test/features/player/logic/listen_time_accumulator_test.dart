import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storii/features/player/logic/listen_time_accumulator.dart';

Future<T> _tickAsync<T>(
  FutureOr<T> Function(ListenTimeAccumulator, void Function(Duration)) action,
) => fakeAsync((async) async {
  var now = DateTime(2026);
  final accumulator = ListenTimeAccumulator(() => now);
  void tick(Duration d) {
    async.elapse(d);
    now = now.add(d);
  }

  return action(accumulator, tick);
});

void main() {
  test('start is idempotent', () {
    _tickAsync((accumulator, tick) async {
      accumulator.start();
      tick(const Duration(milliseconds: 100));
      accumulator.start();
      tick(const Duration(milliseconds: 100));
      final total = accumulator.snapshotAndReset(keepRunning: false);
      expect(total.inMilliseconds, greaterThanOrEqualTo(200));
    });
  });

  test('pause accumulates elapsed time', () {
    _tickAsync((accumulator, tick) async {
      accumulator.start();
      tick(const Duration(milliseconds: 200));
      accumulator.pause();
      final total = accumulator.snapshotAndReset(keepRunning: false);
      expect(total.inMilliseconds, greaterThanOrEqualTo(200));
    });
  });

  test('snapshotAndReset with keepRunning resets start time to now', () {
    _tickAsync((accumulator, tick) async {
      accumulator.start();
      tick(const Duration(milliseconds: 200));
      accumulator.snapshotAndReset(keepRunning: true);
      final second = accumulator.snapshotAndReset(keepRunning: false);
      expect(second.inMilliseconds, lessThan(50));
    });
  });

  test('rollback restores time for next snapshot', () {
    _tickAsync((accumulator, tick) async {
      accumulator.start();
      tick(const Duration(milliseconds: 200));
      final snapshot = accumulator.snapshotAndReset(keepRunning: false);
      accumulator.rollback(snapshot);
      final total = accumulator.snapshotAndReset(keepRunning: false);
      expect(total.inMilliseconds, greaterThanOrEqualTo(200));
    });
  });

  test('reset clears everything', () {
    _tickAsync((accumulator, tick) async {
      accumulator.start();
      tick(const Duration(milliseconds: 200));
      accumulator.reset();
      final total = accumulator.snapshotAndReset(keepRunning: false);
      expect(total, Duration.zero);
      expect(accumulator.isRunning, false);
    });
  });

  test('resume accumulates elapsed time when already running', () {
    _tickAsync((accumulator, tick) async {
      accumulator.start();
      tick(const Duration(milliseconds: 200));
      accumulator.resume();
      final total = accumulator.snapshotAndReset(keepRunning: false);
      expect(total.inMilliseconds, greaterThanOrEqualTo(200));
    });
  });

  test('resume sets start time when not running', () {
    _tickAsync((accumulator, tick) async {
      accumulator.resume();
      tick(const Duration(milliseconds: 200));
      final total = accumulator.snapshotAndReset(keepRunning: false);
      expect(total.inMilliseconds, greaterThanOrEqualTo(200));
    });
  });

  test('pause then resume preserves accumulated time', () {
    _tickAsync((accumulator, tick) async {
      accumulator.start();
      tick(const Duration(milliseconds: 500));
      accumulator
        ..pause()
        ..resume();
      tick(const Duration(milliseconds: 100));
      final total = accumulator.snapshotAndReset(keepRunning: false);
      expect(total.inMilliseconds, greaterThanOrEqualTo(600));
    });
  });
}
