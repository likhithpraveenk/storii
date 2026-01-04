import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/models/log_entry.dart';
import 'package:storii/app/providers/logs_provider.dart';
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
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          // TODO: filter and combine filter to delete
          IconButton(
            onPressed: logsAsync.value?.isEmpty ?? true
                ? null
                : () => _confirmDeletion(
                    context,
                    scheme.error,
                    ref,
                    logsAsync.value!.length,
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
                onTap: () => _showDataBottomSheet(context, entry),
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

  Future<dynamic> _confirmDeletion(
    BuildContext context,
    Color error,
    WidgetRef ref,
    int length,
  ) {
    final l = AppLocalizations.of(context)!;

    return showDialog(
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
              color: error,
              onPressed: () async {
                await ref.read(logsProvider.notifier).clear();
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
          title: Text(
            l.deleteLogsQ(length),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        );
      },
    );
  }

  void _showDataBottomSheet(BuildContext context, LogEntry entry) {
    Widget data(String label, String value) {
      final theme = Theme.of(context);
      return Padding(
        padding: const .only(bottom: 8),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 2),
            SelectableText(
              value,
              style: theme.textTheme.bodyLarge?.copyWith(
                shadows: [
                  Shadow(
                    color: theme.colorScheme.onSurfaceVariant.withValues(
                      alpha: 0.1,
                    ),
                    blurRadius: 8,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      shape: AppStyles.roundedRect,
      builder: (context) => Padding(
        padding: .fromLTRB(
          20,
          0,
          20,
          MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              data('Timestamp', entry.timestamp.fString(forLogs: true)),
              data('Level', entry.level.name.toUpperCase()),
              data('Message', entry.message),
              if (entry.source != null) data('Source', entry.source!),
              if (entry.stackTrace != null)
                data('StackTrace', entry.stackTrace!),
            ],
          ),
        ),
      ),
    );
  }
}
