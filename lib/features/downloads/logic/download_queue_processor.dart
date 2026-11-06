import 'dart:async';

import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/storage/local/downloads_store.dart';

typedef DownloadStartGate = Future<bool> Function(DownloadItem? item);

class DownloadQueueProcessor {
  new({
    required this.readKeys,
    required this.removeKey,
    required this.store,
    required this.canStart,
    required this.runItem,
    required this.maxConcurrent,
  });

  final List<String> Function() readKeys;
  final void Function(String key) removeKey;
  final DownloadsStore store;
  final DownloadStartGate canStart;
  final Future<void> Function(String key) runItem;
  final int Function() maxConcurrent;

  final Map<String, Future<void>> _active = {};
  Completer<void>? _processing;
  Completer<void>? _wake;
  bool _dirty = false;

  void kick() {
    _dirty = true;
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


  bool get isProcessing => _processing != null;
Future<void> process() async {
    if (_processing != null) return;
    final completer = Completer<void>();
    _processing = completer;
    try {
      while (true) {
        _dirty = false;
        final keys = List<String>.from(readKeys());
        if (keys.isEmpty && _active.isEmpty) break;

        for (final key in keys) {
          if (_active.length >= maxConcurrent()) break;
          if (_active.containsKey(key)) continue;
          if (!await canStart(store.get(key))) break;
          if (!readKeys().contains(key)) continue;
          _active[key] = _processItem(key);
        }

        if (_dirty) continue; // kick landed during await
        if (_active.isEmpty) break;

        final wake = _wake = Completer<void>();
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
      removeKey(key);
      await _active.remove(key);
    }
  }

  Future<void> waitForIdle() async {
    final running = _processing;
    await running?.future;
  }
}
