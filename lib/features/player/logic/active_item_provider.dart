import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/features/player/logic/audio_providers.dart';

part 'active_item_provider.g.dart';

@riverpod
Future<LibraryItem?> activeItem(Ref ref) async {
  final id = ref.watch(activeItemIdProvider);
  if (id == null) return null;

  final item = await ref.watch(itemDetailProvider(id).future);
  return item;
}

@riverpod
BookChapter? currentChapter(Ref ref) {
  final book = ref.watch(activeItemProvider).value;
  final playbackState = ref.watch(playbackStateProvider).value;

  if (book == null || playbackState == null) return null;

  final index = playbackState.queueIndex ?? 0;

  if (index >= 0 && index < book.chapters.length) {
    return book.chapters[index];
  }
  return null;
}
