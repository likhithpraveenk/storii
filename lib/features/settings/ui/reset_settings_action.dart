import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class ResetSettingsAction extends ConsumerWidget {
  const ResetSettingsAction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;

    return IconButton(
      icon: const Icon(Icons.refresh),
      onPressed: () async {
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              l.resetSettingsQ,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            content: Text(
              l.resetSettingsTxt,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            actions: [
              AppTextButton(
                onPressed: () => Navigator.pop(context, false),
                text: l.cancel,
              ),
              AppFilledButton(
                text: l.reset,
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          ),
        );

        if (confirmed == true) {
          await ref.read(userSettingsProvider.notifier).reset();
          await ref.read(appSettingsProvider.notifier).reset();

          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(l.settingsReset)));
          }
        }
      },
    );
  }
}
