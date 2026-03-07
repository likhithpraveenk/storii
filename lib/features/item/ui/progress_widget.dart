import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/abs_api/models/media_progress.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/providers/media_progress_provider.dart';
import 'package:storii/features/item/logic/remove_progress_notifier.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class ProgressWidget extends ConsumerWidget {
  const ProgressWidget({super.key, required this.itemId});

  final String itemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaProgressAsync = ref.watch(mediaProgressByIdProvider(itemId));

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: mediaProgressAsync.when(
        data: (mediaProgress) => mediaProgress == null
            ? const SizedBox.shrink()
            : Stack(
                children: [
                  _ProgressContainer(mediaProgress),
                  Positioned(
                    top: 8,
                    right: 0,
                    child: InkWell(
                      onTap: () async {
                        await showModalBottomSheet(
                          context: context,
                          builder: (_) =>
                              RemoveProgressBottomSheet(mediaProgress),
                        );
                      },
                      borderRadius: .circular(20),
                      child: Icon(
                        Icons.cancel,
                        size: 24,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
        loading: () => const SizedBox.shrink(),
        error: (_, _) => const SizedBox.shrink(),
      ),
    );
  }
}

class _ProgressContainer extends StatelessWidget {
  const _ProgressContainer(this.mediaProgress);

  final MediaProgress mediaProgress;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;
    final remaining = mediaProgress.duration - mediaProgress.currentTime;
    final progress = mediaProgress.progress ?? 0.0;

    final (hours, minutes) = remaining.toReadableDuration();
    final (currentHours, currentMinutes) = mediaProgress.currentTime
        .toReadableDuration();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: kBorderRadius,
        color: scheme.secondaryContainer,
      ),
      margin: const .only(top: 16, right: 8, left: 8),
      padding: const .symmetric(vertical: 12, horizontal: 16),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                '${(progress * 100).toStringAsFixed(1)}%',
                style: textTheme.labelLarge?.copyWith(
                  color: scheme.onSecondaryContainer,
                  fontWeight: .bold,
                ),
              ),
              Text(
                l.durationRemaining(hours, minutes),
                style: textTheme.labelLarge?.copyWith(
                  color: scheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                l.currentTime(currentHours, currentMinutes),
                style: textTheme.labelMedium?.copyWith(
                  color: scheme.onSecondaryContainer.withValues(alpha: 0.7),
                ),
              ),
              Text(
                l.lastListened(mediaProgress.lastUpdate),
                style: textTheme.labelMedium?.copyWith(
                  color: scheme.onSecondaryContainer.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RemoveProgressBottomSheet extends ConsumerWidget {
  const RemoveProgressBottomSheet(this.mediaProgress, {super.key});

  final MediaProgress mediaProgress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isLoading = ref.watch(removeProgressProvider);

    ref.listen(removeProgressProvider, (prev, next) {
      if (prev == true && next == false) {
        Navigator.of(context).pop();
      }
    });

    return Padding(
      padding: const .fromLTRB(24, 24, 24, 40),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Text(l.removeProgressTitle, style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            l.removeProgressMessage,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          _ProgressContainer(mediaProgress),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: AppOutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  text: l.cancel,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppFilledButton(
                  isDestructive: true,
                  loading: isLoading,
                  onPressed: () => ref
                      .read(removeProgressProvider.notifier)
                      .remove(
                        mediaProgress.id,
                        itemId: mediaProgress.libraryItemId,
                        episodeId: mediaProgress.episodeId,
                      ),
                  text: l.remove,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
