import 'dart:async';

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
                  child: Text(
                    l.chapters,
                    style: theme.textTheme.labelLarge?.copyWith(fontSize: 20),
                  ),
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
                    return ChapterTile(
                      index: index,
                      itemId: widget.item.id,
                      chapter: chapter,
                      bookTitle: widget.item.title,
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class ChapterTile extends ConsumerWidget {
  const ChapterTile({
    super.key,
    required this.index,
    required this.itemId,
    required this.chapter,
    this.bookTitle,
  });

  final int index;
  final String itemId;
  final String? bookTitle;
  final BookChapter chapter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final session = ref.watch(sessionProvider);
    final currentChapter = ref.watch(currentChapterProvider).value;

    final isCurrentItemPlaying =
        session != null && session.libraryItemId == itemId;

    final isCurrentChapterPlaying =
        isCurrentItemPlaying && currentChapter?.start == chapter.start;

    final chapterDuration = chapter.end - chapter.start;

    return InkWell(
      borderRadius: .circular(kRadius),
      onTap: () async {
        if (isCurrentItemPlaying) {
          await audioHandler.skipToQueueItem(index);
          //! TODO: fix precision for chapter duration
        } else {
          await AppBottomSheet.show(
            context,
            title: l.startPlayback,
            body: Padding(
              padding: const .symmetric(horizontal: 24),
              child: Row(
                children: [
                  Flexible(child: Text(bookTitle ?? l.noTitle)),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, size: 12),
                  const SizedBox(width: 8),
                  Text(chapter.start.toTime()),
                ],
              ),
            ),
            actionLabel: l.confirm,
            onTap: () async {
              unawaited(
                ref
                    .read(audioPlayerProvider.notifier)
                    .play(itemId: itemId, chapter: chapter),
              );
            },
          );
        }
      },
      child: Container(
        padding: const .symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isCurrentChapterPlaying
              ? theme.colorScheme.primaryContainer.withValues(alpha: 0.08)
              : null,
          borderRadius: .circular(kRadius),
        ),
        child: Row(
          crossAxisAlignment: .start,
          children: [
            Container(
              alignment: .center,
              width: 40,
              child: isCurrentChapterPlaying
                  ? const PulsingDot()
                  : Text(
                      (index + 1).toString().padLeft(2, '0'),
                      style: theme.textTheme.labelSmall,
                    ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                children: [
                  Text(
                    chapter.title,
                    maxLines: 2,
                    overflow: .ellipsis,
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    chapterDuration.toReadableDuration(context),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const .symmetric(horizontal: 12),
              child: Text(
                chapter.start.toTime(),
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
