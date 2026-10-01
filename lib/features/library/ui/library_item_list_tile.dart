import 'package:abs_api/abs_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/features/library/ui/library_item_card.dart';
import 'package:storii/features/library/ui/more_options_widget.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/widgets/progress_border_painter.dart';
import 'package:storii/shared/widgets/stack_badge.dart';

class LibraryItemListTile extends ConsumerWidget {
  const new(
    this.item, {
    super.key,
    this.showPlay = false,
    this.fromContinueListening = false,
    this.fromContinueSeries = false,
  });
  final LibraryItem item;
  final bool showPlay;
  final bool fromContinueListening;
  final bool fromContinueSeries;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isSeries = item.collapsedSeries != null;
    final title = isSeries
        ? item.collapsedSeries!.name
        : item.title ?? l10n.noTitle;

    final seriesNumBooks = item.collapsedSeries?.numBooks;

    final isDownloaded =
        ref.watch(downloadItemProvider(item.id))?.status == .completed;
    final mediaProgress = ref
        .watch(mediaProgressFromMapProvider(item.id, item.recentEpisode?.id))
        .value;
    final progress = isSeries
        ? item.collapsedSeries!.finishRatio
        : mediaProgress?.progress ?? item.progress;
    final isFinished =
        (mediaProgress?.isFinished ?? item.isFinished) || progress == 1.0;

    return InkWell(
      onTap: () {
        if (isSeries) {
          context.push(
            AppRoute.seriesDetail.path,
            extra: item.collapsedSeries!.id,
          );
        } else {
          context.push(AppRoute.itemDetail.path, extra: item.id);
        }
      },
      onLongPress: () => showMoreItemOptionsSheet(
        context,
        itemId: item.id,
        episodeId: item.recentEpisode?.id,
        fromContinueListening: fromContinueListening,
        fromContinueSeries: fromContinueSeries,
        seriesId:
            item.collapsedSeries?.id ??
            item.media.metadata.mapOrNull(
              book: (m) => m.series?.firstOrNull?.id,
            ),
      ),
      borderRadius: .circular(kRadius),
      child: Padding(
        padding: const .fromLTRB(16, 8, 16, 8),
        child: Row(
          spacing: 8,
          children: [
            SizedBox.square(
              dimension: imgSizeInListView,
              child: Stack(
                fit: .expand,
                children: [
                  Padding(
                    padding: const .all(3),
                    child: ClipRRect(
                      borderRadius: .circular(4),
                      child: ImageWidget(
                        id: item.id,
                        type: .item,
                        updatedAt: item.updatedAt,
                        inList: true,
                      ),
                    ),
                  ),
                  if (progress > 0)
                    RepaintBoundary(
                      child: CustomPaint(
                        painter: ProgressBorderPainter(
                          progress: progress,
                          color: isFinished || progress == 1
                              ? appGreenColor
                              : appRedColor,
                        ),
                      ),
                    ),
                ],
              ),
            ),
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
                    item.authorName ?? l10n.noAuthor,
                    maxLines: 1,
                    overflow: .ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: .min,
              spacing: 8,
              children: [
                if (isDownloaded) const DownloadBadge(fillColor: false),
                if (seriesNumBooks != null) StackBadge('$seriesNumBooks'),
                if (showPlay)
                  PlayButtonBadge(
                    itemId: item.id,
                    episodeId: item.recentEpisode?.id,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
