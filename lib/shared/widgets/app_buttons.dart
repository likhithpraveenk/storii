import 'package:flutter/material.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/shared/widgets/waveform.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isDestructive = false,
    this.loading = false,
    this.icon,
  });

  final String text;
  final void Function()? onPressed;
  final bool isDestructive;
  final bool loading;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FilledButton.icon(
      onPressed: loading ? null : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: isDestructive
            ? theme.colorScheme.error
            : theme.colorScheme.primary,
        shape: AppStyles.roundedRect,
        elevation: loading ? 0 : 6,
      ),
      icon: loading ? null : icon,
      label: loading
          ? const RandomWaveform()
          : Text(
              text,
              style: theme.textTheme.labelLarge?.copyWith(
                color: isDestructive
                    ? theme.colorScheme.onError
                    : theme.colorScheme.onPrimary,
              ),
            ),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isDestructive = false,
    this.loading = false,
    this.icon,
  });

  final String text;
  final void Function()? onPressed;
  final bool isDestructive;
  final bool loading;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OutlinedButton.icon(
      onPressed: loading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: isDestructive
            ? theme.colorScheme.error
            : theme.colorScheme.primary,
        side: BorderSide(
          color: loading
              ? theme.colorScheme.onSurface.withValues(alpha: .2)
              : isDestructive
              ? theme.colorScheme.error
              : theme.colorScheme.primary,
          width: 1.5,
        ),
        shape: AppStyles.roundedRect,
      ),
      icon: loading ? null : icon,
      label: loading
          ? const RandomWaveform()
          : Text(text, style: theme.textTheme.labelLarge),
    );
  }
}

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.icon,
  });

  final String text;
  final void Function()? onPressed;
  final Color? color;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: color ?? Theme.of(context).colorScheme.primary,
        shape: AppStyles.roundedRect,
      ),
      icon: icon,
      label: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          letterSpacing: 0.1,
          color: color ?? Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
