import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/features/player/logic/queue_providers.dart';
import 'package:storii/features/player/models/queue_state.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/widgets/marquee_text.dart';

class QueueTile extends ConsumerWidget {
  const new({
    required super.key,
    required this.item,
    required this.index,
    required this.isCurrent,
  });

  final QueueItem item;
  final int index;
  final bool isCurrent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final title =
        (item.episode != null
            ? item.episode?.title
            : item.libraryItem?.title) ??
        l10n.noTitle;

    final subtitle = item.episode != null
        ? item.libraryItem?.title ?? l10n.noTitle
        : item.libraryItem?.authorName ?? l10n.noAuthor;

    final tile = InkWell(
      onTap: isCurrent
          ? null
          : () => ref.read(queueProvider.notifier).playFromIndex(index),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isCurrent
              ? scheme.primaryContainer.withValues(alpha: 0.3)
              : null,
        ),
        child: Padding(
          padding: const .symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              SizedBox.square(
                dimension: imgSizeInMiniPlayer,
                child: ClipRRect(
                  borderRadius: .circular(4),
                  child: ImageWidget(id: item.itemId, type: .item),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .start,
                  children: [
                    MarqueeText(
                      title,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: isCurrent
                            ? FontWeight.w600
                            : FontWeight.normal,
                        color: scheme.onSurface,
                      ),
                    ),
                    MarqueeText(
                      subtitle,
                      style: textTheme.bodyMedium?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              ReorderableDragStartListener(
                index: index,
                child: Padding(
                  padding: const .symmetric(horizontal: 6, vertical: 12),
                  child: Icon(
                    Icons.drag_indicator_rounded,
                    color: scheme.onSurfaceVariant.withValues(alpha: 0.6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (isCurrent) return tile;
    return Dismissible(
      key: ValueKey(mediaItemIdKey(item.itemId, item.episodeId)),
      direction: .startToEnd,
      background: Container(
        color: scheme.error,
        alignment: Alignment.centerLeft,
        padding: const .symmetric(horizontal: 24),
        child: Icon(Icons.delete_outline, color: scheme.onError),
      ),
      onDismissed: (_) {
        ref.read(queueProvider.notifier).removeAt(index);
      },
      child: tile,
    );
  }
}
