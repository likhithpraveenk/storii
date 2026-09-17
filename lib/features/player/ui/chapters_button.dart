import 'package:abs_api/abs_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/chapter.dart';
import 'package:storii/features/item/ui/chapter_list.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_extensions.dart';

extension on Chapter {
  BookChapter toBookChapter() =>
      BookChapter(id: index, start: start, end: end, title: title);
}

class ChaptersActionButton extends ConsumerWidget {
  const new({super.key, required this.session, required this.inOverflow});

  final PlaybackSession session;
  final bool inOverflow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chapters = ref.watch(chapterListProvider);
    void openSheet() => showChapterListSheet(
      context,
      chapters: chapters.map((c) => c.toBookChapter()).toList(),
      itemId: session.libraryItemId,
      itemTitle: session.displayTitle ?? l10n.noTitle,
    );

    if (inOverflow) {
      return ListTile(
        title: Text(l10n.chapters),
        leading: const Icon(Icons.list_rounded),
        trailing: Text('${chapters.length}'),
        onTap: session.isPodcastEpisode ? null : openSheet,
      );
    }

    return IconButton(
      icon: const Icon(Icons.list_rounded),
      tooltip: l10n.chapters,
      onPressed: session.isPodcastEpisode ? null : openSheet,
    );
  }
}
