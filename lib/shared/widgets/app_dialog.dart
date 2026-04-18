import 'package:flutter/material.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.title,
    this.body,
    required this.actionLabel,
    this.actionIcon,
    this.isDestructive = false,
    required this.onTap,
    this.cancelLabel,
  });

  final String title;
  final Widget? body;
  final String actionLabel;
  final IconData? actionIcon;
  final bool isDestructive;
  final Future<void> Function() onTap;
  final String? cancelLabel;

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    Widget? body,
    required String actionLabel,
    IconData? actionIcon,
    bool isDestructive = false,
    required Future<void> Function() onTap,
    bool barrierDismissible = true,
    String? cancelLabel,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => AppDialog(
        title: title,
        body: body,
        actionLabel: actionLabel,
        actionIcon: actionIcon,
        isDestructive: isDestructive,
        onTap: onTap,
        cancelLabel: cancelLabel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const .symmetric(horizontal: 24, vertical: 40),
      child: Material(
        color: theme.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: .circular(24),
          side: BorderSide(
            width: 0.5,
            strokeAlign: BorderSide.strokeAlignInside,
            color: theme.colorScheme.primary,
          ),
        ),
        child: Padding(
          padding: const .all(24),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .stretch,
            children: [
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: 20,
                  fontWeight: .w600,
                  letterSpacing: -0.3,
                ),
                textAlign: .center,
              ),
              if (body != null) ...[const SizedBox(height: 16), body!],
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      cancelLabel ?? AppLocalizations.of(context)!.cancel,
                    ),
                  ),
                  AppFilledButton(
                    isDestructive: isDestructive,
                    onPressed: () async {
                      await onTap();
                      if (context.mounted) Navigator.of(context).pop();
                    },
                    text: actionLabel,
                    icon: actionIcon != null ? Icon(actionIcon) : null,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
