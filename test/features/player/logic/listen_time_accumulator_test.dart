import 'package:flutter_test/flutter_test.dart';
import 'package:storii/features/player/logic/listen_time_accumulator.dart';

void main() {
  late ListenTimeAccumulator accumulator;

  setUp(() => accumulator = ListenTimeAccumulator());

  test('start is idempotent', () async {
    accumulator.start();
    await Future.delayed(const Duration(milliseconds: 100));
    accumulator.start();
    await Future.delayed(const Duration(milliseconds: 100));
    final total = accumulator.snapshotAndReset(keepRunning: false);
    expect(total.inMilliseconds, greaterThanOrEqualTo(200));
  });

  test('pause accumulates elapsed time', () async {
    accumulator.start();
    await Future.delayed(const Duration(milliseconds: 200));
    accumulator.pause();
    final total = accumulator.snapshotAndReset(keepRunning: false);
    expect(total.inMilliseconds, greaterThanOrEqualTo(200));
  });

  test('snapshotAndReset with keepRunning resets start time to now', () async {
    accumulator.start();
    await Future.delayed(const Duration(milliseconds: 200));
    accumulator.snapshotAndReset(keepRunning: true);
    final second = accumulator.snapshotAndReset(keepRunning: false);
    expect(second.inMilliseconds, lessThan(50));
  });

  test('rollback restores time for next snapshot', () async {
    accumulator.start();
    await Future.delayed(const Duration(milliseconds: 200));
    final snapshot = accumulator.snapshotAndReset(keepRunning: false);
    accumulator.rollback(snapshot);
    final total = accumulator.snapshotAndReset(keepRunning: false);
    expect(total.inMilliseconds, greaterThanOrEqualTo(200));
  });

  test('reset clears everything', () async {
    accumulator.start();
    await Future.delayed(const Duration(milliseconds: 200));
    accumulator.reset();
    final total = accumulator.snapshotAndReset(keepRunning: false);
    expect(total, Duration.zero);
    expect(accumulator.isRunning, false);
  });
}
