import 'dart:async';

import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/storage/local/downloads_store.dart';

const _persistenceInterval = Duration(milliseconds: 250);

class ThrottledPersister {
  ThrottledPersister({required this.store, required this.onPersist});

  final DownloadsStore store;
  final Future<void> Function(DownloadItem) onPersist;

  DownloadItem? _pending;
  Timer? _timer;
  DateTime _lastPersist = DateTime.now();
  Completer<void>? _inFlight;

  Future<void> update(DownloadItem item) async {
    _pending = item;
    final terminal = item.status == .paused || item.isComplete || item.isFailed;
    if (terminal) {
      _timer?.cancel();
      _timer = null;
      await _flush();
    } else if (_timer == null) {
      final since = DateTime.now().difference(_lastPersist);
      _timer = Timer(_persistenceInterval - since, _onTimer);
    }
  }

  Future<void> flush() async {
    _timer?.cancel();
    _timer = null;
    await _flush();
  }

  void _onTimer() {
    _timer = null;
    unawaited(_flush());
  }

  Future<void> _flush() async {
    final item = _pending;
    if (item == null) return;
    final previous = _inFlight;
    final completer = Completer<void>();
    _inFlight = completer;
    try {
      await previous?.future;
    } on Object {
      // Previous flush failure is non-fatal; continue
    }
    _pending = null;
    _timer?.cancel();
    _timer = null;
    _lastPersist = DateTime.now();
    await store.save(item);
    await onPersist(item);
    completer.complete();
  }
}
