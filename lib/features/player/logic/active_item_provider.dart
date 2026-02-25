import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/features/player/logic/audio_providers.dart';

part 'active_item_provider.g.dart';

@riverpod
class ActiveItem extends _$ActiveItem {
  @override
  LibraryItem? build() => null;

  void setActive(LibraryItem? item) {
    state = item;
  }
}

@riverpod
BookChapter? currentChapter(Ref ref) {
  final book = ref.watch(activeItemProvider);
  final playbackState = ref.watch(playbackStateProvider).value;

  if (book == null || playbackState == null) return null;

  final index = playbackState.queueIndex ?? 0;

  if (index >= 0 && index < book.chapters.length) {
    return book.chapters[index];
  }
  return null;
}
