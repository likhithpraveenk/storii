import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/log_entry.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_dialog.dart';

void showFiltersSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    builder: (context) => const SafeArea(child: LogsFilterSheet()),
  );
}

class LogsFilterSheet extends ConsumerWidget {
  const new({super.key});

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
            selectedColor: level.color(scheme).withValues(alpha: 0.2),
          );
        }).toList(),
      ),
    );
  }
}

class DeleteLogsButton extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logs = ref.watch(logsProvider);
    if (logs.isEmpty) {
      return const SizedBox.shrink();
    }
    return IconButton(
      onPressed: () => AppDialog.show(
        context,
        title: l10n.deleteLogsQ,
        actionLabel: l10n.delete,
        isDestructive: true,
        onTap: () async {
          ref.read(logsProvider.notifier).clear();
        },
      ),
      icon: const Icon(Icons.delete_sweep),
      tooltip: l10n.delete,
    );
  }
}
