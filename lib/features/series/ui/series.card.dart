import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/models/series.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/features/library/ui/placeholder_image.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/stack_badge.dart';

class SeriesCard extends StatelessWidget {
  const SeriesCard(this.series, {super.key});
  final SeriesDomain series;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final books = series.books ?? [];
    final authorName = books.firstOrNull?.authorName;
    final double seriesProgress = (series.books?.isEmpty ?? true)
        ? 0
        : (series.libraryItemIdsFinished?.length ?? 0) / series.books!.length;
    return Stack(
      children: [
        Column(
          mainAxisSize: .min,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                final maxWidth = constraints.maxWidth;
                final stackHeight = maxWidth * 0.5;
                final bookSize = stackHeight;

                final visibleBooks = books.length > 6
                    ? books.sublist(books.length - 6)
                    : books;
                final count = visibleBooks.length;

                return SizedBox(
                  height: stackHeight,
                  width: double.infinity,
                  child: books.isEmpty
                      ? ClipRRect(
                          borderRadius: AppStyles.circularRadius,
                          child: PlaceholderImage(label: l.noImage),
                        )
                      : Stack(
                          fit: .expand,
                          children: [
                            Center(
                              child: Stack(
                                clipBehavior: .none,
                                alignment: .center,
                                children: List.generate(count, (index) {
                                  final reverseIndex = count - 1 - index;
                                  final book = visibleBooks[reverseIndex];

                                  double xOffset = 0;
                                  if (count > 1) {
                                    final preferredSpacing =
                                        (maxWidth - bookSize) / (count - 1);
                                    final spacing = preferredSpacing.clamp(
                                      bookSize * 0.2,
                                      bookSize * 0.7,
                                    );

                                    final start = -(count - 1) * spacing / 2;
                                    xOffset = start + (reverseIndex * spacing);
                                  }

                                  return Transform.translate(
                                    offset: Offset(xOffset, 0),
                                    child: Container(
                                      width: bookSize,
                                      height: bookSize,
                                      decoration: BoxDecoration(
                                        borderRadius: AppStyles.circularRadius,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withValues(
                                              alpha: reverseIndex == 0
                                                  ? 0.3
                                                  : 0.1,
                                            ),
                                            blurRadius: 8,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: ClipRRect(
                                        borderRadius: AppStyles.circularRadius,
                                        child: ImageWidget(
                                          id: book.id,
                                          type: .item,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                height: 6,
                                child: LinearProgressIndicator(
                                  value: seriesProgress,
                                  borderRadius: AppStyles.circularRadius,
                                  backgroundColor: Theme.of(
                                    context,
                                  ).colorScheme.surface.withValues(alpha: 0.2),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    series.isFinished
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context).colorScheme.error,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 4,
                              right: 4,
                              child: StackBadge(books.length),
                            ),
                          ],
                        ),
                );
              },
            ),
            Column(
              mainAxisSize: .min,
              children: [
                const SizedBox(height: 4),
                Text(
                  series.name,
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: .bold),
                ),
                if (authorName != null)
                  Text(
                    authorName,
                    maxLines: 1,
                    overflow: .ellipsis,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
              ],
            ),
          ],
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: AppStyles.circularRadius,
              onTap: () =>
                  context.push(AppRoute.seriesDetail.withId(series.id)),
            ),
          ),
        ),
      ],
    );
  }
}

class SeriesCardListView extends StatelessWidget {
  const SeriesCardListView(this.series, {super.key});
  final SeriesDomain series;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context)!;
    final books = series.books ?? [];
    final authorName = books.firstOrNull?.authorName;
    final double seriesProgress = (series.books?.isEmpty ?? true)
        ? 0
        : (series.libraryItemIdsFinished?.length ?? 0) / series.books!.length;
    return ListTile(
      onTap: () => context.push(AppRoute.libraryItem.withId(series.id)),
      shape: AppStyles.roundedRect,
      contentPadding: const .fromLTRB(16, 8, 16, 8),
      leading: AspectRatio(
        aspectRatio: 1,
        child: books.isEmpty
            ? ClipRRect(
                borderRadius: AppStyles.circularRadius,
                child: PlaceholderImage(label: l.noImage),
              )
            : ClipRRect(
                borderRadius: AppStyles.circularRadius,
                child: ImageWidget(
                  id: books.first.id,
                  type: .item,
                  updatedAt: books.first.updatedAt,
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
              l.percentCompleted((seriesProgress * 100).toStringAsFixed(1)),
              style: theme.textTheme.labelSmall,
            ),
        ],
      ),
      trailing: Text(
        books.length.toString(),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 12,
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
