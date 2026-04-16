import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/features/downloads/logic/download_notifier.dart';
import 'package:storii/features/downloads/ui/download_button.dart';
import 'package:storii/features/item/logic/progress_notifier.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/features/player/ui/history_button.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class PlayProgressWidget extends ConsumerWidget {
  const PlayProgressWidget(this.item, {super.key});

  final LibraryItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final isLoading = ref.watch(
      audioPlayerProvider.select((s) => s.loadingItemId == item.id),
    );

    final session = ref.watch(sessionProvider);
    final isCurrentItem = session?.libraryItemId == item.id;
    final isPlaying = isCurrentItem && ref.watch(isPlayingProvider);

    final mediaProgress = ref.watch(mediaProgressProvider(item.id)).value;
    final progress = mediaProgress?.progress ?? 0.0;
    final remaining =
        (item.duration -
                (mediaProgress?.currentTime ??
                    session?.currentTime ??
                    Duration.zero))
            .toReadableDuration(context, isLeft: true);

    final isDownloaded = ref.watch(
      downloadsProvider.select((d) => d[item.id]?.status == .completed),
    );

    return Column(
      crossAxisAlignment: .stretch,
      children: [
        AppFilledButton(
          loading: isLoading,
          onPressed: () async {
            if (isCurrentItem) {
              isPlaying
                  ? await audioHandler.pause()
                  : await audioHandler.play();
            } else {
              await ref
                  .read(audioPlayerProvider.notifier)
                  .play(itemId: item.id);
            }
          },
          icon: Icon(
            isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
          ),
          text: isPlaying
              ? l.pause
              : progress == 1.0
              ? l.replay
              : progress > 0
              ? '${l.resume} • $remaining'
              : l.play,
        ),
        if (progress > 0) ...[
          const SizedBox(height: 10),
          _ProgressBar(progress: progress),
          const SizedBox(height: 12),
          DownloadedBadge(item.id),
        ],
        Row(
          mainAxisAlignment: .center,
          children: [
            if (!isDownloaded) ...[
              DownloadButton(libraryItemId: item.id),
              const SizedBox(width: 24),
            ],
            HistoryButton(itemId: item.id),
            const SizedBox(width: 24),
            if (progress != 1.0) ...[
              IconButton(
                onPressed: () => AppBottomSheet.show(
                  context,
                  title: l.markAsComplete,
                  actionLabel: l.confirm,
                  actionIcon: Icons.check,
                  onTap: () async {
                    final success = await ref
                        .read(mediaProgressProvider(item.id).notifier)
                        .markComplete();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            success
                                ? l.progressMarkedComplete
                                : l.progressMarkCompleteFailed,
                          ),
                        ),
                      );
                    }
                  },
                ),
                icon: const Icon(Icons.check_rounded),
              ),
              const SizedBox(width: 24),
            ],
            if (mediaProgress != null)
              IconButton(
                onPressed: () => AppBottomSheet.show(
                  context,
                  title: l.removeProgressTitle,
                  body: Padding(
                    padding: const .symmetric(horizontal: 24),
                    child: Text(
                      l.removeProgressMessage,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  actionLabel: l.remove,
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
                                ? l.progressRemoved
                                : l.progressRemoveFailed,
                          ),
                        ),
                      );
                    }
                  },
                ),
                icon: const Icon(Icons.delete_outline),
              ),
          ],
        ),
      ],
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.progress});
  final double progress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;

        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: progress),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOutCubic,
          builder: (context, value, _) {
            final barWidth = (totalWidth * value).clamp(0.0, totalWidth);
            final animatedPercent = (value * 100).toStringAsFixed(1);

            const textWidth = 48.0;
            const padding = 8.0;
            final isInsideBar = value > 0.7;
            final clampedLeft = isInsideBar
                ? (barWidth - textWidth - padding).clamp(padding, totalWidth)
                : (barWidth + padding).clamp(
                    0.0,
                    totalWidth - textWidth - padding,
                  );

            return Stack(
              alignment: .centerLeft,
              children: [
                Container(
                  height: 20,
                  width: barWidth,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        theme.colorScheme.inverseSurface,
                        theme.colorScheme.primary,
                      ],
                    ),
                    borderRadius: .circular(kRadius),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.outline.withValues(
                          alpha: 0.35,
                        ),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                if (barWidth > 0)
                  Positioned(
                    left: clampedLeft,
                    child: Text(
                      '$animatedPercent%',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: isInsideBar
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.onSurface,
                        fontWeight: .bold,
                      ),
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
