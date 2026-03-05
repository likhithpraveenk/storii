import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/user_libraries_provider.dart';
import 'package:storii/globals.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/waveform.dart';

class LibrarySwitcher extends ConsumerWidget {
  const LibrarySwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final libraryDetailsAsync = ref.watch(activeLibraryDetailsProvider);

    return libraryDetailsAsync.when(
      data: (details) => TextButton(
        onPressed: () => _showPicker(details.library.id),
        style: TextButton.styleFrom(
          padding: const .fromLTRB(16, 8, 8, 8),
          shape: RoundedRectangleBorder(borderRadius: .circular(24)),
          textStyle: Theme.of(context).textTheme.titleLarge,
        ),
        child: Row(
          mainAxisSize: .min,
          children: [
            Flexible(
              child: Text(
                details.library.name,
                overflow: .ellipsis,
                maxLines: 1,
              ),
            ),
            const Icon(Icons.expand_more),
          ],
        ),
      ),
      loading: () => const SizedBox.shrink(),
      error: (err, stack) => Text(l.noLibrary),
    );
  }

  void _showPicker(String libraryId) {
    final scaffoldContext = shellScaffoldKey.currentContext;
    if (scaffoldContext == null) return;
    showModalBottomSheet(
      context: scaffoldContext,
      useSafeArea: true,
      showDragHandle: true,
      builder: (_) => Consumer(
        builder: (context, ref, _) {
          final librariesAsync = ref.watch(userLibrariesProvider);
          return librariesAsync.when(
            data: (libs) => Column(
              mainAxisSize: .min,
              children: [
                ...libs.map(
                  (lib) => ListTile(
                    leading: Icon(
                      lib.mediaType == .book
                          ? Icons.auto_stories_rounded
                          : Icons.podcasts_rounded,
                    ),
                    title: Text(
                      lib.name,
                      maxLines: 1,
                      overflow: .ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    trailing: libraryId == lib.id
                        ? const Icon(Icons.check)
                        : null,
                    onTap: () {
                      ref
                          .read(userSettingsProvider.notifier)
                          .setCurrentLibrary(lib);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
            loading: () => const SizedBox(
              height: 120,
              child: Center(child: RandomWaveform()),
            ),
            error: (err, _) => Center(child: Text(err.toString())),
          );
        },
      ),
    );
  }
}
