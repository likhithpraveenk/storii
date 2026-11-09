import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/download_auto_delete.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/storage/local/auto_delete_exclusion_store.dart';

class DownloadInfoLabels extends ConsumerWidget {
  const new({required this.libraryItemId, this.episodeId, super.key});

  final String libraryItemId;
  final String? episodeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final download = ref.watch(downloadItemProvider(libraryItemId, episodeId));
    if (download == null) return const SizedBox.shrink();

    final lines = <Widget>[];

    final user = ref.watch(currentUserProvider);
    if (user == null || download.serverUrl != user.serverUrl) {
      lines.add(
        _Line(
          icon: Icons.dns_outlined,
          text: l10n.downloadedFromDifferentServer,
        ),
      );
    } else if (download.userId != user.id) {
      lines.add(
        _Line(icon: Icons.person_outline, text: l10n.downloadedByDifferentUser),
      );
    }

    final canAutoDelete = ref.watch(autoDeleteListenedDownloadsProvider);

    if (canAutoDelete) {
      final excluded = ref.watch(autoDeleteExclusionsProvider).value ?? {};
      if (excluded.contains(download.key)) {
        lines.add(
          _Line(
            icon: Icons.push_pin_outlined,
            text: l10n.excludedFromAutoDelete,
          ),
        );
      } else {
        final progress = ref
            .watch(mediaProgressFromMapProvider(libraryItemId, episodeId))
            .value;
        final delay = ref.watch(autoDeleteListenedDelayProvider);
        final remaining = DownloadAutoDelete.timeUntilDelete(
          download,
          progress,
          delay,
          DateTime.now(),
        );
        if (remaining != null) {
          lines.add(
            _Line(
              icon: Icons.schedule,
              text: l10n.scheduledForDeletion(
                remaining.inHours,
                remaining.inMinutes % 60,
              ),
              onDelete: () => AppBottomSheet.show(
                context,
                title: l10n.neverAutoDeleteQ,
                actionLabel: l10n.confirm,
                actionIcon: Icons.push_pin_outlined,
                onTap: () => ref
                    .read(autoDeleteExclusionStoreProvider)
                    .add(download.key),
              ),
              semanticsLabel: l10n.neverAutoDeleteQ,
            ),
          );
        }
      }
    }

    if (lines.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const .only(top: 4),
      child: Column(spacing: 2, children: lines),
    );
  }
}

class _Line extends StatelessWidget {
  const new({
    required this.icon,
    required this.text,
    this.onDelete,
    this.semanticsLabel,
  });

  final IconData icon;
  final String text;
  final VoidCallback? onDelete;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: .center,
      spacing: 4,
      mainAxisSize: .min,
      children: [
        Container(
          padding: const .symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: theme.colorScheme.tertiaryContainer,
            borderRadius: .circular(6),
          ),
          child: Row(
            mainAxisAlignment: .center,
            spacing: 4,
            mainAxisSize: .min,
            children: [
              Icon(icon, size: 14, color: theme.colorScheme.onTertiary),
              Flexible(
                child: Text(
                  text,
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onTertiary,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (onDelete != null)
          Semantics(
            label: semanticsLabel,
            child: GestureDetector(
              onTap: onDelete,
              child: Align(
                alignment: .topEnd,
                child: Icon(
                  Icons.delete_outline,
                  size: 20,
                  color: theme.colorScheme.error,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
