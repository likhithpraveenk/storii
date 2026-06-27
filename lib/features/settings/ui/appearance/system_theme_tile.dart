import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/settings/logic/dynamic_colors.dart';

class SystemThemeTile extends ConsumerWidget {
  const SystemThemeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDynamic = ref.watch(useDynamicColorProvider);
    final asyncColors = ref.watch(dynamicColorsProvider);
    final appColor = ref.watch(appColorProvider);
    final notifier = ref.read(appSettingsProvider.notifier);

    return Column(
      crossAxisAlignment: .start,
      children: [
        SwitchListTile(
          title: Text(l10n.systemTheme),
          subtitle: Text(l10n.systemThemeSubtitle),
          value: isDynamic,
          onChanged: (useDynamic) {
            notifier.setUseDynamicColor(useDynamic);
            if (useDynamic) {
              asyncColors.whenData((colors) {
                if (colors.isNotEmpty) {
                  notifier.setAppColor(colors.first);
                }
              });
            } else {
              notifier.setAppColor(appPrimaryColor);
            }
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
                  final isSelected = color == appColor;
                  return GestureDetector(
                    onTap: () {
                      notifier.setAppColor(color);
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
