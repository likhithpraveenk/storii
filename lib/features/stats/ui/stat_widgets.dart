import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/shared/helpers/extensions.dart';

const _tabular = [FontFeature.tabularFigures()];

class TotalListeningTimeWidget extends StatelessWidget {
  const new(this.totalTime, {super.key});

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
          const SizedBox(height: 8),
          FittedBox(
            fit: .scaleDown,
            alignment: .centerLeft,
            child: DurationCountUp(
              totalTime,
              duration: const Duration(milliseconds: 1500),
              style: theme.textTheme.displayLarge?.copyWith(
                fontWeight: .w300,
                color: theme.colorScheme.onSurface,
                fontFeatures: _tabular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatRow extends StatelessWidget {
  const new(this.children, {super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const .symmetric(horizontal: 24),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: .stretch,
          spacing: 8,
          children: [for (final child in children) Expanded(child: child)],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  const new({
    required this.child,
    required this.label,
    this.icon,
    this.iconColor,
    super.key,
  });

  final Widget child;
  final String label;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLow,
        borderRadius: .circular(kRadius),
      ),
      child: Padding(
        padding: const .all(16),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            Row(
              children: [
                if (icon != null) ...[
                  Icon(
                    icon!,
                    size: 16,
                    color: iconColor ?? scheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 6),
                ],
                Flexible(
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: .ellipsis,
                    style: textTheme.labelSmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            child,
          ],
        ),
      ),
    );
  }
}

class CountUp extends StatelessWidget {
  const new(this.value, {this.style, super.key});
  final int value;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: value.toDouble()),
      duration: const Duration(seconds: 1),
      curve: Curves.easeOutCubic,
      builder: (_, value, _) {
        return Text(
          '${value.round()}',
          style: style?.copyWith(fontFeatures: _tabular),
        );
      },
    );
  }
}

class DurationCountUp extends StatelessWidget {
  const new(
    this.value, {
    this.style,
    this.duration = const Duration(seconds: 1),
    super.key,
  });
  final Duration value;
  final TextStyle? style;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: value.inSeconds.toDouble()),
      duration: duration,
      curve: Curves.easeOutExpo,
      builder: (_, seconds, _) => Text(
        Duration(seconds: seconds.round()).toReadableDuration(),
        style: style?.copyWith(fontFeatures: _tabular),
      ),
    );
  }
}

class DurationPill extends StatelessWidget {
  const new(this.duration, {super.key});

  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHigh,
        borderRadius: .circular(kRadius),
      ),
      child: Padding(
        padding: const .symmetric(horizontal: 8, vertical: 4),
        child: Text(
          duration.toReadableDuration(showSeconds: duration.inSeconds < 60),
          style: textTheme.labelMedium?.copyWith(
            color: scheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
