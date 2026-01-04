import 'package:flutter/material.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/shared/widgets/waveform.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.loading = false,
    this.icon,
  });

  final String text;
  final void Function()? onPressed;
  final Color? color;
  final bool loading;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return FilledButton.icon(
      onPressed: loading ? null : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: color ?? scheme.primary,
        foregroundColor: scheme.onPrimary,
        shape: AppStyles.roundedRect,
        elevation: loading ? 0 : 6,
      ),
      icon: loading ? null : icon,
      label: loading
          ? const RandomWaveform()
          : Text(text, style: Theme.of(context).textTheme.labelLarge),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.loading = false,
    this.icon,
  });

  final String text;
  final void Function()? onPressed;
  final Color? color;
  final bool loading;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return OutlinedButton.icon(
      onPressed: loading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: color ?? scheme.primary,
        side: BorderSide(
          color: loading
              ? scheme.onSurface.withValues(alpha: .2)
              : color ?? scheme.primary,
          width: 1.5,
        ),
        shape: AppStyles.roundedRect,
      ),
      icon: loading ? null : icon,
      label: loading
          ? const RandomWaveform()
          : Text(text, style: Theme.of(context).textTheme.labelLarge),
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
    final scheme = Theme.of(context).colorScheme;

    return TextButton.icon(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: color ?? scheme.primary,
        shape: AppStyles.roundedRect,
      ),
      icon: icon,
      label: Text(text, style: Theme.of(context).textTheme.labelLarge),
    );
  }
}
