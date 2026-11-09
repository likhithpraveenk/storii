import 'dart:async';

import 'package:storii/app/logs/log_service.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/storage/local/downloads_store.dart';

typedef DownloadStartGate = Future<bool> Function(DownloadItem? item);

class DownloadQueueProcessor {
  new({
    required this.readKeys,
    required this.store,
    required this.canStart,
    required this.runItem,
    required this.maxConcurrent,
  });

  final List<String> Function() readKeys;
  final DownloadsStore store;
  final DownloadStartGate canStart;
  final Future<void> Function(String key) runItem;
  final int Function() maxConcurrent;

  final Map<String, Future<void>> _active = {};
  Completer<void>? _processing;
  Completer<void>? _wake;

  void kick() {
    if (_processing == null) {
      unawaited(process());
      return;
    }
    final w = _wake;
    if (w != null && !w.isCompleted) w.complete();
  }

  Future<void> waitForKey(String key) async {
    final f = _active[key];
    if (f != null) await f;
  }

  bool isRunning(String key) => _active.containsKey(key);

  bool get isProcessing => _processing != null;

  Future<void> process() async {
    if (_processing != null) return;
    final completer = Completer<void>();
    _processing = completer;
    try {
      while (true) {
        final wake = _wake = Completer<void>();
        final keys = List<String>.from(readKeys());
        if (keys.isEmpty && _active.isEmpty) break;

        for (final key in keys) {
          if (_active.length >= maxConcurrent()) break;
          if (_active.containsKey(key)) continue;
          if (!await canStart(store.get(key))) break;
          if (!readKeys().contains(key)) continue;
          _active[key] = _processItem(key);
        }

        if (_active.isEmpty) break;

        await Future.any([..._active.values, wake.future]);
      }
    } finally {
      _wake = null;
      completer.complete();
      if (identical(_processing, completer)) _processing = null;
    }
  }

  Future<void> _processItem(String key) async {
    try {
      await runItem(key);
    } finally {
      await _ensureTerminal(key);
      // must not await its own future
      unawaited(_active.remove(key));
    }
  }

  Future<void> _ensureTerminal(String key) async {
    final item = store.get(key);
    if (item == null || !item.isActive) return;
    LogService.log(
      'Download $key ended without a terminal status, marking it failed',
      source: 'DownloadQueueProcessor',
      level: .warning,
    );
    await store.save(item.copyWith(status: .failed));
  }

  Future<void> waitForIdle() async {
    final running = _processing;
    await running?.future;
  }
}
