import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/item/logic/episode_filter_provider.dart';
import 'package:storii/features/item/ui/episode_list_header.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/helpers/helpers.dart';
import 'package:storii/shared/widgets/pulsing_dot.dart';

class EpisodeList extends ConsumerWidget {
  const EpisodeList({super.key, required this.episodes, required this.itemId});
  final List<PodcastEpisode> episodes;
  final String itemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filtered = ref.watch(
      filteredEpisodesProvider(episodes: episodes, itemId: itemId),
    );

    return Column(
      children: [
        EpisodeListHeader(
          episodeCount: filtered.length,
          totalCount: episodes.length,
        ),
        const Divider(height: 0),
        ...List.generate(
          filtered.length,
          (index) => _EpisodeTile(
            episode: filtered[index],
            index: index,
            itemId: itemId,
          ),
        ),
      ],
    );
  }
}

class _EpisodeTile extends ConsumerWidget {
  const _EpisodeTile({
    required this.episode,
    required this.index,
    required this.itemId,
  });

  final PodcastEpisode episode;
  final int index;
  final String itemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    final isCurrentItemPlaying =
        session != null && session.libraryItemId == itemId;
    final isCurrentEpisode =
        isCurrentItemPlaying && session.episodeId == episode.id;
    final isPlaying = isCurrentEpisode && ref.watch(isPlayingProvider);

    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    final episodeNumber = episode.episode != null && episode.season != null
        ? 'S${episode.season} E${episode.episode}'
        : episode.episode != null
        ? 'E${episode.episode}'
        : null;

    return InkWell(
      borderRadius: .circular(kRadius),
      onTap: () {
        if (!isCurrentEpisode) {
          ref
              .read(audioPlayerProvider.notifier)
              .play(itemId: itemId, episodeId: episode.id);
        }
      },
      child: Padding(
        padding: const .symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: .center,
          children: [
            SizedBox(
              width: 32,
              child: isCurrentEpisode
                  ? Center(child: PulsingDot(size: 8, color: scheme.primary))
                  : episodeNumber != null
                  ? Center(
                      child: Text(
                        episodeNumber,
                        style: textTheme.labelSmall?.copyWith(
                          color: scheme.onSurfaceVariant.withValues(alpha: 0.5),
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                children: [
                  Text(
                    episode.title ?? l10n.noTitle,
                    maxLines: 2,
                    overflow: .ellipsis,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: .w500,
                      color: isCurrentEpisode ? scheme.primary : null,
                    ),
                  ),
                  if (episode.subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      episode.subtitle!,
                      maxLines: 1,
                      overflow: .ellipsis,
                      style: textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 12,
                    runSpacing: 4,
                    children: [
                      Text(
                        episode.duration.toReadableDuration(),
                        style: textTheme.labelSmall?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        episode.publishedAt.fString(
                          format: ref.watch(dateTimeFormatProvider),
                        ),
                        style: textTheme.labelSmall?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                      if (episode.size != null)
                        Text(
                          formatBytes(
                            episode.size!,
                            useBinary: ref.watch(useBinaryBytesProvider),
                          ),
                          style: textTheme.labelSmall?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
                        ),
                    ],
                  ),
                  // TODO: add description, progress, more metadata icon sheet
                ],
              ),
            ),
            Icon(
              isPlaying ? Icons.pause_circle : Icons.play_circle_outline,
              color: isCurrentEpisode
                  ? scheme.primary
                  : scheme.onSurfaceVariant,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
