import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/item/ui/episode_action_buttons.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/dashed_underline.dart';

class EpisodeListItem extends ConsumerWidget {
  const EpisodeListItem(this.episode, {super.key});

  final PodcastEpisode episode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final podcastTitle = episode.podcast?.metadata.title ?? l10n.noTitle;
    final epTitle = episode.title ?? l10n.noTitle;
    final desc = episode.description ?? '';
    final epNum = episode.episodeNumber;
    final pubDate = episode.publishedAt?.fString(
      format: ref.watch(dateTimeFormatProvider),
    );

    return Padding(
      padding: const .symmetric(vertical: 12, horizontal: 16),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: .circular(4),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: ImageWidget(id: episode.libraryItemId, type: .item),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        context.push(
                          AppRoute.itemDetail.path,
                          extra: {'id': episode.libraryItemId},
                        );
                      },
                      child: CustomPaint(
                        painter: DashedUnderlinePainter(
                          color: scheme.onSurfaceVariant.withValues(alpha: 0.7),
                        ),
                        child: Text(
                          podcastTitle,
                          style: textTheme.labelMedium?.copyWith(
                            fontWeight: .w600,
                            color: scheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        if (epNum != null) ...[
                          Text(
                            epNum,
                            style: textTheme.labelSmall?.copyWith(
                              color: scheme.primary,
                              fontWeight: .bold,
                            ),
                          ),
                          if (pubDate != null)
                            Text('  •  ', style: textTheme.labelSmall),
                        ],
                        if (pubDate != null)
                          Text(pubDate, style: textTheme.labelSmall),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            epTitle,
            style: textTheme.titleMedium?.copyWith(fontWeight: .bold),
            maxLines: 2,
            overflow: .ellipsis,
          ),
          const SizedBox(height: 4),
          if (desc.isNotEmpty)
            Text(
              desc,
              style: textTheme.bodyMedium?.copyWith(
                color: scheme.onSurfaceVariant.withValues(alpha: 0.8),
              ),
              maxLines: 2,
              overflow: .ellipsis,
            ),
          EpisodeActionButtons(episode: episode),
        ],
      ),
    );
  }
}
