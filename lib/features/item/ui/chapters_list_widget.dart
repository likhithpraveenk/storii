import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/features/item/logic/progress_notifier.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/pulsing_dot.dart';

class ChaptersListWidget extends ConsumerStatefulWidget {
  final LibraryItem item;

  const ChaptersListWidget(this.item, {super.key});

  @override
  ConsumerState<ChaptersListWidget> createState() => _ChaptersListWidgetState();
}

class _ChaptersListWidgetState extends ConsumerState<ChaptersListWidget> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    if (widget.item.chapters.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final l = AppLocalizations.of(context)!;

    final currentChapter = ref.watch(currentChapterProvider).value;
    final progress = ref.watch(mediaProgressProvider(widget.item.id)).value;

    final startChapterIndex = _chapterIndexFor(
      progress?.currentTime,
      widget.item.chapters,
    );

    return Column(
      children: [
        InkWell(
          borderRadius: kBorderRadius,
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

                    final isCurrentChapterPlaying =
                        currentChapter?.start == chapter.start;

                    final duration = chapter.end - chapter.start;
                    final (hours, minutes) = duration.toReadableDuration();

                    return ListTile(
                      leading: isCurrentChapterPlaying
                          ? const PulsingDot()
                          : index == startChapterIndex && currentChapter == null
                          ? PulsingDot(color: theme.colorScheme.tertiary)
                          : null,
                      title: Text(
                        chapter.title,
                        maxLines: 1,
                        overflow: .ellipsis,
                        style: theme.textTheme.titleSmall,
                      ),
                      trailing: Text(
                        chapter.start.toTimestamp(),
                        style: theme.textTheme.labelMedium,
                      ),
                      subtitle: Text(
                        l.readableDuration(hours, minutes),
                        style: theme.textTheme.bodySmall,
                      ),
                      onTap: () async {
                        final session = ref.read(sessionProvider);
                        if (session != null &&
                            session.libraryItemId == widget.item.id) {
                          await audioHandler.skipToQueueItem(index);
                        } else {
                          final startSession = await AppBottomSheet.show(
                            context,
                            title: 'Start ${widget.item}',
                            confirmLabel: l.confirm,
                          );
                          if (startSession == true) {
                            await ref
                                .read(audioPlayerProvider.notifier)
                                .play(widget.item.id);
                            await audioHandler.skipToQueueItem(index);
                          }
                        }
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}

int _chapterIndexFor(Duration? position, List<BookChapter> chapters) {
  if (position == null) {
    return -1;
  }
  var low = 0;
  var high = chapters.length - 1;
  while (low <= high) {
    final mid = (low + high) ~/ 2;
    if (chapters[mid].start <= position) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }
  return high;
}
