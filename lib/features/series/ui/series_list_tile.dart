import 'package:abs_api/abs_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/features/series/ui/series_options_widget.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/placeholder_image.dart';
import 'package:storii/shared/widgets/progress_border_painter.dart';
import 'package:storii/shared/widgets/stack_badge.dart';

class SeriesListTile extends ConsumerWidget {
  const new(this.series, {super.key});
  final Series series;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cardSize = ref.watch(listViewImageSizeProvider);
    final authorName = series.books.firstOrNull?.authorName;
    final progress = series.finishRatio;
    final isFinished = series.progress?.isFinished ?? false;

    return InkWell(
      onTap: () => context.push(AppRoute.seriesDetail.withId(series.id)),
      onLongPress: () => AppBottomSheet.show(
        context,
        title: l10n.more,
        body: SeriesOptionsWidget(series: series),
      ),
      borderRadius: .circular(kRadius),
      child: Padding(
        padding: const .fromLTRB(16, 8, 16, 8),
        child: Row(
          spacing: 8,
          children: [
            SizedBox.square(
              dimension: cardSize,
              child: Stack(
                fit: .expand,
                children: [
                  Padding(
                    padding: const .all(3),
                    child: ClipRRect(
                      borderRadius: .circular(4),
                      child: series.books.isEmpty
                          ? PlaceholderImage(label: l10n.noImage)
                          : ImageWidget(
                              id: series.books.first.id,
                              type: .item,
                              updatedAt: series.books.first.updatedAt,
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
                    series.name,
                    maxLines: 2,
                    overflow: .ellipsis,
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    authorName ?? l10n.noAuthor,
                    maxLines: 1,
                    overflow: .ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            StackBadge('${series.books.length}'),
          ],
        ),
      ),
    );
  }
}
