import 'package:abs_api/abs_api.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/features/downloads/ui/download_button.dart';
import 'package:storii/features/item/logic/user_progress_actions.dart';
import 'package:storii/features/item/ui/episode_metadata_sheet.dart';
import 'package:storii/features/item/ui/episode_play_button.dart';
import 'package:storii/features/player/logic/queue_providers.dart';
import 'package:storii/features/player/ui/history_button.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class EpisodeActionButtons extends ConsumerWidget {
  const new({required this.episode, super.key});

  final PodcastEpisode episode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final progress = ref
        .watch(mediaProgressFromMapProvider(episode.libraryItemId, episode.id))
        .value;

    return Wrap(
      alignment: .spaceBetween,
      spacing: 8,
      children: [
        EpisodePlayButton(episode: episode),
        DownloadButton(
          libraryItemId: episode.libraryItemId,
          episodeId: episode.id,
          mediaType: .podcast,
        ),
        IconButton(
          tooltip: l10n.addToQueue,
          icon: const Icon(Icons.playlist_add_outlined),
          onPressed: () {
            ref
                .read(queueProvider.notifier)
                .addToQueue(
                  itemId: episode.libraryItemId,
                  episodeId: episode.id,
                );
            globalMessengerKey.currentState?.showAppSnackBar(l10n.addedToQueue);
          },
        ),
        IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () {
            AppBottomSheet.show(
              context,
              title: l10n.metadata,
              body: EpisodeMetadataSheet(episode: episode),
            );
          },
        ),
        IconButton(
          tooltip: l10n.more,
          icon: const Icon(Icons.more_horiz),
          onPressed: () {
            AppBottomSheet.show(
              context,
              title: l10n.more,
              body: Builder(
                builder: (ctx) {
                  return Column(
                    children: [
                      HistoryButton(
                        itemId: episode.libraryItemId,
                        episodeId: episode.id,
                        inOverflow: true,
                      ),
                      if (progress?.isFinished != true)
                        ListTile(
                          title: Text(l10n.markAsComplete),
                          leading: const Icon(Icons.beenhere_outlined),
                          onTap: () {
                            Navigator.of(ctx).pop();
                            AppBottomSheet.show(
                              context,
                              title: l10n.markAsComplete,
                              actionLabel: l10n.confirm,
                              actionIcon: Icons.beenhere_outlined,
                              onTap: () async {
                                final success = await ref
                                    .read(
                                      userProgressActionsProvider(
                                        episode.libraryItemId,
                                        episode.id,
                                      ).notifier,
                                    )
                                    .markComplete();
                                if (ctx.mounted) {
                                  ScaffoldMessenger.of(ctx).showSnackBar(
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
                            );
                          },
                        ),
                      if (progress != null)
                        ListTile(
                          title: Text(l10n.removeProgressQ),
                          leading: const Icon(Icons.delete_outline),
                          onTap: () {
                            Navigator.of(ctx).pop();
                            AppBottomSheet.show(
                              context,
                              title: l10n.removeProgressQ,
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
                                      userProgressActionsProvider(
                                        episode.libraryItemId,
                                        episode.id,
                                      ).notifier,
                                    )
                                    .remove(progress.id);
                                if (ctx.mounted) {
                                  ScaffoldMessenger.of(ctx).showSnackBar(
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
                            );
                          },
                        ),
                      ListTile(
                        title: Text(l10n.copyPlayLink),
                        leading: const Icon(Icons.bolt),
                        onTap: () async {
                          Navigator.of(ctx).pop();
                          final link =
                              'storii://play?id=${episode.libraryItemId}&episodeId=${episode.id}';
                          await Clipboard.setData(ClipboardData(text: link));
                          if (ctx.mounted) {
                            ScaffoldMessenger.of(ctx)
                                .showAppSnackBar(l10n.copiedToClipboard);
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
