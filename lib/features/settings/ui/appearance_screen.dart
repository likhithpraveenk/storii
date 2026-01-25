import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';

class AppearanceTile extends ConsumerWidget {
  const AppearanceTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final themeMode = ref.watch(themeModeProvider);
    final subtitle = switch (themeMode) {
      .system => l.system,
      .light => l.light,
      .dark => l.dark,
    };

    return ListTile(
      shape: AppStyles.roundedRect,
      trailing: const Icon(Icons.chevron_right),
      leading: const Icon(Icons.settings_brightness),
      title: Text(l.appearance),
      subtitle: Text(subtitle),
      onTap: () {
        context.push(AppRoute.appearanceSettings.path);
      },
    );
  }
}

class AppearanceScreen extends ConsumerWidget {
  const AppearanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final isDynamic = ref.watch(useDynamicColorProvider);
    final isPureBlack = ref.watch(usePureBlackProvider);
    final notifier = ref.read(appSettingsProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        titleSpacing: 0,
        title: Text(
          AppLocalizations.of(context)!.appearance,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const .symmetric(horizontal: 16),
            child: SegmentedButton<ThemeMode>(
              segments: [
                ButtonSegment(
                  value: ThemeMode.system,
                  icon: const Icon(Icons.settings_brightness),
                  label: Text(AppLocalizations.of(context)!.system),
                ),
                ButtonSegment(
                  value: ThemeMode.light,
                  icon: const Icon(Icons.light_mode),
                  label: Text(AppLocalizations.of(context)!.light),
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  icon: const Icon(Icons.dark_mode),
                  label: Text(AppLocalizations.of(context)!.dark),
                ),
              ],
              selected: {themeMode},
              onSelectionChanged: (mode) {
                notifier.setThemeMode(mode.first);
              },
            ),
          ),
          SwitchListTile(
            title: Text(AppLocalizations.of(context)!.pureBlack),
            subtitle: Text(AppLocalizations.of(context)!.pureBlackSubtitle),
            value: isPureBlack,
            onChanged: notifier.setUsePureBlack,
          ),
          SwitchListTile(
            title: Text(AppLocalizations.of(context)!.systemTheme),
            subtitle: Text(AppLocalizations.of(context)!.systemThemeSubtitle),
            value: isDynamic,
            onChanged: notifier.setUseDynamicColor,
          ),
        ],
      ),
    );
  }
}
