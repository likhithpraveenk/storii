import 'package:flutter/material.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    required this.title,
    this.body,
    this.primaryActionLabel = 'Confirm',
    this.primaryActionIcon,
    this.isDestructive = false,
    this.onPrimaryAction,
    this.showButtons = true,
  });

  final String title;
  final Widget? body;
  final String primaryActionLabel;
  final IconData? primaryActionIcon;
  final bool isDestructive;
  final VoidCallback? onPrimaryAction;
  final bool showButtons;

  static Future<bool?> show(
    BuildContext context, {
    required String title,
    Widget? body,
    String? primaryActionLabel,
    IconData? primaryActionIcon,
    bool isDestructive = false,
    VoidCallback? onPrimaryAction,
    bool showButtons = true,
    bool isDismissible = true,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      isDismissible: isDismissible,
      builder: (_) => AppBottomSheet(
        title: title,
        body: body,
        primaryActionLabel: primaryActionLabel ?? 'Confirm',
        primaryActionIcon: primaryActionIcon,
        isDestructive: isDestructive,
        onPrimaryAction: onPrimaryAction,
        showButtons: showButtons,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .all(24),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: .w500),
          ),
          if (body != null) ...[const SizedBox(height: 16), body!],
          if (showButtons) ...[
            const SizedBox(height: 24),
            Row(
              children: [
                if (isDestructive) ...[
                  Expanded(
                    child: AppFilledButton(
                      isDestructive: true,
                      onPressed: () {
                        onPrimaryAction?.call();
                        Navigator.of(context).pop(true);
                      },
                      text: primaryActionLabel,
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
                        onPrimaryAction?.call();
                        Navigator.of(context).pop(true);
                      },
                      text: primaryActionLabel,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }
}
