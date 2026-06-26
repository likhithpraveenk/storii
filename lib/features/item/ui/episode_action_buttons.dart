import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/features/item/logic/progress_notifier.dart';
import 'package:storii/features/player/ui/history_button.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class EpisodeActionButtons extends ConsumerWidget {
  const EpisodeActionButtons({required this.episode, super.key});

  final PodcastEpisode episode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final progress = ref
        .watch(mediaProgressFromMapProvider(episode.libraryItemId, episode.id))
        .value;

    return Row(
      mainAxisAlignment: .spaceEvenly,
      children: [
        // TODO: download podcast episode
        // DownloadButton(libraryItemId: episode.libraryItemId),
        HistoryButton(itemId: episode.libraryItemId, episodeId: episode.id),
        if (progress?.isFinished != true)
          IconButton(
            tooltip: l10n.markAsComplete,
            icon: const Icon(Icons.check_rounded, size: 20),
            onPressed: () => AppBottomSheet.show(
              context,
              title: l10n.markAsComplete,
              actionLabel: l10n.confirm,
              actionIcon: Icons.check,
              onTap: () async {
                final success = await ref
                    .read(
                      mediaProgressProvider(
                        episode.libraryItemId,
                        episode.id,
                      ).notifier,
                    )
                    .markComplete();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        success
                            ? l10n.progressMarkedComplete
                            : l10n.progressMarkCompleteFailed,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        if (progress != null)
          IconButton(
            tooltip: l10n.removeProgressTitle,
            icon: const Icon(Icons.delete_outline, size: 20),
            onPressed: () => AppBottomSheet.show(
              context,
              title: l10n.removeProgressTitle,
              body: Padding(
                padding: const .fromLTRB(24, 0, 24, 24),
                child: Text(
                  l10n.removeProgressMessage,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              actionLabel: l10n.remove,
              actionIcon: Icons.delete_outline,
              isDestructive: true,
              onTap: () async {
                final success = await ref
                    .read(
                      mediaProgressProvider(
                        episode.libraryItemId,
                        episode.id,
                      ).notifier,
                    )
                    .remove(progress.id);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        success
                            ? l10n.progressRemoved
                            : l10n.progressRemoveFailed,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
      ],
    );
  }
}
