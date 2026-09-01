import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/features/player/logic/session_extensions.dart';
import 'package:storii/features/player/logic/session_notifier.dart';

class ProgressBar extends ConsumerWidget {
  const new({required this.itemId, this.episodeId, super.key});
  final String itemId;
  final String? episodeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaProgress = ref
        .watch(mediaProgressFromMapProvider(itemId, episodeId))
        .value;
    final progress = mediaProgress?.progress ?? 0.0;
    final localSession = ref
        .watch(localSessionProvider(itemId, episodeId))
        .value;
    final localProgress = localSession?.localProgress ?? 0;

    if (progress == 0 && localProgress == 0) return const SizedBox.shrink();

    return Padding(
      padding: const .only(top: 10, bottom: 2),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          return Column(
            mainAxisSize: .min,
            crossAxisAlignment: .stretch,
            children: [
              if (progress > 0)
                _AnimatedProgress(progress: progress, width: width),

              if (progress > 0 && localProgress > 0) const SizedBox(height: 8),

              if (localProgress > 0)
                _AnimatedProgress(
                  progress: localProgress,
                  width: width,
                  isLocal: true,
                ),
            ],
          );
        },
      ),
    );
  }
}

class _AnimatedProgress extends StatelessWidget {
  const new({
    required this.progress,
    required this.width,
    this.isLocal = false,
  });

  final double progress;
  final double width;
  final bool isLocal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: progress),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
      builder: (context, value, _) {
        final barWidth = (width * value).clamp(0.0, width);
        final animatedPercent = (value * 100).toStringAsFixed(1);

        const textWidth = 48.0;
        const padding = 8.0;
        final isInsideBar = value > 0.7;
        final clampedLeft = isInsideBar
            ? (barWidth - textWidth - padding).clamp(padding, width)
            : (barWidth + padding).clamp(0.0, width - textWidth - padding);

        final percentColor = isInsideBar
            ? isLocal
                  ? theme.colorScheme.onTertiary
                  : theme.colorScheme.onPrimary
            : theme.colorScheme.onSurface;

        return Stack(
          alignment: .centerLeft,
          children: [
            Container(
              height: 20,
              width: barWidth,
              decoration: BoxDecoration(
                color: isLocal
                    ? theme.colorScheme.tertiary
                    : theme.colorScheme.primary,
                borderRadius: .circular(kRadius),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.outline.withValues(alpha: 0.35),
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
                    color: percentColor,
                    fontWeight: .bold,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
