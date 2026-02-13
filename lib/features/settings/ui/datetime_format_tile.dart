import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';

class DateTimeFormatTile extends ConsumerWidget {
  const DateTimeFormatTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFormat = ref.watch(dateTimeFormatProvider);

    return ListTile(
      leading: const Icon(Icons.calendar_month),
      title: Text(AppLocalizations.of(context)!.dateFormat),
      subtitle: Text(DateFormat(currentFormat).format(DateTime.now())),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        final scaffoldContext = shellScaffoldKey.currentContext;
        if (scaffoldContext == null) return;
        showModalBottomSheet(
          context: scaffoldContext,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (context) => const DateTimeFormatSheet(),
        );
      },
    );
  }
}

class DateTimeFormatSheet extends ConsumerStatefulWidget {
  const DateTimeFormatSheet({super.key});

  @override
  ConsumerState<DateTimeFormatSheet> createState() =>
      _DateTimeFormatSheetState();
}

class _DateTimeFormatSheetState extends ConsumerState<DateTimeFormatSheet> {
  late TextEditingController _controller;
  String _previewPattern = '';

  final List<String> _presets = const [
    'dd MMM y',
    'EEEE dd MMM',
    'MM/dd/y',
    'y-MM-dd',
    'dd/MM/yy',
  ];

  @override
  void initState() {
    super.initState();
    _previewPattern = ref.read(dateTimeFormatProvider);
    _controller = TextEditingController(text: _previewPattern);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isValid(String pattern) {
    if (pattern.isEmpty) return false;
    try {
      DateFormat(pattern).format(DateTime.now());
      return true;
    } catch (_) {
      return false;
    }
  }

  void _saveAndClose(String pattern) {
    if (_isValid(pattern)) {
      ref.read(appSettingsProvider.notifier).setDateTimeFormat(pattern);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;
    final isValid = _isValid(_previewPattern);

    return SingleChildScrollView(
      padding: .only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: RadioGroup(
        groupValue: _previewPattern,
        onChanged: (val) => val != null ? _saveAndClose(val) : null,
        child: Column(
          mainAxisSize: .min,
          children: [
            ..._presets.map(
              (fmt) => RadioListTile<String>(
                title: Text(fmt),
                subtitle: Text(DateFormat(fmt).format(DateTime.now())),
                value: fmt,
              ),
            ),
            const Divider(indent: 16, endIndent: 16),
            Padding(
              padding: const .fromLTRB(16, 8, 16, 32),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const .all(16),
                    decoration: BoxDecoration(
                      color: isValid
                          ? scheme.primaryContainer
                          : scheme.errorContainer,
                      borderRadius: kBorderRadius,
                    ),
                    child: Text(
                      isValid
                          ? DateFormat(_previewPattern).format(DateTime.now())
                          : l.invalidFormat,
                      style: TextStyle(
                        color: isValid
                            ? scheme.onPrimaryContainer
                            : scheme.onErrorContainer,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: l.customPattern,
                      hintText: 'e.g. HH:mm:ss',
                      suffixIcon: isValid
                          ? IconButton(
                              icon: const Icon(Icons.save),
                              onPressed: () => _saveAndClose(_previewPattern),
                            )
                          : Icon(Icons.error, color: scheme.error),
                    ),
                    onChanged: (val) => setState(() => _previewPattern = val),
                    onSubmitted: _saveAndClose,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
