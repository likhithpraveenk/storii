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

    return Card(
      color: Theme.of(
        context,
      ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      shape: AppStyles.roundedRect,
      child: ListTile(
        leading: Icon(_getIconForTheme(currentTheme)),
        title: Text(
          AppLocalizations.of(context)!.theme,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        trailing: DropdownButton<AppTheme>(
          value: currentTheme,
          isDense: true,
          borderRadius: .circular(8),
          padding: const .all(8),
          underline: const SizedBox(),
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: (val) => val != null ? notifier.setTheme(val) : null,
          items: AppTheme.values.map((theme) {
            return DropdownMenuItem(
              value: theme,
              child: Text(theme.displayName),
            );
          }).toList(),
        ),
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
