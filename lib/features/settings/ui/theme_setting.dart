import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';

class ThemeSetting extends ConsumerWidget {
  const ThemeSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    final notifier = ref.read(appSettingsProvider.notifier);

    return ListTile(
      leading: Icon(_getIconForTheme(currentTheme)),
      title: Text(
        AppLocalizations.of(context)!.theme,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      trailing: DropdownMenu<AppTheme>(
        // width: 150,
        initialSelection: currentTheme,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          border: AppStyles.inputBorder.copyWith(borderSide: .none),
        ),
        onSelected: (val) => val != null ? notifier.setTheme(val) : null,
        dropdownMenuEntries: AppTheme.values.map((theme) {
          return DropdownMenuEntry(value: theme, label: theme.displayName);
        }).toList(),
      ),
    );
  }

  IconData _getIconForTheme(AppTheme theme) {
    return switch (theme) {
      AppTheme.light => Icons.wb_sunny_outlined,
      AppTheme.dark => Icons.nightlight_round_outlined,
      AppTheme.amoled => Icons.dark_mode_rounded,
      AppTheme.system => Icons.settings_brightness_outlined,
    };
  }
}
