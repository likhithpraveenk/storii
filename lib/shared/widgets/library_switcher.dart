import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/user_libraries_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/waveform.dart';

class LibrarySwitcher extends ConsumerWidget {
  const LibrarySwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final activeLibraryAsync = ref.watch(activeLibraryProvider);

    return activeLibraryAsync.when(
      data: (activeLibrary) => TextButton(
        onPressed: () => _showPicker(context, ref),
        style: TextButton.styleFrom(
          padding: const .fromLTRB(16, 8, 8, 8),
          shape: RoundedRectangleBorder(borderRadius: .circular(24)),
          textStyle: Theme.of(context).textTheme.titleLarge,
        ),
        child: Row(
          mainAxisSize: .min,
          children: [
            Flexible(
              child: Text(activeLibrary.name, overflow: .ellipsis, maxLines: 1),
            ),
            const Icon(Icons.expand_more),
          ],
        ),
      ),
      loading: () => const SizedBox.shrink(),
      error: (err, stack) => Text(l.noLibrary),
    );
  }

  void _showPicker(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final librariesAsync = ref.watch(userLibrariesProvider);

        return SafeArea(
          child: librariesAsync.when(
            data: (libs) => ListView(
              shrinkWrap: true,
              children: libs
                  .map(
                    (lib) => ListTile(
                      title: Text(
                        lib.name,
                        maxLines: 1,
                        overflow: .ellipsis,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      leading:
                          ref.read(activeLibraryProvider).value?.id == lib.id
                          ? const Icon(Icons.check)
                          : null,
                      trailing: Text(
                        lib.mediaContent.getDisplayString(context),
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 1,
                        overflow: .ellipsis,
                      ),
                      onTap: () {
                        ref
                            .read(userSettingsProvider.notifier)
                            .setCurrentLibraryId(lib.id);
                        Navigator.pop(context);
                      },
                    ),
                  )
                  .toList(),
            ),
            loading: () => const Center(child: RandomWaveform()),
            error: (err, _) => Center(child: Text(err.toString())),
          ),
        );
      },
    );
  }
}
