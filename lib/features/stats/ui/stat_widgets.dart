import 'package:flutter/material.dart';
import 'package:storii/app/init.dart';
import 'package:storii/shared/helpers/extensions.dart';

class TotalListeningTimeWidget extends StatelessWidget {
  const TotalListeningTimeWidget(this.totalTime, {super.key});
  final Duration totalTime;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const .symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            l10n.totalListeningTime,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            totalTime.toReadableDuration(),
            style: theme.textTheme.displayLarge?.copyWith(
              fontWeight: .w300,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class StatVerticalDivider extends StatelessWidget {
  const StatVerticalDivider({super.key});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const .symmetric(horizontal: 16),
    child: VerticalDivider(
      width: 0,
      thickness: 0.5,
      color: Theme.of(context).colorScheme.outlineVariant,
    ),
  );
}
