import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/item/ui/current_session_tile.dart';
import 'package:storii/features/item/ui/episode_action_buttons.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/helpers/helpers.dart';
import 'package:storii/shared/widgets/pulsing_dot.dart';

class EpisodeTile extends ConsumerWidget {
  const EpisodeTile({required this.episode, super.key});

  final PodcastEpisode episode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    final isActive =
        session?.libraryItemId == episode.libraryItemId &&
        session?.episodeId == episode.id;
    final progress = ref
        .watch(mediaProgressFromMapProvider(episode.libraryItemId, episode.id))
        .value;

    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final completedColor = scheme.primary.withValues(alpha: 0.12);
    final activeColor = scheme.primary.withValues(alpha: 0.1);

    final isCompleted = progress?.isFinished == true;

    final progressPct = isCompleted
        ? 100
        : progress?.progress != null
        ? ((progress?.progress ?? 0) * 100).round()
        : null;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      margin: const .symmetric(horizontal: 4, vertical: 2),
      padding: const .symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        color: isActive
            ? activeColor
            : isCompleted
            ? completedColor
            : null,
        border: isActive
            ? Border.all(color: scheme.primary.withValues(alpha: 0.3), width: 1)
            : null,
      ),
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Row(
            crossAxisAlignment: .center,
            children: [
              SizedBox(
                width: 48,
                child: Center(
                  child: isActive
                      ? const PulsingDot(size: 8)
                      : episode.episodeNumber != null
                      ? Text(
                          episode.episodeNumber!,
                          style: textTheme.labelSmall?.copyWith(
                            color: scheme.onSurfaceVariant.withValues(
                              alpha: 0.5,
                            ),
                          ),
                        )
                      : null,
                ),
              ),
              SizedBox(
                width: 2,
                height: 48,
                child: VerticalDivider(
                  width: 2,
                  thickness: 2,
                  color: isCompleted || isActive
                      ? scheme.primary.withValues(alpha: 0.3)
                      : scheme.outlineVariant.withValues(alpha: 0.3),
                ),
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
                        color: isActive ? scheme.primary : null,
                      ),
                    ),
                    const SizedBox(height: 4),
                    _EpisodeMetaRow(episode: episode, progressPct: progressPct),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          CurrentSessionTile(
            itemId: episode.libraryItemId,
            episodeId: episode.id,
          ),
          Row(
            children: [
              const SizedBox(width: 48),
              Expanded(
                child: EpisodeActionButtons(
                  episode: episode,
                  alignment: .start,
                ),
              ),
            ],
          ),
        ],
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
      if (episode.publishedAt != null)
        episode.publishedAt!.fString(format: ref.watch(dateTimeFormatProvider)),
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
