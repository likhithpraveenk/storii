import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_dialog.dart';

class ResetSettingsAction extends ConsumerWidget {
  const ResetSettingsAction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;

    return IconButton(
      icon: const Icon(Icons.refresh),
      onPressed: () async {
        await AppDialog.show(
          context,
          title: l.resetSettingsQ,
          actionLabel: l.reset,
          onTap: () async {
            await ref.read(userSettingsProvider.notifier).reset();
            await ref.read(appSettingsProvider.notifier).reset();

            if (context.mounted) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(l.settingsReset)));
            }
          },
        );
      },
    );
  }
}
