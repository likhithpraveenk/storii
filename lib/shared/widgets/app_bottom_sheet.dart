import 'package:flutter/material.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    required this.title,
    this.body,
    required this.confirmLabel,
    this.confirmIcon,
    this.isDestructive = false,
    this.onConfirm,
  });

  final String title;
  final Widget? body;
  final String confirmLabel;
  final IconData? confirmIcon;
  final bool isDestructive;
  final VoidCallback? onConfirm;

  static Future<bool?> show(
    BuildContext context, {
    required String title,
    Widget? body,
    required String confirmLabel,
    IconData? confirmIcon,
    bool isDestructive = false,
    VoidCallback? onConfirm,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      useSafeArea: true,
      builder: (_) => AppBottomSheet(
        title: title,
        body: body,
        confirmLabel: confirmLabel,
        confirmIcon: confirmIcon,
        isDestructive: isDestructive,
        onConfirm: onConfirm,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .fromLTRB(24, 24, 24, 36),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const Divider(),
          if (body != null) ...[const SizedBox(height: 12), body!],
          const SizedBox(height: 24),
          Row(
            children: [
              if (isDestructive) ...[
                Expanded(
                  child: AppFilledButton(
                    isDestructive: true,
                    onPressed: () {
                      onConfirm?.call();
                      Navigator.of(context).pop(true);
                    },
                    text: confirmLabel,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AppOutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    text: AppLocalizations.of(context)!.cancel,
                  ),
                ),
              ] else ...[
                Expanded(
                  child: AppOutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    text: AppLocalizations.of(context)!.cancel,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AppFilledButton(
                    onPressed: () {
                      onConfirm?.call();
                      Navigator.of(context).pop(true);
                    },
                    text: confirmLabel,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
