import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/abs_api/models/book_chapter.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/extensions.dart';

class ChaptersListWidget extends ConsumerStatefulWidget {
  final List<BookChapter> chapters;

  const ChaptersListWidget(this.chapters, {super.key});

  @override
  ConsumerState<ChaptersListWidget> createState() => _ChaptersListWidgetState();
}

class _ChaptersListWidgetState extends ConsumerState<ChaptersListWidget> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context)!;

    if (widget.chapters.isEmpty) return const SizedBox.shrink();

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
                  '${widget.chapters.length}',
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
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.chapters.length,
                  itemBuilder: (context, index) {
                    final chapter = widget.chapters[index];

                    final duration = chapter.end - chapter.start;
                    final (hours, minutes) = duration.toReadableDuration();

                    return ListTile(
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
                      onTap: () {
                        // TODO: jump to this specific chapter
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
