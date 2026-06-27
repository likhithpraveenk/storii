import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/settings/logic/dynamic_colors.dart';

class SystemThemeTile extends ConsumerWidget {
  const SystemThemeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDynamic = ref.watch(useDynamicColorProvider);
    final asyncColors = ref.watch(dynamicColorsProvider);
    final selectedColor = ref.watch(systemColorProvider);
    final notifier = ref.read(appSettingsProvider.notifier);

    return Column(
      crossAxisAlignment: .start,
      children: [
        SwitchListTile(
          title: Text(l10n.systemTheme),
          subtitle: Text(l10n.systemThemeSubtitle),
          value: isDynamic,
          onChanged: (value) {
            notifier.setUseDynamicColor(value);
            asyncColors.whenData((colors) {
              notifier.setSystemColor(value ? colors.firstOrNull : null);
            });
          },
        ),
        if (isDynamic)
          Padding(
            padding: const .symmetric(horizontal: 16, vertical: 8),
            child: asyncColors.when(
              data: (colors) => Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(colors.length, (i) {
                  final color = colors.elementAt(i);
                  final isSelected = color == selectedColor;
                  return GestureDetector(
                    onTap: () {
                      notifier.setSystemColor(color);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        shape: .circle,
                        border: isSelected
                            ? .all(
                                color: Theme.of(
                                  context,
                                ).colorScheme.inverseSurface,
                                width: 4,
                              )
                            : null,
                      ),
                    ),
                  );
                }),
              ),
              loading: () => const SizedBox.shrink(),
              error: (_, _) => const SizedBox.shrink(),
            ),
          ),
      ],
    );
  }
}
