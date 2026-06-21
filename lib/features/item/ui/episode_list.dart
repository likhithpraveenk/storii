import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/item/logic/episode_filter_provider.dart';
import 'package:storii/features/item/logic/progress_notifier.dart';
import 'package:storii/features/item/ui/episode_list_header.dart';
import 'package:storii/features/item/ui/episode_metadata_sheet.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/helpers/helpers.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_dialog.dart';
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
          (index) => _EpisodeTile(episode: filtered[index], itemId: itemId),
        ),
      ],
    );
  }
}

class _EpisodeTile extends ConsumerWidget {
  const _EpisodeTile({required this.episode, required this.itemId});

  final PodcastEpisode episode;
  final String itemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    final isCurrentItemPlaying =
        session != null && session.libraryItemId == itemId;
    final isCurrentEpisode =
        isCurrentItemPlaying && session.episodeId == episode.id;
    final progress = ref.watch(mediaProgressProvider(itemId, episode.id)).value;

    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final episodeNumber = episode.episode != null && episode.season != null
        ? 'S${episode.season} E${episode.episode}'
        : episode.episode != null
        ? 'E${episode.episode}'
        : null;

    final progressPct =
        progress != null &&
            progress.currentTime != null &&
            episode.duration.inSeconds > 0
        ? (progress.currentTime!.inSeconds / episode.duration.inSeconds * 100)
              .round()
        : null;

    return InkWell(
      borderRadius: .circular(kRadius),
      onTap: () {
        if (isCurrentEpisode) return;
        AppDialog.show(
          context,
          title: episode.title ?? l10n.noTitle,
          body: Text(l10n.playEpisodeConfirm),
          actionLabel: l10n.play,
          onTap: () async {
            await ref
                .read(audioPlayerProvider.notifier)
                .play(itemId: itemId, episodeId: episode.id);
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: isCurrentEpisode
              ? scheme.primary.withValues(alpha: 0.08)
              : null,
          borderRadius: .circular(kRadius),
        ),
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
                  const SizedBox(height: 4),
                  _EpisodeMetaRow(episode: episode, progressPct: progressPct),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // TODO: add download button for podcast episodes
            // TODO: add mark complete / remove progress for podcast episodes
            IconButton(
              icon: Icon(
                Icons.info_outline,
                size: 20,
                color: scheme.onSurfaceVariant.withValues(alpha: 0.6),
              ),
              padding: .zero,
              constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
              onPressed: () {
                AppBottomSheet.show(
                  context,
                  title: l10n.metadata,
                  body: EpisodeMetadataSheet(episode: episode),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _EpisodeMetaRow extends ConsumerWidget {
  const _EpisodeMetaRow({required this.episode, this.progressPct});

  final PodcastEpisode episode;
  final int? progressPct;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context).textTheme.labelSmall?.copyWith(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );
    final parts = <String>[
      if (progressPct != null) '$progressPct%',
      episode.duration.toReadableDuration(),
      episode.publishedAt.fString(format: ref.watch(dateTimeFormatProvider)),
      if (episode.size != null)
        formatBytes(
          episode.size!,
          useBinary: ref.watch(useBinaryBytesProvider),
        ),
    ];

    return Text(
      parts.join(' • '),
      style: style,
      maxLines: 1,
      overflow: .ellipsis,
    );
  }
}
