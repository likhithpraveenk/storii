import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/stack_badge.dart';

class LibraryItemCard extends ConsumerWidget {
  const LibraryItemCard(this.item, {super.key});
  final ItemDomain item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sequence = item is Audiobook
        ? (item as Audiobook).seriesSequence
        : null;
    final scheme = Theme.of(context).colorScheme;
    final stackTitle = ref.watch(stackTitleOnImageProvider);
    final showTitle = ref.watch(showTitleForItemProvider);

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
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: stackTitle && showTitle
                          ? TitleWidget(item: item, inStack: true)
                          : const SizedBox.shrink(),
                    ),
                    if (item.progress > 0)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 3,
                          child: LinearProgressIndicator(
                            value: item.progress,
                            borderRadius: AppStyles.circularRadius,
                            backgroundColor: scheme.surface.withValues(
                              alpha: 0.2,
                            ),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              item.isFinished ? AppColors.green : AppColors.red,
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
              TitleWidget(item: item)
            else
              const SizedBox.shrink(),
          ],
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: AppStyles.circularRadius,
              onTap: () => context.push(AppRoute.libraryItem.withId(item.id)),
            ),
          ),
        ),
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.item, this.inStack = false});

  final ItemDomain item;
  final bool inStack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: !inStack ? const .only(top: 8) : const .all(8),
      decoration: inStack
          ? BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.6),
                  Colors.black.withValues(alpha: 0.8),
                ],
              ),
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
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: .bold,
              color: theme.brightness == .light
                  ? theme.colorScheme.onInverseSurface
                  : theme.colorScheme.onSurface,
            ),
          ),
          Text(
            item.authorName ?? AppLocalizations.of(context)!.noAuthor,
            maxLines: 1,
            overflow: .ellipsis,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: theme.brightness == .light
                  ? theme.colorScheme.onInverseSurface
                  : theme.colorScheme.onSurface,
            ),
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
      onTap: () => context.push(AppRoute.libraryItem.withId(item.id)),
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
