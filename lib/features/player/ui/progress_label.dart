import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/helpers/extensions.dart';

class ProgressLabel extends ConsumerWidget {
  const new({
    required this.currentPosition,
    required this.totalDuration,
    super.key,
  });

  final Duration currentPosition;
  final Duration totalDuration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final label = ref.watch(globalProgressEndLabelProvider);
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.labelSmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.9),
      fontWeight: .bold,
      letterSpacing: 1,
    );

    final end = switch (label) {
      .total => totalDuration.toTime(),
      .remaining => '-${(totalDuration - currentPosition).toTime()}',
    };

    return Padding(
      padding: const .symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: .center,
        children: [
          Text(currentPosition.toTime(), style: textStyle, textAlign: .center),
          const Spacer(),
          GestureDetector(
            behavior: .opaque,
            onTap: () {
              ref
                  .read(userSettingsProvider.notifier)
                  .setGlobalProgressEndLabel(
                    label == .total ? .remaining : .total,
                  );
            },
            child: Text(end, style: textStyle, textAlign: .center),
          ),
        ],
      ),
    );
  }
}
