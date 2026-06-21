import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/helpers/helpers.dart';

class EpisodeMetadataSheet extends ConsumerWidget {
  const EpisodeMetadataSheet({super.key, required this.episode});
  final PodcastEpisode episode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final rows = <_RowData>[
      _RowData(l10n.id, episode.id),
      _RowData(l10n.title, episode.title),
      _RowData(l10n.season, episode.season),
      _RowData(l10n.episode, episode.episode),
      _RowData(l10n.type, episode.episodeType),
      _RowData(l10n.subtitle, episode.subtitle),
      _RowData(l10n.duration, episode.duration.toReadableDuration()),
      _RowData(
        l10n.publishedDate,
        episode.publishedAt.fString(format: ref.watch(dateTimeFormatProvider)),
      ),
      _RowData(l10n.pubDate, episode.pubDate),
      _RowData(
        l10n.added,
        episode.addedAt.fString(format: ref.watch(dateTimeFormatProvider)),
      ),
      _RowData(
        l10n.size,
        episode.size != null
            ? formatBytes(
                episode.size!,
                useBinary: ref.watch(useBinaryBytesProvider),
              )
            : null,
      ),
      _RowData(l10n.codec, episode.audioFile.codec),
      _RowData(
        l10n.bitrate,
        episode.audioFile.bitRate != null
            ? '${episode.audioFile.bitRate} kbps'
            : null,
      ),
      _RowData(l10n.channels, episode.audioFile.channels?.toString()),
      _RowData(l10n.mimeType, episode.audioFile.mimeType),
      _RowData(l10n.format, episode.audioFile.format),
    ];

    final description = episode.description?.trim();
    final hasDescription = description != null && description.isNotEmpty;

    return SingleChildScrollView(
      padding: const .fromLTRB(24, 0, 24, 24),
      child: SelectableRegion(
        selectionControls: MaterialTextSelectionControls(),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            ...rows
                .where((r) => r.value != null && r.value!.isNotEmpty)
                .map(
                  (r) => Padding(
                    padding: const .symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: .start,
                      children: [
                        SizedBox(
                          width: 80,
                          child: Text(
                            r.label,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            r.value!,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            if (hasDescription) ...[
              const SizedBox(height: 16),
              Text(
                l10n.description,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Text(description, style: theme.textTheme.bodyMedium),
            ],
          ],
        ),
      ),
    );
  }
}

class _RowData {
  const _RowData(this.label, this.value);
  final String label;
  final String? value;
}
