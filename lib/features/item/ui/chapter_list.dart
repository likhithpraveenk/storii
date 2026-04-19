import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_dialog.dart';
import 'package:storii/shared/widgets/pulsing_dot.dart';

void showChapterListSheet(
  BuildContext context, {
  required List<BookChapter> chapters,
  required String itemId,
  required String itemTitle,
}) {
  showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: .vertical(top: .circular(24)),
    ),
    builder: (_) => SafeArea(
      child: DecoratedBox(
        decoration: bottomSheetDecoration(context),
        child: Column(
          mainAxisSize: .min,
          children: [
            Padding(
              padding: const .fromLTRB(24, 24, 24, 16),
              child: Text(
                AppLocalizations.of(context)!.chapters,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 20,
                  fontWeight: .w600,
                  letterSpacing: -0.3,
                ),
                textAlign: .center,
              ),
            ),
            Expanded(
              child: ChapterList(
                chapters: chapters,
                itemId: itemId,
                itemTitle: itemTitle,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class ChapterList extends ConsumerStatefulWidget {
  const ChapterList({
    super.key,
    required this.chapters,
    required this.itemId,
    required this.itemTitle,
  });
  final List<BookChapter> chapters;
  final String itemId;
  final String itemTitle;

  @override
  ConsumerState<ChapterList> createState() => _ChapterListState();
}

class _ChapterListState extends ConsumerState<ChapterList> {
  static const _tileHeight = 70.0; // rough estimate
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToActive());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _scrollToActive() {
    final current = ref.read(currentChapterProvider).value;
    if (current == null) return;

    final index = widget.chapters.indexWhere((c) => c.start == current.start);
    if (index < 0) return;

    final offset = index * _tileHeight;
    final viewportHeight = controller.position.viewportDimension;
    final centeredOffset = offset - (viewportHeight / 2) + (_tileHeight / 2);

    controller.animateTo(
      centeredOffset.clamp(0.0, controller.position.maxScrollExtent),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const .only(bottom: 36),
      controller: controller,
      itemCount: widget.chapters.length,
      itemBuilder: (context, index) => _ChapterTile(
        index,
        chapter: widget.chapters.elementAt(index),
        noOfChapters: widget.chapters.length,
        itemId: widget.itemId,
        itemTitle: widget.itemTitle,
      ),
    );
  }
}

class _ChapterTile extends ConsumerWidget {
  const _ChapterTile(
    this.index, {
    required this.chapter,
    required this.noOfChapters,
    required this.itemId,
    required this.itemTitle,
  });

  final BookChapter chapter;
  final int index;
  final int noOfChapters;
  final String itemId;
  final String itemTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    final isCurrentItemPlaying =
        session != null && session.libraryItemId == itemId;
    final currentChapter = ref.watch(currentChapterProvider).value;

    final isActive =
        isCurrentItemPlaying && currentChapter?.start == chapter.start;
    final isCompleted =
        isCurrentItemPlaying &&
        currentChapter != null &&
        chapter.start < currentChapter.start;
    final chapterDuration = chapter.end - chapter.start;

    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final completedColor = scheme.primary.withValues(alpha: 0.12);
    final activeColor = scheme.primary.withValues(alpha: 0.1);
    final l = AppLocalizations.of(context)!;

    return InkWell(
      borderRadius: .circular(kRadius),
      onTap: () async {
        if (isCurrentItemPlaying) {
          await audioHandler.skipToQueueItem(index);
        } else {
          await AppDialog.show(
            context,
            title: l.startPlayback,
            body: Row(
              children: [
                Flexible(child: Text(itemTitle)),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward, size: 12),
                const SizedBox(width: 8),
                Text(chapter.start.toTime()),
              ],
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        margin: const .symmetric(horizontal: 4, vertical: 2),
        padding: const .symmetric(horizontal: 4, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? activeColor
              : isCompleted
              ? completedColor
              : null,
          borderRadius: .circular(kRadius),
          border: isActive
              ? Border.all(
                  color: scheme.primary.withValues(alpha: 0.3),
                  width: 1,
                )
              : null,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 48,
              child: Center(
                child: isActive
                    ? const PulsingDot(size: 8)
                    : Text(
                        (index + 1).toString().padLeft(2, '0'),
                        style: textTheme.labelSmall?.copyWith(
                          color: scheme.onSurfaceVariant.withValues(alpha: 0.5),
                        ),
                      ),
              ),
            ),
            SizedBox(
              width: 2,
              height: 48,
              child: VerticalDivider(
                width: 2,
                thickness: 2,
                color: isCompleted || isActive
                    ? scheme.primary.withValues(alpha: 0.3)
                    : scheme.outlineVariant.withValues(alpha: 0.3),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                children: [
                  Text(
                    chapter.title,
                    maxLines: 2,
                    overflow: .ellipsis,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: .w500,
                      color: isCompleted
                          ? scheme.onSurface.withValues(alpha: 0.5)
                          : isActive
                          ? scheme.primary
                          : null,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    chapterDuration.toReadableDuration(context),
                    style: textTheme.bodySmall?.copyWith(
                      color: scheme.onSurfaceVariant.withValues(
                        alpha: isCompleted ? 0.5 : 0.8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const .symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: isActive
                    ? scheme.primary.withValues(alpha: 0.1)
                    : scheme.surfaceContainerHighest.withValues(alpha: 0.6),
                borderRadius: .circular(20),
              ),
              child: Text(
                chapter.start.toTime(),
                style: textTheme.labelSmall?.copyWith(
                  color: isActive ? scheme.primary : scheme.onSurfaceVariant,
                  fontWeight: isActive ? .w600 : .w400,
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
