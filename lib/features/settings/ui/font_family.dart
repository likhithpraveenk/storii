import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/settings/logic/user_fonts.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/waveform.dart';
import 'package:storii/storage/local/font_service.dart';

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
      onTap: () {
        final scaffoldContext = shellScaffoldKey.currentContext;
        if (scaffoldContext == null) return;
        showModalBottomSheet(
          context: scaffoldContext,
          isScrollControlled: true,
          showDragHandle: true,
          builder: (context) => const FontFamilySheet(),
        );
      },
    );
  }
}

class FontFamilySheet extends ConsumerWidget {
  const FontFamilySheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFont = ref.watch(fontFamilyProvider);
    final userFontsAsync = ref.watch(userFontsProvider);

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
            ListTile(
              leading: const Icon(Icons.folder_open),
              title: const Text('Add Fonts'),
              onTap: () async {
                if (Platform.isAndroid) {
                  await Permission.storage.request();
                }

                await FontService.importFonts();
                ref.invalidate(userFontsProvider);
              },
            ),
            const Divider(),
            RadioListTile<String>(
              title: Text(
                AppLocalizations.of(context)!.system,
                style: const TextStyle(fontSize: 18),
              ),
              value: 'system',
            ),
            const RadioListTile<String>(
              title: Text(
                'AtkinsonHyperlegibleNext',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'AtkinsonHyperlegibleNext',
                ),
              ),
              value: 'AtkinsonHyperlegibleNext',
            ),
            userFontsAsync.when(
              data: (fonts) {
                if (fonts.isEmpty) {
                  return const SizedBox.shrink();
                }
                return Column(
                  mainAxisSize: .min,
                  children: fonts.map((font) {
                    return RadioListTile<String>(
                      title: Text(
                        font,
                        style: TextStyle(fontSize: 18, fontFamily: font),
                      ),
                      value: font,
                    );
                  }).toList(),
                );
              },
              loading: () => const Center(child: RandomWaveform()),
              error: (_, _) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
