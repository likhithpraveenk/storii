import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/settings/ui/appearance/font_family.dart';
import 'package:storii/features/settings/ui/appearance/font_scale.dart';

class AppearanceTile extends ConsumerWidget {
  const AppearanceTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final subtitle = switch (themeMode) {
      .system => l10n.system,
      .light => l10n.light,
      .dark => l10n.dark,
    };

    return ListTile(
      trailing: const Icon(Icons.chevron_right),
      leading: const Icon(Icons.settings_brightness_outlined),
      title: Text(l10n.appearance),
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

        title: Text(
          l10n.appearance,
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
                  label: Text(l10n.system),
                ),
                ButtonSegment(
                  value: ThemeMode.light,
                  icon: const Icon(Icons.light_mode),
                  label: Text(l10n.light),
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  icon: const Icon(Icons.dark_mode),
                  label: Text(l10n.dark),
                ),
              ],
              selected: {themeMode},
              onSelectionChanged: (mode) {
                notifier.setThemeMode(mode.first);
              },
            ),
          ),
          SwitchListTile(
            title: Text(l10n.pureBlack),
            subtitle: Text(l10n.pureBlackSubtitle),
            value: isPureBlack,
            onChanged: notifier.setUsePureBlack,
          ),
          SwitchListTile(
            title: Text(l10n.systemTheme),
            subtitle: Text(l10n.systemThemeSubtitle),
            value: isDynamic,
            onChanged: notifier.setUseDynamicColor,
          ),
          const FontFamilyTile(),
          const FontScaleTile(),
        ],
      ),
    );
  }
}
