import 'dart:async';

import 'package:storii/app/logs/log_service.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/storage/local/downloads_store.dart';

const _persistenceInterval = Duration(milliseconds: 250);

class ThrottledPersister {
  new({required this.store, required this.onPersist, DateTime Function()? now})
    : _now = now ?? DateTime.now;

  final DownloadsStore store;
  final Future<void> Function(DownloadItem) onPersist;
  final DateTime Function() _now;

  DownloadItem? _pending;
  Timer? _timer;
  DateTime? _lastPersist;
  Completer<void>? _inFlight;
  bool _terminalSeen = false;

  Future<void> update(DownloadItem item) async {
    final terminal = item.status == .paused || item.isComplete || item.isFailed;
    if (_terminalSeen && !terminal) return;
    _pending = item;
    if (terminal) {
      _terminalSeen = true;
      _timer?.cancel();
      _timer = null;
      await _flush();
    } else if (_timer == null) {
      final since = _now().difference(_lastPersist ?? _now());
      final remaining = _persistenceInterval - since;
      _timer = Timer(
        remaining.isNegative ? Duration.zero : remaining,
        _onTimer,
      );
    }
  }

  Future<void> flush() async {
    _timer?.cancel();
    _timer = null;
    await _flush();
    await _inFlight?.future;
  }

  void _onTimer() {
    _timer = null;
    unawaited(
      _flush().catchError((Object e, StackTrace st) {
        LogService.log(
          'Could not persist download state: $e',
          source: 'ThrottledPersister',
          level: .error,
          originalError: e,
          stackTrace: st,
        );
      }),
    );
  }

  Future<void> _flush() async {
    final previous = _inFlight;
    final completer = Completer<void>();
    _inFlight = completer;

    try {
      await previous?.future;

      final item = _pending;
      if (item == null) return;

      await store.save(item);
      await onPersist(item);

      if (identical(_pending, item)) {
        _pending = null;
      }
      _lastPersist = _now();
    } finally {
      completer.complete();
      if (identical(_inFlight, completer)) {
        _inFlight = null;
      }
    }
  }
}
