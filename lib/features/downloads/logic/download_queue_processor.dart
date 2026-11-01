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
  });

  final List<String> Function() readKeys;
  final void Function(String key) removeKey;
  final DownloadsStore store;
  final DownloadStartGate canStart;
  final Future<void> Function(String key) runItem;

  Completer<void>? _processing;

  bool get isProcessing => _processing != null;

  Future<void> process() async {
    final running = _processing;
    if (running != null) return;

    final completer = Completer<void>();
    _processing = completer;

    try {
      while (readKeys().isNotEmpty) {
        final key = readKeys().first;
        if (!await canStart(store.get(key))) break;
        await runItem(key);
        removeKey(key);
      }
    } finally {
      completer.complete();
      if (identical(_processing, completer)) {
        _processing = null;
      }
    }
  }

  Future<void> waitForIdle() async {
    final running = _processing;
    await running?.future;
  }
}
