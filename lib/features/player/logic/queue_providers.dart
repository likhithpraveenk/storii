import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/models/queue_state.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/local/queue_store.dart';

part 'queue_providers.g.dart';

@Riverpod(keepAlive: true)
class QueueNotifier extends _$QueueNotifier {
  QueueStore get _store => ref.read(queueStoreProvider.notifier);

  @override
  QueueState build() => _store.get();

  void _persist() => unawaited(_store.save(state));

  void _addItem(QueueItem item) {
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

  Future<void> addToQueue({required String itemId, String? episodeId}) async {
    final index = state.items.indexWhere(
      (e) => e.itemId == itemId && e.episodeId == episodeId,
    );
    if (index == -1) {
      final item = await ref.read(itemDetailProvider(itemId).future);
      final episode = item.isPodcast
          ? item.episodes.firstWhereOrNull((e) => e.id == episodeId)
          : null;
      _addItem(
        QueueItem(
          itemId: itemId,
          episodeId: episodeId,
          libraryItem: item,
          episode: episode,
        ),
      );
    }
  }

  Future<void> play({
    required String itemId,
    String? episodeId,
    Duration? initialPosition,
    BookChapter? chapter,
  }) async {
    state = const QueueState();
    await addToQueue(itemId: itemId, episodeId: episodeId);
    await playFromIndex(0, initialPosition: initialPosition, chapter: chapter);
  }

  Future<void> playMany(List<QueueItem> items) async {
    if (items.isEmpty) return;
    state = QueueState(items: items);
    _persist();
    await playFromIndex(0);
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

  Future<void> clear({bool removeCurrentPlaying = true}) async {
    if (removeCurrentPlaying) {
      state = const QueueState();
      await _store.clear();
    } else {
      final current = state.currentIndex;
      if (current != null && current < state.items.length) {
        final currentItem = state.items[current];
        state = QueueState(items: [currentItem], currentIndex: 0);
        _persist();
      }
    }
  }

  Future<void> onPlaybackComplete() async {
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

extension QueueItemX1 on Iterable<LibraryItem> {
  List<QueueItem> toQueueItems() =>
      map((i) => QueueItem(itemId: i.id, libraryItem: i)).toList();
}

extension QueueItemX2 on Iterable<PlaylistItem> {
  List<QueueItem> toQueueItems() => map(
    (i) => QueueItem(
      itemId: i.libraryItemId,
      episodeId: i.episodeId,
      libraryItem: i.libraryItem,
      episode: i.episode,
    ),
  ).toList();
}
