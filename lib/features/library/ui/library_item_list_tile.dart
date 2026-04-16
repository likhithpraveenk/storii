import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/features/downloads/logic/download_notifier.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/widgets/stack_badge.dart';

class LibraryItemListTile extends ConsumerWidget {
  const LibraryItemListTile(this.item, {super.key, this.isOffline = false});
  final LibraryItem item;
  final bool isOffline;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final title = item.collapsedSeries != null
        ? item.collapsedSeries!.name
        : item.title ?? l.noTitle;

    final isDownloaded = ref.watch(
      downloadsProvider.select((d) => d[item.id]?.status == .completed),
    );

    final seriesNumBooks = item.collapsedSeries?.numBooks;
    final progress = item.collapsedSeries != null ? 0 : item.progress;

    return ListTile(
      onTap: () {
        if (item.collapsedSeries != null) {
          context.push(
            AppRoute.seriesDetail.path,
            extra: item.collapsedSeries!.id,
          );
        } else {
          context.push(
            AppRoute.itemDetail.path,
            extra: {'id': item.id, 'isOffline': isOffline},
          );
        }
      },
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
      trailing: seriesNumBooks == null ? null : Text('$seriesNumBooks'),
      minVerticalPadding: 0,
      titleAlignment: .center,
      title: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              children: [
                Text(
                  title,
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
                if (progress > 0)
                  Text(
                    '${(progress * 100).toStringAsFixed(1)}%',
                    style: theme.textTheme.labelSmall,
                  ),
              ],
            ),
          ),
          if (isDownloaded) const DownloadBadge(),
        ],
      ),
    );
  }
}
