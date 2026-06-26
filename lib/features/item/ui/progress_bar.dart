import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/features/item/logic/progress_notifier.dart';

class ProgressBar extends ConsumerWidget {
  const ProgressBar({required this.itemId, super.key});
  final String itemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaProgress = ref.watch(mediaProgressProvider(itemId)).value;
    final progress = mediaProgress?.progress ?? 0.0;
    if (progress == 0.0) return const SizedBox.shrink();

    final theme = Theme.of(context);

    return Padding(
      padding: const .only(top: 10, bottom: 2),
      child: LayoutBuilder(
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
                      color: theme.colorScheme.primary,
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
      ),
    );
  }
}
