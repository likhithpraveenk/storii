import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/item/ui/episode_action_buttons.dart';
import 'package:storii/features/item/ui/episode_metadata_sheet.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/helpers/helpers.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_dialog.dart';
import 'package:storii/shared/widgets/pulsing_dot.dart';

class EpisodeTile extends ConsumerWidget {
  const EpisodeTile({required this.episode, super.key});

  final PodcastEpisode episode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    final isCurrentItemPlaying =
        session != null && session.libraryItemId == episode.libraryItemId;
    final isCurrentEpisode =
        isCurrentItemPlaying && session.episodeId == episode.id;
    final progress = ref
        .watch(mediaProgressFromMapProvider(episode.libraryItemId, episode.id))
        .value;

    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final progressPct = progress?.isFinished == true
        ? 100
        : progress?.progress != null
        ? ((progress?.progress ?? 0) * 100).round()
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
                .play(itemId: episode.libraryItemId, episodeId: episode.id);
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
        padding: const .symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: .center,
          children: [
            Padding(
              padding: const .all(8),
              child: SizedBox(
                width: 32,
                child: isCurrentEpisode
                    ? Center(child: PulsingDot(size: 8, color: scheme.primary))
                    : episode.episodeNumber != null
                    ? Center(
                        child: Text(
                          episode.episodeNumber!,
                          style: textTheme.labelSmall?.copyWith(
                            color: scheme.onSurfaceVariant.withValues(
                              alpha: 0.5,
                            ),
                          ),
                        ),
                      )
                    : null,
              ),
            ),
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
                  EpisodeActionButtons(episode: episode),
                ],
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: Icon(
                Icons.info_outline,
                size: 24,
                color: scheme.onSurfaceVariant.withValues(alpha: 0.6),
              ),
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
    final scheme = Theme.of(context).colorScheme;
    final style = Theme.of(
      context,
    ).textTheme.labelSmall?.copyWith(color: scheme.onSurfaceVariant);

    final parts = <String>[
      if (episode.duration != null) episode.duration!.toReadableDuration(),
      episode.publishedAt.fString(format: ref.watch(dateTimeFormatProvider)),
      if (episode.size != null)
        formatBytes(
          episode.size!,
          useBinary: ref.watch(useBinaryBytesProvider),
        ),
    ];

    return RichText(
      text: TextSpan(
        style: style,
        children: [
          if (progressPct != null)
            TextSpan(
              text: '$progressPct%',
              style: style?.copyWith(
                color: progressPct == 100 ? appGreenColor : scheme.error,
                fontWeight: .w600,
              ),
            ),
          if (progressPct != null && parts.isNotEmpty)
            const TextSpan(text: ' • '),
          if (parts.isNotEmpty) TextSpan(text: parts.join(' • ')),
        ],
      ),
    );
  }
}
