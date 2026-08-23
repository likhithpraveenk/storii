import 'dart:async';

import 'package:flutter/material.dart';
import 'package:storii/app/init.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

BoxDecoration dialogDecoration(BuildContext context) {
  final theme = Theme.of(context);
  return BoxDecoration(
    color: theme.colorScheme.surface,
    borderRadius: .circular(24),
    border: .all(
      width: 0.5,
      strokeAlign: BorderSide.strokeAlignInside,
      color: theme.colorScheme.primary,
    ),
  );
}

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
    this.unawaitedOnTap = false,
  });

  final String title;
  final Widget? body;
  final String actionLabel;
  final IconData? actionIcon;
  final bool isDestructive;
  final Future<void> Function() onTap;
  final String? cancelLabel;
  final bool unawaitedOnTap;

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
    bool unawaitedOnTap = false,
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
        unawaitedOnTap: unawaitedOnTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const .symmetric(horizontal: 24, vertical: 40),
      child: DecoratedBox(
        decoration: dialogDecoration(context),
        child: Padding(
          padding: const .all(24),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .stretch,
            children: [
              Text(
                title,
                style: bottomSheetTitleTextStyle(context),
                textAlign: .center,
              ),
              if (body != null) ...[const SizedBox(height: 16), body!],
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(cancelLabel ?? l10n.cancel),
                  ),
                  AppFilledButton(
                    isDestructive: isDestructive,
                    onPressed: () async {
                      if (unawaitedOnTap) {
                        unawaited(onTap());
                      } else {
                        await onTap();
                      }
                      if (context.mounted) Navigator.of(context).pop(true);
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
