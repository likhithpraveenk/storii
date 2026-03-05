import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/extensions.dart';

class ProgressWidget extends ConsumerWidget {
  const ProgressWidget({
    required this.remaining,
    required this.progress,
    super.key,
  });

  final Duration remaining;
  final double progress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;
    final (hours, minutes) = remaining.toReadableDuration();
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: kBorderRadius,
            color: scheme.secondaryContainer,
          ),
          padding: const .symmetric(vertical: 12, horizontal: 16),
          margin: const .only(top: 8, right: 8),
          child: Column(
            mainAxisSize: .min,
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
        ),
        Positioned(
          top: 0,
          right: 0,
          child: InkWell(
            onTap: () {
              // TODO: remove progress
            },
            borderRadius: .circular(20),
            child: Icon(
              Icons.cancel,
              size: 24,
              color: scheme.onSecondaryContainer,
            ),
          ),
        ),
      ],
    );
  }
}
