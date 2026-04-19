import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/widgets/placeholder_image.dart';

class SeriesCardListView extends StatelessWidget {
  const SeriesCardListView(this.series, {super.key});
  final Series series;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context)!;
    final authorName = series.books.firstOrNull?.authorName;
    final seriesProgress = series.books.isEmpty
        ? 0.0
        : (series.progress?.libraryItemIdsFinished.length ?? 0) /
              series.books.length;
    return ListTile(
      onTap: () => context.push(AppRoute.seriesDetail.path, extra: series.id),
      contentPadding: const .fromLTRB(16, 8, 16, 8),
      leading: AspectRatio(
        aspectRatio: 1,
        child: series.books.isEmpty
            ? ClipRRect(
                borderRadius: .circular(kRadius),
                child: PlaceholderImage(label: l.noImage),
              )
            : ClipRRect(
                borderRadius: .circular(kRadius),
                child: ImageWidget(
                  id: series.books.first.id,
                  type: .item,
                  updatedAt: series.books.first.updatedAt,
                ),
              ),
      ),
      minVerticalPadding: 0,
      titleAlignment: .center,
      title: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            series.name,
            maxLines: 1,
            overflow: .ellipsis,
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: 2),
          Text(
            authorName ?? l.noAuthor,
            maxLines: 1,
            overflow: .ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 2),
          if (seriesProgress > 0)
            Text(
              '${(seriesProgress * 100).toStringAsFixed(1)}%',
              style: theme.textTheme.labelSmall,
            ),
        ],
      ),
      trailing: Text(
        series.books.length.toString(),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 12,
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
