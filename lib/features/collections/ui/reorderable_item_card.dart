import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/features/item/logic/user_progress_actions.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class ReorderableItemCard extends ConsumerWidget {
  const new({
    required this.itemId,
    required this.index,
    required this.title,
    required this.subtitle,
    this.inCollection = true,
    this.onRemove,
    this.episodeId,
    super.key,
  });

  final String itemId;
  final String? episodeId;
  final String title;
  final String subtitle;
  final int index;
  final bool inCollection;
  final Future<void> Function()? onRemove;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final mediaProgress = ref
        .watch(mediaProgressFromMapProvider(itemId, episodeId))
        .value;
    final isFinished =
        mediaProgress?.isFinished == true || mediaProgress?.progress == 1.0;

    return InkWell(
      borderRadius: .circular(kRadius),
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: () => context.push(AppRoute.itemDetail.path, extra: itemId),
      onLongPress: () {
        AppBottomSheet.show(
          context,
          title: l10n.more,
          body: Column(
            children: [
              ListTile(
                title: Text(
                  inCollection
                      ? l10n.removeFromCollection
                      : l10n.removeFromPlaylist,
                ),
                leading: const Icon(Icons.cancel_outlined),
                onTap: () async {
                  await onRemove?.call();
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
              ),
              const SizedBox(height: 48),
            ],
          ),
        );
      },
      child: Padding(
        padding: const .symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            SizedBox.square(
              dimension: 100,
              child: ImageWidget(id: itemId, type: .item),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    title,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: .w600,
                      color: scheme.onSurface,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: textTheme.bodyMedium?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            IconButton(
              tooltip: isFinished ? l10n.markAsIncomplete : l10n.markAsComplete,
              onPressed: () => AppBottomSheet.show(
                context,
                title: isFinished ? l10n.markAsIncomplete : l10n.markAsComplete,
                actionLabel: l10n.confirm,
                onTap: () async {
                  await ref
                      .read(
                        userProgressActionsProvider(itemId, episodeId).notifier,
                      )
                      .markComplete(isFinished: !isFinished);
                },
              ),
              icon: Icon(
                isFinished ? Icons.beenhere : Icons.beenhere_outlined,
                color: isFinished ? scheme.primary : null,
              ),
              visualDensity: .compact,
            ),
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
    );
  }
}
