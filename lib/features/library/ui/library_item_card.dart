import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/widgets/stack_badge.dart';

class LibraryItemCard extends ConsumerWidget {
  const LibraryItemCard(this.item, {super.key});
  final LibraryItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sequence = item.seriesSequence;
    final scheme = Theme.of(context).colorScheme;
    final displayMode = ref.watch(libraryDisplayModeProvider);

    final isDownloaded =
        ref.watch(downloadItemProvider(item.id))?.status == .completed;

    final stackTitle = displayMode == .compact;
    final showTitle = displayMode != .coverOnly;

    final seriesNumBooks = item.collapsedSeries?.numBooks;

    final progress = item.collapsedSeries != null ? 0.0 : item.progress;

    return InkWell(
      onTap: () {
        if (item.collapsedSeries != null) {
          context.push(
            AppRoute.seriesDetail.path,
            extra: item.collapsedSeries!.id,
          );
        } else {
          context.push(
            AppRoute.itemDetail.path,
            extra: {'id': item.id, 'isDownloaded': isDownloaded},
          );
        }
      },
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: .circular(kRadius),
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
                  if (progress > 0)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 3,
                        child: LinearProgressIndicator(
                          value: progress,
                          borderRadius: .circular(kRadius),
                          backgroundColor: scheme.surface.withValues(
                            alpha: 0.2,
                          ),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            item.isFinished ? appGreenColor : appRedColor,
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
                  if (seriesNumBooks != null)
                    Positioned(
                      top: 4,
                      right: 4,
                      child: StackBadge('$seriesNumBooks'),
                    ),
                  if (isDownloaded)
                    const Positioned(
                      bottom: 6,
                      left: 6,
                      child: DownloadBadge(),
                    ),
                ],
              ),
            ),
          ),
          if (!stackTitle && showTitle) TitleWidget(item: item),
        ],
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.item, this.inStack = false});

  final LibraryItem item;
  final bool inStack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final title = item.collapsedSeries != null
        ? item.collapsedSeries!.name
        : item.title ?? l10n.noTitle;

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
            title,
            maxLines: 2,
            overflow: .ellipsis,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: .bold,
              color: theme.brightness == .light && inStack
                  ? theme.colorScheme.onInverseSurface
                  : theme.colorScheme.onSurface,
            ),
          ),
          Text(
            item.authorName ?? l10n.noAuthor,
            maxLines: 1,
            overflow: .ellipsis,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: theme.brightness == .light && inStack
                  ? theme.colorScheme.onInverseSurface
                  : theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
