import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/widgets/app_dialog.dart';

class ResetSettingsAction extends ConsumerWidget {
  const ResetSettingsAction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.refresh),
      onPressed: () async {
        await AppDialog.show(
          context,
          title: l10n.resetSettingsQ,
          actionLabel: l10n.reset,
          onTap: () async {
            await ref.read(userSettingsProvider.notifier).reset();
            await ref.read(appSettingsProvider.notifier).reset();

            if (context.mounted) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(l10n.settingsReset)));
            }
          },
        );
      },
    );
  }
}
