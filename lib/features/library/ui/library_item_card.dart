import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/stack_badge.dart';

class LibraryItemCard extends ConsumerWidget {
  const LibraryItemCard(
    this.item, {
    super.key,
    this.showAuthor = true,
    this.showTitle = true,
    this.stackTitle = false,
  });
  final ItemDomain item;
  final bool showAuthor;
  final bool showTitle;
  final bool stackTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sequence = item is Audiobook
        ? (item as Audiobook).seriesSequence
        : null;
    final scheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: AppStyles.circularRadius,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ImageWidget(
                      id: item.id,
                      type: .item,
                      updatedAt: item.updatedAt,
                    ),
                    if (stackTitle && showTitle)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: TitleWidget(
                          item: item,
                          showAuthor: true,
                          inStack: true,
                        ),
                      ),
                    if (item.progress > 0)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 6,
                          child: LinearProgressIndicator(
                            value: item.progress,
                            borderRadius: AppStyles.circularRadius,
                            backgroundColor: scheme.surface.withValues(
                              alpha: 0.2,
                            ),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              item.isFinished ? scheme.primary : scheme.error,
                            ),
                          ),
                        ),
                      ),
                    if (sequence != null)
                      Positioned(
                        top: 4,
                        right: 4,
                        child: StackBadge('#$sequence'),
                      ),
                  ],
                ),
              ),
            ),
            if (!stackTitle && showTitle)
              TitleWidget(item: item, showAuthor: showAuthor),
          ],
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: AppStyles.circularRadius,
              onTap: () => context.push(AppRoute.item.withId(item.id)),
            ),
          ),
        ),
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.item,
    required this.showAuthor,
    this.inStack = false,
  });

  final ItemDomain item;
  final bool showAuthor;
  final bool inStack;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: !inStack ? const .only(top: 8) : const .all(8),
      decoration: inStack
          ? BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.surface.withValues(alpha: 0.0),
                  Theme.of(context).colorScheme.surface.withValues(alpha: 0.8),
                  Theme.of(context).colorScheme.surface.withValues(alpha: 1.0),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            )
          : null,
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Text(
            item.title ?? AppLocalizations.of(context)!.noTitle,
            maxLines: 2,
            overflow: .ellipsis,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: .bold),
          ),
          if (showAuthor)
            Text(
              item.authorName ?? AppLocalizations.of(context)!.noAuthor,
              maxLines: 1,
              overflow: .ellipsis,
              style: Theme.of(context).textTheme.labelSmall,
            ),
        ],
      ),
    );
  }
}

class LibraryItemCardListView extends StatelessWidget {
  const LibraryItemCardListView(this.item, {super.key});
  final ItemDomain item;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return ListTile(
      onTap: () => context.push(AppRoute.item.withId(item.id)),
      shape: AppStyles.roundedRect,
      contentPadding: const .fromLTRB(16, 8, 16, 8),
      leading: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: .circular(4),
          child: ImageWidget(
            id: item.id,
            type: .item,
            updatedAt: item.updatedAt,
          ),
        ),
      ),
      minVerticalPadding: 0,
      titleAlignment: .center,
      title: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            item.title ?? l.noTitle,
            maxLines: 2,
            overflow: .ellipsis,
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: 2),
          Text(
            item.authorName ?? l.noAuthor,
            maxLines: 1,
            overflow: .ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 2),
          if (item.progress > 0)
            Text(
              l.percentCompleted((item.progress * 100).toStringAsFixed(1)),
              style: theme.textTheme.labelSmall,
            ),
        ],
      ),
    );
  }
}
