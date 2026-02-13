import 'package:flutter/material.dart';
import 'package:storii/app/models/log_entry.dart';
import 'package:storii/shared/helpers/extensions.dart';

void showLogEntrySheet(BuildContext context, LogEntry entry) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            controller: scrollController,
            padding: const .fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                _LogRow('Timestamp', entry.timestamp.fString(forLogs: true)),
                _LogRow('Level', entry.level.name.toUpperCase()),
                _LogRow('Message', entry.message),
                if (entry.source != null) _LogRow('Source', entry.source!),
                if (entry.stackTrace != null)
                  _LogRow('StackTrace', entry.stackTrace!),
              ],
            ),
          ),
        );
      },
    ),
  );
}

class _LogRow extends StatelessWidget {
  const _LogRow(this.label, this.value);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
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
}
