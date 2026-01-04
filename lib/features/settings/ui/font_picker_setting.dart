import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/config/fonts.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';

class FontPickerSetting extends ConsumerWidget {
  const FontPickerSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontFamily = ref.watch(fontFamilyProvider);
    final notifier = ref.read(appSettingsProvider.notifier);
    final l = AppLocalizations.of(context)!;

    return Card(
      color: Theme.of(
        context,
      ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      shape: AppStyles.roundedRect,
      child: ListTile(
        leading: const Icon(Icons.font_download_outlined),
        title: Text(
          l.fontFamily,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subtitle: Text(
          fontFamily ?? l.system,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: const Icon(Icons.chevron_right),
        shape: AppStyles.roundedRect,
        onTap: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: AppStyles.roundedRect,
          builder: (context) {
            return DraggableScrollableSheet(
              initialChildSize: 0.6,
              maxChildSize: 0.9,
              expand: false,
              builder: (context, scrollController) {
                return Column(
                  children: [
                    Padding(
                      padding: const .all(16),
                      child: Text(
                        l.fontFamily,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const Divider(height: 1),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        children: [
                          ListTile(
                            title: Text(
                              l.system,
                              style: const TextStyle(fontSize: 18),
                            ),
                            trailing: fontFamily == null
                                ? const Icon(
                                    Icons.check_circle,
                                    color: Colors.blue,
                                  )
                                : null,
                            selected: fontFamily == null,
                            onTap: () {
                              notifier.setFontFamily(null);
                              Navigator.pop(context);
                            },
                          ),
                          ...AppFonts.availableFonts.map((font) {
                            final isSelected = fontFamily == font;

                            return ListTile(
                              title: Text(
                                font,
                                style: GoogleFonts.getFont(font, fontSize: 18),
                              ),
                              trailing: isSelected
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Colors.blue,
                                    )
                                  : null,
                              selected: isSelected,
                              onTap: () {
                                notifier.setFontFamily(font);
                                Navigator.pop(context);
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
