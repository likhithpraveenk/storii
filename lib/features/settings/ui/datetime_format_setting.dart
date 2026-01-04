import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class DateTimeFormatSetting extends ConsumerWidget {
  const DateTimeFormatSetting({super.key});

  final List<String> _presets = const [
    'dd MMM y',
    'EEEE dd MMM',
    'MM/dd/y',
    'y-MM-dd',
    'dd/MM/yy',
  ];

  bool _isValidFormat(String pattern) {
    try {
      DateFormat(pattern).format(DateTime.now());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFormat = ref.watch(dateTimeFormatProvider);
    final notifier = ref.read(appSettingsProvider.notifier);
    final isCustom = !_presets.contains(currentFormat);
    final scheme = Theme.of(context).colorScheme;
    final l = AppLocalizations.of(context)!;

    return Card(
      color: scheme.surfaceContainerHighest.withValues(alpha: 0.5),
      shape: AppStyles.roundedRect,
      child: ListTile(
        leading: const Icon(Icons.calendar_month_outlined),
        title: Text(
          l.dateFormat,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subtitle: Text(
          DateFormat(currentFormat).format(DateTime.now()),
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        trailing: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: isCustom ? 'custom' : currentFormat,
            isDense: true,
            alignment: AlignmentDirectional.centerEnd,
            items: [
              ..._presets.map(
                (fmt) => DropdownMenuItem(value: fmt, child: Text(fmt)),
              ),
              DropdownMenuItem(value: 'custom', child: Text(l.custom)),
            ],
            onChanged: (val) {
              if (val == 'custom') {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: AppStyles.roundedRect,
                  builder: (context) {
                    String tempFormat = currentFormat;

                    return StatefulBuilder(
                      builder: (context, setState) {
                        final isValid = _isValidFormat(tempFormat);
                        final previewText = isValid
                            ? DateFormat(tempFormat).format(DateTime.now())
                            : l.invalidFormat;

                        return SafeArea(
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(
                              context,
                            ).add(const .all(24)),
                            child: Column(
                              mainAxisSize: .min,
                              crossAxisAlignment: .start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: const .symmetric(horizontal: 12),
                                  child: Text(
                                    previewText,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: isValid
                                          ? scheme.onPrimaryContainer
                                          : scheme.onErrorContainer,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: l.customPattern,
                                    hintText: 'e.g. EEEE, MMM d',
                                    isDense: true,
                                    border: AppStyles.inputBorder,
                                    suffixIcon: isValid
                                        ? Icon(
                                            Icons.check_circle,
                                            color: scheme.primary,
                                          )
                                        : Icon(
                                            Icons.error,
                                            color: scheme.error,
                                          ),
                                  ),
                                  onChanged: (val) {
                                    setState(() => tempFormat = val);
                                  },
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  width: double.infinity,
                                  child: AppFilledButton(
                                    text: l.save,
                                    onPressed: () {
                                      if (_isValidFormat(tempFormat)) {
                                        notifier.setDateTimeFormat(tempFormat);
                                        Navigator.of(context).pop();
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              } else if (val != null) {
                notifier.setDateTimeFormat(val);
              }
            },
          ),
        ),
      ),
    );
  }
}
