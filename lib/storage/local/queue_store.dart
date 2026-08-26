import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/models/queue_state.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'queue_store.g.dart';

@Riverpod(keepAlive: true)
class QueueStore extends _$QueueStore {
  String? _userId;

  String get _queueKey => '$_userId:current_queue';

  @override
  void build() {
    _userId = ref.watch(currentUserProvider)?.id;
  }

  Future<void> save(QueueState queue) async {
    await playbackQueueBox.put(_queueKey, jsonEncode(queue.toJson()));
  }

  QueueState get() {
    final raw = playbackQueueBox.get(_queueKey);
    if (raw == null) return const QueueState();
    try {
      return QueueState.fromJson(jsonDecode(raw));
    } catch (_) {
      return const QueueState();
    }
  }

  Future<void> clear() async {
    await playbackQueueBox.delete(_queueKey);
  }
}
