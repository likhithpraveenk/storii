import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/models/log_entry.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/features/logs/ui/log_entry_sheet.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/app_scrollbar.dart';

class LogsScreen extends ConsumerStatefulWidget {
  const LogsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LogsScreenState();
}

class _LogsScreenState extends ConsumerState<LogsScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logs = ref.watch(filteredLogsProvider);
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l.logs, style: textTheme.titleLarge),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                builder: (context) => const _LogFilterBottomSheet(),
              );
            },
          ),
          const _DeleteLogsButton(),
        ],
      ),
      body: logs.isEmpty
          ? Center(child: Text(l.empty, style: textTheme.bodyLarge))
          : AppScrollbar(
              controller: _scrollController,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: logs.length,
                itemBuilder: (context, index) {
                  final entry = logs[index];
                  final color = entry.level.color(scheme);
                  final displayMessage = entry.message.length > 36
                      ? '${entry.message.substring(0, 36)}...'
                      : entry.message;
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
                      displayMessage,
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
              ),
            ),
    );
  }
}

class _LogFilterBottomSheet extends ConsumerWidget {
  const _LogFilterBottomSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(logFilterProvider);
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: const .fromLTRB(24, 0, 24, 24),
      width: double.infinity,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: LogLevel.values.map((level) {
          final isSelected = activeFilters.contains(level);
          return FilterChip(
            label: Text(level.name.toUpperCase()),
            selected: isSelected,
            onSelected: (selected) {
              final current = {...activeFilters};
              if (selected) {
                current.add(level);
              } else {
                if (current.length > 1) current.remove(level);
              }
              ref.read(logFilterProvider.notifier).state = current;
            },
            selectedColor: level.color(scheme).withValues(alpha: 0.3),
            checkmarkColor: level.color(scheme),
          );
        }).toList(),
      ),
    );
  }
}

class _DeleteLogsButton extends ConsumerWidget {
  const _DeleteLogsButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final logs = ref.watch(logsProvider);
    if (logs.isEmpty) {
      return const SizedBox.shrink();
    }
    return IconButton(
      onPressed: () => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsAlignment: .spaceBetween,
            actions: [
              AppTextButton(
                onPressed: () => Navigator.of(context).pop(),
                text: l.cancel,
              ),
              AppFilledButton(
                text: l.delete,
                isDestructive: true,
                onPressed: () {
                  ref.read(logsProvider.notifier).clear();
                  Navigator.of(context).pop();
                },
              ),
            ],
            title: Text(
              l.deleteLogsQ,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
        },
      ),
      icon: const Icon(Icons.delete_sweep),
    );
  }
}
