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
        trailing: DropdownButton<String?>(
          value: currentLocale,
          isDense: true,
          padding: const .all(8),
          borderRadius: .circular(8),
          underline: const SizedBox(),
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: (v) {
            if (v != null) {
              notifier.setLocaleCode(v);
            }
          },
          items: Languages.values.map((l) {
            return DropdownMenuItem(value: l.name, child: Text(l.displayName));
          }).toList(),
        ),
      ),
    );
  }
}
