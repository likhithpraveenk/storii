import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:storii/app/models/log_entry.dart';
import 'package:storii/globals.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_scrollbar.dart';

void showLogEntrySheet(BuildContext context, LogEntry entry) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            Padding(
              padding: const .symmetric(horizontal: 8.0, vertical: 4.0),
              child: Stack(
                alignment: .center,
                children: [
                  Container(
                    width: 32,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Align(
                    alignment: .centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.copy_rounded),
                      onPressed: () async {
                        final fullLog =
                            '''
Timestamp: ${entry.timestamp.fString(forLogs: true)}
Level: ${entry.level.name.toUpperCase()}
Source: ${entry.source ?? 'N/A'}
Message: ${entry.message}
${entry.stackTrace != null ? '\nStackTrace:\n${entry.stackTrace}' : ''}
''';
                        await Clipboard.setData(ClipboardData(text: fullLog));

                        if (context.mounted) {
                          globalMessengerKey.currentState?.showAppSnackBar(
                            'Log copied to clipboard',
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: AppScrollbar(
                controller: scrollController,
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const .fromLTRB(20, 0, 20, 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        _LogRow(
                          'Timestamp',
                          entry.timestamp.fString(forLogs: true),
                        ),
                        _LogRow('Level', entry.level.name.toUpperCase()),
                        _LogRow('Message', entry.message),
                        if (entry.source != null)
                          _LogRow('Source', entry.source!),
                        if (entry.stackTrace != null)
                          _LogRow('StackTrace', entry.stackTrace!),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
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
