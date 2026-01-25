import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/providers/settings_provider.dart';

class HttpLogsSetting extends ConsumerWidget {
  const HttpLogsSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enableHttpLogs = ref.watch(enableHttpLogsProvider);
    return ListTile(
      leading: const Icon(Icons.bug_report),
      title: Text('HTTP Logs', style: Theme.of(context).textTheme.titleSmall),
      trailing: Switch.adaptive(
        value: enableHttpLogs,
        onChanged: (value) {
          ref.read(appSettingsProvider.notifier).setEnableHttpLogs(value);
        },
      ),
    );
  }
}
