import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/models/queue_state.dart';
import 'package:storii/storage/local/queue_store.dart';

part 'queue_providers.g.dart';

@Riverpod(keepAlive: true)
class QueueNotifier extends _$QueueNotifier {
  QueueStore get _store => ref.read(queueStoreProvider.notifier);

  @override
  QueueState build() => _store.get();

  void _persist() => unawaited(_store.save(state));

  void addItem(QueueItem item) {
    state = state.copyWith(items: [...state.items, item]);
    _persist();
  }

  void removeAt(int index) {
    if (index < 0 || index >= state.items.length) return;
    final items = [...state.items]..removeAt(index);
    final current = state.currentIndex;
    final newCurrent = current != null && current > index
        ? current - 1
        : current;
    state = state.copyWith(items: items, currentIndex: newCurrent);
    _persist();
  }

  void reorder(int oldIndex, int newIndex) {
    if (oldIndex < 0 ||
        oldIndex >= state.items.length ||
        newIndex < 0 ||
        newIndex >= state.items.length ||
        oldIndex == newIndex) {
      return;
    }
    final items = [...state.items];
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);

    final current = state.currentIndex;
    int? newCurrent = current;
    if (current == null) {
      // nothing playing
    } else if (current == oldIndex) {
      newCurrent = newIndex;
    } else if (oldIndex < newIndex) {
      // items between oldIndex+1 and newIndex shifted up by one
      if (current > oldIndex && current <= newIndex) {
        newCurrent = current - 1;
      }
    } else {
      // items between newIndex and oldIndex-1 shifted down by one
      if (current >= newIndex && current < oldIndex) {
        newCurrent = current + 1;
      }
    }

    state = state.copyWith(items: items, currentIndex: newCurrent);
    _persist();
  }

  Future<void> play({
    required String itemId,
    String? episodeId,
    Duration? initialPosition,
    BookChapter? chapter,
  }) async {
    var index = state.items.indexWhere(
      (e) => e.itemId == itemId && e.episodeId == episodeId,
    );
    if (index == -1) {
      addItem(QueueItem(itemId: itemId, episodeId: episodeId));
      index = state.items.length - 1;
    }
    await playFromIndex(
      index,
      initialPosition: initialPosition,
      chapter: chapter,
    );
  }

  Future<void> playFromIndex(
    int index, {
    Duration? initialPosition,
    BookChapter? chapter,
  }) async {
    if (index < 0 || index >= state.items.length) return;
    final item = state.items.elementAt(index);
    state = state.copyWith(currentIndex: index);
    _persist();
    await ref
        .read(audioPlayerProvider.notifier)
        .play(
          itemId: item.itemId,
          episodeId: item.episodeId,
          chapter: chapter,
          initialPosition: initialPosition,
        );
  }

  Future<void> clear() async {
    state = const QueueState();
    await _store.clear();
  }

  Future<void> onPlaybackComplete() async {
    final autoplay = ref.read(autoplayProvider);
    if (!autoplay) return;
    final current = state.currentIndex;
    if (current == null || current + 1 >= state.items.length) return;
    await playFromIndex(current + 1);
  }
}

@riverpod
int queueCount(Ref ref) => ref.watch(queueProvider).items.length;

@riverpod
void queueController(Ref ref) {
  ref.listen(audioHandlerEventsProvider, (_, next) {
    if (next.value == .stop) {
      unawaited(ref.read(queueProvider.notifier).clear());
    } else if (next.value == .complete) {
      unawaited(ref.read(queueProvider.notifier).onPlaybackComplete());
    }
  });
}
