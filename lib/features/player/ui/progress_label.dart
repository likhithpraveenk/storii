import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/shared/helpers/extensions.dart';

class ProgressLabel extends StatelessWidget {
  const new({
    required this.currentPosition,
    required this.totalDuration,
    required this.remaining,
    super.key,
  });

  final Duration currentPosition;
  final Duration totalDuration;
  final Duration remaining;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percent = totalDuration.inSeconds > 0
        ? (currentPosition.inSeconds / totalDuration.inSeconds * 100)
              .floor()
              .clamp(0, 100)
        : 0;

    return Text(
      '${l10n.progressPercentComplete(percent)}  $kSmallDot  '
      '${remaining.toReadableDuration(isLeft: true)}',
      style: theme.textTheme.labelMedium?.copyWith(
        color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.9),
        fontWeight: .bold,
        letterSpacing: 1,
      ),
      textAlign: .center,
    );
  }
}
