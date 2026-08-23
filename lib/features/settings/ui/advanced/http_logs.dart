import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';

class HttpLogsTile extends ConsumerWidget {
  const HttpLogsTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enableHttpLogs = ref.watch(enableHttpLogsProvider);
    return SwitchListTile(
      secondary: const Icon(Icons.swap_calls),
      title: Text(l10n.networkLogs),
      subtitle: Text(l10n.networkLogsDescription),
      value: enableHttpLogs,
      onChanged: (enable) {
        ref.read(appSettingsProvider.notifier).setEnableHttpLogs(enable);
      },
    );
  }
}
