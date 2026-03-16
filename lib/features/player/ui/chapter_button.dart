import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/pulsing_dot.dart';

class ChapterButton extends StatelessWidget {
  const ChapterButton(this.chapters, {super.key});

  final List<BookChapter> chapters;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.list),
      onPressed: () => showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (_) => _ChapterSheet(chapters),
      ),
    );
  }
}

class _ChapterSheet extends ConsumerWidget {
  const _ChapterSheet(this.chapters);

  final List<BookChapter> chapters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      expand: false,
      builder: (_, controller) => ListView.builder(
        padding: const .fromLTRB(4, 0, 4, 36),
        controller: controller,
        itemCount: chapters.length,
        itemBuilder: (_, i) => _ChapterTile(i, chapter: chapters[i]),
      ),
    );
  }
}

class _ChapterTile extends ConsumerWidget {
  const _ChapterTile(this.index, {required this.chapter});
  final BookChapter chapter;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final current = ref.watch(currentChapterProvider).value;
    final isActive = current?.start == chapter.start;

    final chapterDuration = chapter.end - chapter.start;

    return InkWell(
      borderRadius: .circular(kRadius),
      onTap: () async {
        if (!isActive) {
          await audioHandler.skipToQueueItem(index);
        }
      },
      child: Container(
        padding: const .symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isActive
              ? theme.colorScheme.primaryContainer.withValues(alpha: 0.08)
              : null,
          borderRadius: .circular(kRadius),
        ),
        child: Row(
          children: [
            Container(
              alignment: .center,
              width: 40,
              child: isActive
                  ? const PulsingDot(size: 8)
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
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: .w500,
                    ),
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
            const SizedBox(width: 12),
            Text(
              chapter.start.toTime(),
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}
