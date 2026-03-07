import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';

class HttpLogsTile extends ConsumerWidget {
  const HttpLogsTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final enableHttpLogs = ref.watch(enableHttpLogsProvider);
    return SwitchListTile(
      secondary: const Icon(Icons.swap_calls),
      title: Text(l.networkLogs),
      subtitle: Text(l.networkLogsDescription),
      value: enableHttpLogs,
      onChanged: (enable) {
        ref.read(appSettingsProvider.notifier).setEnableHttpLogs(enable);
      },
    );
  }
}
