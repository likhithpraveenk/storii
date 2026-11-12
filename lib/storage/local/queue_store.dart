import 'dart:convert';

import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/models/queue_state.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'queue_store.g.dart';

class QueueStore {
  const new({this._userId});

  final String? _userId;

  String get _queueKey => '$_userId:current_queue';

  Box<String> get _box => Hive.box(playbackQueueBoxName);

  Future<void> save(QueueState queue) async {
    if (queue.items.isEmpty && queue.current == null) {
      await _box.clear();
    } else {
      await _box.put(_queueKey, jsonEncode(queue.toJson()));
    }
  }

  QueueState get() {
    final raw = _box.get(_queueKey);
    if (raw == null) return const QueueState();
    try {
      return QueueState.fromJson(jsonDecode(raw));
    } catch (_) {
      return const QueueState();
    }
  }

  Future<void> clear() async {
    await _box.delete(_queueKey);
  }
}

@riverpod
QueueStore queueStore(Ref ref) {
  final user = ref.watch(currentUserProvider);
  return QueueStore(userId: user?.id);
}
