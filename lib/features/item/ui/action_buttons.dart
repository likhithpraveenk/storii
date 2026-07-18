import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/app/providers/user_provider.dart';
import 'package:storii/features/downloads/ui/download_button.dart';
import 'package:storii/features/item/logic/progress_notifier.dart';
import 'package:storii/features/item/ui/local_session_icon.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/ui/bookmarks_sheet.dart';
import 'package:storii/features/player/ui/history_button.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class ActionButtons extends ConsumerWidget {
  const ActionButtons({required this.item, super.key});

  final LibraryItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final mediaProgress = ref
        .watch(mediaProgressFromMapProvider(item.id))
        .value;
    final isFinished =
        mediaProgress?.isFinished == true ||
        item.isFinished ||
        mediaProgress?.progress == 1.0;
    final localSession = ref.watch(localSessionProvider(item.id)).value;
    final canDownload =
        ref.watch(userPermissionsProvider).value?.download ?? false;

    return Row(
      mainAxisAlignment: .spaceEvenly,
      children: [
        if (localSession?.playMethod == .local)
          LocalSessionIcon(itemId: item.id),
        if (canDownload) DownloadButton(libraryItemId: item.id),
        HistoryButton(itemId: item.id),
        BookmarkButton(itemId: item.id, isPodcast: item.isPodcast),
        if (!isFinished)
          IconButton(
            tooltip: l10n.markAsComplete,
            onPressed: () => AppBottomSheet.show(
              context,
              title: l10n.markAsComplete,
              actionLabel: l10n.confirm,
              actionIcon: Icons.beenhere_outlined,
              onTap: () async {
                final success = await ref
                    .read(mediaProgressProvider(item.id).notifier)
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
            icon: const Icon(Icons.beenhere_outlined),
          ),
        if (mediaProgress != null)
          IconButton(
            tooltip: l10n.removeProgressTitle,
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
                        mediaProgress.libraryItemId,
                      ).notifier,
                    )
                    .remove(mediaProgress.id);
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
            icon: const Icon(Icons.cancel_outlined),
          ),
      ],
    );
  }
}
