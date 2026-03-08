import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/widgets/placeholder_image.dart';
import 'package:storii/shared/widgets/stack_badge.dart';

class SeriesCard extends StatelessWidget {
  const SeriesCard(this.series, {super.key});
  final Series series;

  @override
  Widget build(BuildContext context) {
    final authorName = series.books.firstOrNull?.authorName;

    return InkWell(
      onTap: () => context.push(AppRoute.seriesDetail.path, extra: series.id),
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisSize: .min,
        children: [
          _SeriesBookStack(series),
          const SizedBox(height: 4),
          Column(
            mainAxisSize: .min,
            children: [
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
    );
  }
}

const _kMinSpacingRatio = 0.2;
const _kMaxSpacingRatio = 0.7;
const _kBookSizeRatio = 0.5;

class _SeriesBookStack extends StatelessWidget {
  const _SeriesBookStack(this.series);

  final Series series;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final progress = series.finishRatio;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (series.books.isEmpty) {
          return ClipRRect(
            borderRadius: kBorderRadius,
            child: PlaceholderImage(label: l.noImage),
          );
        }

        final maxWidth = constraints.maxWidth;
        final bookSize = maxWidth * _kBookSizeRatio;

        final visibleBooks = series.books.reversed.take(4).toList();
        final count = visibleBooks.length;
        final spacing = count <= 1
            ? 0.0
            : count == 2
            ? bookSize
            : ((maxWidth - bookSize) / (count - 1)).clamp(
                bookSize * _kMinSpacingRatio,
                bookSize * _kMaxSpacingRatio,
              );
        final start = -(count - 1) * spacing / 2;

        return SizedBox(
          height: bookSize,
          width: double.infinity,
          child: Stack(
            fit: .expand,
            children: [
              Center(
                child: Stack(
                  clipBehavior: .none,
                  alignment: .center,
                  // draw back-to-front so first book renders on top
                  children: List.generate(count, (index) {
                    final reverseIndex = count - 1 - index;
                    final book = visibleBooks[reverseIndex];
                    final xOffset = start + reverseIndex * spacing;

                    return Transform.translate(
                      offset: Offset(xOffset, 0),
                      child: Container(
                        width: bookSize,
                        height: bookSize,
                        decoration: BoxDecoration(
                          borderRadius: kBorderRadius,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(
                                alpha: reverseIndex == 0 ? 0.3 : 0.1,
                              ),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: kBorderRadius,
                          child: ImageWidget(id: book.id, type: .item),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 3,
                  child: LinearProgressIndicator(
                    value: progress,
                    borderRadius: kBorderRadius,
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.surface.withValues(alpha: 0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      progress == 1.0 ? appGreenColor : appRedColor,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: StackBadge(series.books.length),
              ),
            ],
          ),
        );
      },
    );
  }
}
