import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/user_libraries_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class LibrarySwitcher extends ConsumerWidget {
  const LibrarySwitcher({super.key, required this.user});

  final UserDomain user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final librariesAsync = ref.watch(userLibrariesProvider);
    final libraryId = ref.watch(currentLibraryIdProvider(user.id));

    return librariesAsync.when(
      error: (e, _) => ErrorRetryWidget(
        '$e',
        onRetry: () => ref.invalidate(userLibrariesProvider),
      ),
      loading: () => const ListTile(title: Center(child: RandomWaveform())),
      data: (libraries) {
        if (libraries.isEmpty) {
          return ListTile(
            leading: const Icon(Icons.local_library),
            title: Text(l.noLibrary),
            trailing: const Icon(Icons.arrow_drop_down),
          );
        }
        final selectedId = libraries.any((l) => l.id == libraryId)
            ? libraryId
            : libraries.isNotEmpty
            ? libraries.first.id
            : null;
        return Stack(
          children: [
            ListTile(
              leading: const Icon(Icons.local_library),
              title: Text(
                libraries
                    .firstWhere(
                      (l) => l.id == selectedId,
                      orElse: () => libraries.first,
                    )
                    .name,
              ),
              trailing: const Icon(Icons.arrow_drop_down),
            ),
            Positioned.fill(
              child: DropdownButton<String>(
                value: selectedId,
                selectedItemBuilder: (_) => [],
                icon: const SizedBox.shrink(),
                underline: const SizedBox(),
                style: Theme.of(context).textTheme.bodyLarge,
                items: [
                  for (final library in libraries)
                    DropdownMenuItem<String>(
                      value: library.id,
                      child: Text(library.name),
                    ),
                ],
                onChanged: libraries.isEmpty
                    ? null
                    : (id) {
                        if (id == null) return;
                        ref
                            .read(userSettingsProvider(user.id).notifier)
                            .setCurrentLibraryId(id);
                      },
              ),
            ),
          ],
        );
      },
    );
  }
}
