import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/features/logs/ui/log_entry_sheet.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class LogsScreen extends ConsumerWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logsAsync = ref.watch(logsProvider);
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(l.logs, style: textTheme.titleLarge),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: logsAsync.value?.isEmpty ?? true
                ? null
                : () => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: AppStyles.roundedRect,
                        actions: [
                          AppTextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            text: l.cancel,
                          ),
                          AppFilledButton(
                            text: l.delete,
                            isDestructive: true,
                            onPressed: () async {
                              await ref.read(logsProvider.notifier).clear();
                              if (context.mounted) {
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                        ],
                        title: Text(
                          l.deleteLogsQ(logsAsync.value?.length ?? 0),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      );
                    },
                  ),
            icon: const Icon(Icons.delete_sweep),
          ),
        ],
      ),
      body: logsAsync.when(
        data: (logs) {
          if (logs.isEmpty) {
            return Center(child: Text(l.empty, style: textTheme.bodyLarge));
          }
          return ListView.separated(
            itemCount: logs.length,
            separatorBuilder: (_, _) => const Divider(height: 1, indent: 16),
            itemBuilder: (context, index) {
              final entry = logs[index];
              final color = entry.level.color(scheme);
              return ListTile(
                dense: true,
                leading: Container(
                  width: 4,
                  height: 24,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                tileColor: color.withValues(alpha: 0.1),
                title: Text(
                  entry.message,
                  overflow: .ellipsis,
                  maxLines: 1,
                  style: textTheme.bodyLarge,
                ),
                subtitle: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      entry.timestamp.fString(forLogs: true),
                      overflow: .ellipsis,
                      style: textTheme.labelSmall,
                    ),
                    const SizedBox(width: 8),
                    if (entry.source != null)
                      Text(
                        '${entry.source}',
                        overflow: .ellipsis,
                        style: textTheme.labelSmall,
                      ),
                  ],
                ),
                onTap: () => showLogEntrySheet(context, entry),
              );
            },
          );
        },
        error: (e, _) =>
            ErrorRetryWidget('$e', onRetry: () => ref.invalidate(logsProvider)),
        loading: () => const Center(child: RandomWaveform()),
      ),
    );
  }
}
