import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';

class LanguageSelectorSetting extends ConsumerWidget {
  const LanguageSelectorSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeCodeProvider);
    final notifier = ref.read(appSettingsProvider.notifier);

    return Card(
      shape: AppStyles.roundedRect,
      color: Theme.of(
        context,
      ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      child: ListTile(
        leading: const Icon(Icons.language),
        title: Text(
          AppLocalizations.of(context)!.language,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        trailing: DropdownMenu<String?>(
          initialSelection: currentLocale,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            contentPadding: const .symmetric(horizontal: 12, vertical: 8),
            fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
            border: AppStyles.inputBorder,
          ),
          onSelected: (v) {
            if (v != null) {
              notifier.setLocaleCode(v);
            }
          },
          dropdownMenuEntries: Languages.values.map((l) {
            return DropdownMenuEntry(value: l.name, label: l.displayName);
          }).toList(),
        ),
      ),
    );
  }
}
