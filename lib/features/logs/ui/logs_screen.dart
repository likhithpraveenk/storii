import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/log_entry.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/features/logs/ui/log_entry_sheet.dart';
import 'package:storii/features/logs/ui/logs_filter_sheet.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_scrollbar.dart';
import 'package:storii/shared/widgets/empty_state.dart';

class LogsScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<LogsScreen> createState() => _LogsScreenState();
}

class _LogsScreenState extends ConsumerState<LogsScreen> {
  final _scrollController = ScrollController();
  final _selectedIds = <String>{};

  bool get _isSelectMode => _selectedIds.isNotEmpty;

  void _toggleSelect(LogEntry entry) {
    final id = _entryId(entry);
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
      } else {
        _selectedIds.add(id);
      }
    });
  }

  void _clearSelection() => setState(_selectedIds.clear);

  String _entryId(LogEntry entry) =>
      entry.timestamp.millisecondsSinceEpoch.toString();

  int _selectedCount(List<LogEntry> logs) =>
      logs.where((entry) => _selectedIds.contains(_entryId(entry))).length;

  Future<void> _copySelected(List<LogEntry> logs) async {
    final selected =
        logs.where((entry) => _selectedIds.contains(_entryId(entry))).toList()
          ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

    final buffer = StringBuffer();
    for (final entry in selected) {
      buffer.writeln('''
Timestamp: ${entry.timestamp.fString(forLogs: true)}
Level: ${entry.level.name.toUpperCase()}
Source: ${entry.source ?? 'N/A'}
Message: ${entry.message}${entry.stackTrace != null ? '\nStackTrace:\n${entry.stackTrace}' : ''}
''');
    }
    final text = buffer.toString().trim();

    await Clipboard.setData(ClipboardData(text: text));
    _clearSelection();

    if (context.mounted) {
      globalMessengerKey.currentState?.showAppSnackBar(l10n.copiedToClipboard);
    }
  }

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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isSelectMode ? l10n.selectedCount(_selectedCount(logs)) : l10n.logs,
          style: textTheme.titleLarge,
        ),
        leading: IconButton(
          onPressed: () {
            if (_isSelectMode) {
              _clearSelection();
            } else {
              context.pop();
            }
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          if (!_isSelectMode) ...[
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () => showFiltersSheet(context),
              tooltip: l10n.filter,
            ),
            const DeleteLogsButton(),
          ] else ...[
            IconButton(
              icon: const Icon(Icons.content_copy),
              onPressed: _selectedIds.isEmpty
                  ? null
                  : () => _copySelected(logs),
              tooltip: l10n.copy,
            ),
          ],
        ],
      ),
      body: logs.isEmpty
          ? const EmptyState()
          : SafeArea(
              child: AppScrollbar(
                controller: _scrollController,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: logs.length,
                  itemBuilder: (context, index) {
                    final entry = logs[index];
                    final color = entry.level.color(scheme);
                    final displayMessage = entry.message.length > 100
                        ? '${entry.message.substring(0, 100)}...'
                        : entry.message;
                    final id = _entryId(entry);
                    final isSelected = _selectedIds.contains(id);
                    return InkWell(
                      onTap: () {
                        if (_isSelectMode) {
                          _toggleSelect(entry);
                        } else {
                          showLogEntrySheet(context, entry);
                        }
                      },
                      onLongPress: () {
                        if (!_isSelectMode) {
                          setState(() => _selectedIds.add(id));
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.1),
                        ),
                        padding: .fromLTRB(_isSelectMode ? 0 : 16, 16, 16, 16),
                        child: Row(
                          children: [
                            if (_isSelectMode)
                              Checkbox(
                                value: isSelected,
                                onChanged: (_) => _toggleSelect(entry),
                                visualDensity: .compact,
                              )
                            else ...[
                              Container(
                                width: 4,
                                height: 24,
                                padding: const .symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: .circular(2),
                                ),
                              ),
                              const SizedBox(width: 16),
                            ],
                            Expanded(
                              child: Column(
                                crossAxisAlignment: .start,
                                children: [
                                  Text(
                                    displayMessage,
                                    maxLines: 1,
                                    style: textTheme.bodyLarge,
                                    overflow: .ellipsis,
                                  ),
                                  Row(
                                    mainAxisAlignment: .spaceBetween,
                                    children: [
                                      Text(
                                        entry.timestamp.fString(forLogs: true),
                                        overflow: .ellipsis,
                                        style: textTheme.labelSmall,
                                      ),
                                      if (entry.source != null)
                                        Text(
                                          '${entry.source}',
                                          overflow: .ellipsis,
                                          style: textTheme.labelSmall,
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
