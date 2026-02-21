import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/globals.dart';
import 'package:storii/l10n/l10n.dart';

class LanguageSelectorTile extends ConsumerWidget {
  const LanguageSelectorTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeCodeProvider);
    final currentLanguageLabel = Languages.values
        .firstWhere(
          (lang) => lang.name == currentLocale,
          orElse: () => Languages.values.first,
        )
        .displayName;

    return ListTile(
      leading: const Icon(Icons.language_outlined),
      title: Text(AppLocalizations.of(context)!.language),
      subtitle: Text(currentLanguageLabel),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        final scaffoldContext = shellScaffoldKey.currentContext;
        if (scaffoldContext == null) return;
        showModalBottomSheet(
          context: scaffoldContext,
          isScrollControlled: true,
          showDragHandle: true,
          builder: (context) => const LanguageBottomSheet(),
        );
      },
    );
  }
}

class LanguageBottomSheet extends ConsumerWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeCodeProvider);

    return Column(
      mainAxisSize: .min,
      children: [
        Padding(
          padding: const .symmetric(horizontal: 16),
          child: Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        RadioGroup<String>(
          groupValue: currentLocale,
          onChanged: (value) {
            if (value != null) {
              ref.read(appSettingsProvider.notifier).setLocaleCode(value);
              Navigator.pop(context);
            }
          },
          child: Column(
            children: [
              ...Languages.values.map((lang) {
                return RadioListTile<String>(
                  title: Text(lang.displayName),
                  value: lang.name,
                );
              }),
            ],
          ),
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
