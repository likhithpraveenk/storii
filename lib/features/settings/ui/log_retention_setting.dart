import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/providers/settings_provider.dart';

class LogRetentionSetting extends ConsumerWidget {
  const LogRetentionSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final retention = ref.watch(logRetentionProvider);
    final notifier = ref.read(appSettingsProvider.notifier);

    return Card(
      color: Theme.of(
        context,
      ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      shape: AppStyles.roundedRect,
      child: ListTile(
        leading: const Icon(Icons.bug_report),
        title: Text(
          'Logs Retention',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        trailing: DropdownButton<int>(
          isDense: true,
          value: retention.inDays,
          borderRadius: .circular(8),
          padding: const .all(8),
          underline: const SizedBox(),
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: (val) => val != null
              ? notifier.setLogRetention(Duration(days: val))
              : null,
          items: const [
            DropdownMenuItem(value: 1, child: Text('1 day')),
            DropdownMenuItem(value: 2, child: Text('2 days')),
            DropdownMenuItem(value: 7, child: Text('7 days')),
            DropdownMenuItem(value: 14, child: Text('14 days')),
            DropdownMenuItem(value: 30, child: Text('30 days')),
          ],
        ),
      ),
    );
  }
}
