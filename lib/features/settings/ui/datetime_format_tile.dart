import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class DateTimeFormatTile extends ConsumerWidget {
  const DateTimeFormatTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFormat = ref.watch(dateTimeFormatProvider);

    return ListTile(
      leading: const Icon(Icons.calendar_month_outlined),
      title: Text(l10n.dateFormat),
      subtitle: Text(DateFormat(currentFormat).format(DateTime.now())),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        final scaffoldContext = shellScaffoldKey.currentContext;
        if (scaffoldContext == null) return;
        AppBottomSheet.show(
          scaffoldContext,
          title: l10n.dateFormat,
          body: const DateTimeFormatSheet(),
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

  @override
  Widget build(BuildContext context) {
    final isValid = _isValid(_previewPattern);

    return Padding(
      padding: .only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        children: [
          ..._presets.map(
            (fmt) => ListTile(
              title: Text(fmt),
              trailing: fmt == _previewPattern ? const Icon(Icons.check) : null,
              onTap: () {
                setState(() => _previewPattern = fmt);
              },
              contentPadding: const .symmetric(horizontal: 24),
            ),
          ),
          const Divider(indent: 24, endIndent: 24),
          _PreviewBox(isValid: isValid, previewPattern: _previewPattern),
          Padding(
            padding: const .all(24),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: l10n.customPattern),
              onChanged: (val) => setState(() => _previewPattern = val),
              textInputAction: .done,
              onSubmitted: (_) {
                FocusScope.of(context).unfocus();
              },
            ),
          ),
          // TODO: launch url for learn more
          // https://api.flutter.dev/flutter/package-intl_intl/DateFormat-class.html
          Padding(
            padding: const .fromLTRB(24, 8, 24, 36),
            child: SizedBox(
              width: double.infinity,
              child: AppFilledButton(
                text: l10n.save,
                onPressed: () async {
                  if (_isValid(_previewPattern)) {
                    await ref
                        .read(userSettingsProvider.notifier)
                        .setDateTimeFormat(_previewPattern);
                    if (context.mounted) Navigator.pop(context);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PreviewBox extends StatelessWidget {
  const _PreviewBox({required this.isValid, required this.previewPattern});

  final bool isValid;
  final String previewPattern;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const .all(16),
      margin: const .symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: isValid
            ? colorScheme.primaryContainer
            : colorScheme.errorContainer,
        borderRadius: .circular(kRadius),
      ),
      child: Text(
        isValid
            ? DateFormat(previewPattern).format(DateTime.now())
            : l10n.invalidFormat,
        style: TextStyle(
          color: isValid
              ? colorScheme.onPrimaryContainer
              : colorScheme.onErrorContainer,
          fontWeight: .bold,
          fontFamily: 'monospace',
        ),
      ),
    );
  }
}
