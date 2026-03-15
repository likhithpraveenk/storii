import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/pulsing_dot.dart';

class ChaptersListWidget extends StatefulWidget {
  final LibraryItem item;

  const ChaptersListWidget(this.item, {super.key});

  @override
  State<ChaptersListWidget> createState() => _ChaptersListWidgetState();
}

class _ChaptersListWidgetState extends State<ChaptersListWidget> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    if (widget.item.chapters.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final l = AppLocalizations.of(context)!;

    return Column(
      children: [
        InkWell(
          borderRadius: .circular(kRadius),
          onTap: () => setState(() => _expanded = !_expanded),
          child: Padding(
            padding: const .all(16),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Expanded(
                  child: Text(l.chapters, style: theme.textTheme.titleLarge),
                ),
                Text(
                  '${widget.item.chapters.length}',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontStyle: .italic,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    _expanded ? Icons.unfold_less : Icons.unfold_more,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: !_expanded
              ? const SizedBox.shrink()
              : ListView.builder(
                  shrinkWrap: true,
                  padding: .zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.item.chapters.length,
                  itemBuilder: (context, index) {
                    final chapter = widget.item.chapters[index];
                    return _ChapterTile(
                      index: index,
                      item: widget.item,
                      chapter: chapter,
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class _ChapterTile extends ConsumerWidget {
  const _ChapterTile({
    required this.index,
    required this.item,
    required this.chapter,
  });

  final int index;
  final LibraryItem item;
  final BookChapter chapter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final session = ref.watch(sessionProvider);
    final currentChapter = ref.watch(currentChapterProvider).value;

    final isCurrentItemPlaying =
        session != null && session.libraryItemId == item.id;

    final isCurrentChapterPlaying =
        isCurrentItemPlaying && currentChapter?.start == chapter.start;

    final chapterDuration = chapter.end - chapter.start;

    return ListTile(
      leading: isCurrentChapterPlaying ? const PulsingDot() : null,
      title: Text(
        chapter.title,
        maxLines: 1,
        overflow: .ellipsis,
        style: theme.textTheme.titleSmall,
      ),
      trailing: Text(
        chapter.start.toTime(),
        style: theme.textTheme.labelMedium,
      ),
      subtitle: Text(
        chapterDuration.toReadableDuration(context),
        style: theme.textTheme.bodySmall,
      ),
      onTap: () async {
        if (isCurrentItemPlaying) {
          await audioHandler.skipToQueueItem(index);
        } else {
          final startSession = await AppBottomSheet.show(
            context,
            title: l.startPlayback,
            body: Row(
              children: [
                Expanded(child: Text(item.title ?? l.noTitle)),
                const Icon(Icons.arrow_forward, size: 12),
                const SizedBox(width: 8),
                Text(chapter.start.toTime()),
              ],
            ),
            confirmLabel: l.confirm,
          );
          if (startSession == true) {
            await ref
                .read(audioPlayerProvider.notifier)
                .play(
                  itemId: item.id,
                  initialIndex: index,
                  initialPosition: chapter.start,
                );
          }
        }
      },
    );
  }
}
