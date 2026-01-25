import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/config/fonts.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';

class FontFamilyTile extends ConsumerWidget {
  const FontFamilyTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontFamily = ref.watch(fontFamilyProvider);

    return ListTile(
      leading: const Icon(Icons.font_download),
      title: Text(AppLocalizations.of(context)!.fontFamily),
      subtitle: Text(fontFamily ?? AppLocalizations.of(context)!.system),
      trailing: const Icon(Icons.chevron_right),
      shape: AppStyles.roundedRect,
      onTap: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (context) => const FontFamilySheet(),
      ),
    );
  }
}

class FontFamilySheet extends ConsumerWidget {
  const FontFamilySheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFont = ref.watch(fontFamilyProvider);

    return SingleChildScrollView(
      child: RadioGroup(
        groupValue: currentFont ?? 'system',
        onChanged: (val) {
          if (val == 'system') {
            ref.read(appSettingsProvider.notifier).setFontFamily(null);
          } else {
            ref.read(appSettingsProvider.notifier).setFontFamily(val);
          }
          Navigator.pop(context);
        },
        child: Column(
          children: [
            RadioListTile<String>(
              title: Text(
                AppLocalizations.of(context)!.system,
                style: const TextStyle(fontSize: 18),
              ),
              value: 'system',
            ),
            ...AppFonts.available.entries.map((entry) {
              final key = entry.key;
              final builder = entry.value;

              final previewStyle = builder(
                Theme.of(context).textTheme,
              ).titleMedium?.copyWith(fontSize: 18);

              return RadioListTile<String>(
                title: Text(key, style: previewStyle),
                value: key,
              );
            }),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
