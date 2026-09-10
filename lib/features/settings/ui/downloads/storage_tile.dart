import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/storage_location.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/storage_locations_provider.dart';
import 'package:storii/features/settings/ui/settings_header.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/app_dialog.dart';

class StorageTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SettingsHeader(
      title: l10n.storage,
      children: [
        ListTile(
          trailing: const Icon(Icons.chevron_right),
          leading: const Icon(Icons.auto_stories_rounded),
          title: Text(l10n.audiobooks),
          onTap: () {
            showModalBottomSheet(
              context: context,
              useSafeArea: true,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: .vertical(top: .circular(24)),
              ),
              builder: (_) => SafeArea(
                child: DecoratedBox(
                  decoration: bottomSheetDecoration(context),
                  child: const _StorageTileSheet(mediaType: .book),
                ),
              ),
            );
          },
        ),
        ListTile(
          trailing: const Icon(Icons.chevron_right),
          leading: const Icon(Icons.podcasts_rounded),
          title: Text(l10n.podcasts),
          onTap: () {
            showModalBottomSheet(
              context: context,
              useSafeArea: true,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: .vertical(top: .circular(24)),
              ),
              builder: (_) => SafeArea(
                child: DecoratedBox(
                  decoration: bottomSheetDecoration(context),
                  child: const _StorageTileSheet(mediaType: .podcast),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _StorageTileSheet extends ConsumerStatefulWidget {
  const new({required this.mediaType});

  final MediaType mediaType;

  @override
  ConsumerState<_StorageTileSheet> createState() => _StorageTileSheetState();
}

class _StorageTileSheetState extends ConsumerState<_StorageTileSheet> {
  @override
  Widget build(BuildContext context) {
    final locations = ref.watch(
      storageLocationsByTypeProvider(widget.mediaType),
    );
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: .min,
      children: [
        Padding(
          padding: const .fromLTRB(24, 24, 24, 16),
          child: Text(
            widget.mediaType == .book ? l10n.audiobooks : l10n.podcasts,
            style: bottomSheetTitleTextStyle(context),
            textAlign: .center,
          ),
        ),
        Flexible(
          child: ListView(
            shrinkWrap: true,
            children: locations.map((location) {
              return ListTile(
                leading: Icon(
                  location.isInternal ? Icons.memory : Icons.sd_card_outlined,
                ),
                title: Text(
                  location.isInternal ? l10n.internalAppStorage : location.name,
                ),
                subtitle: Text(location.uri.toUiPath(context)),
                contentPadding: const .symmetric(horizontal: 16),
                trailing: !location.isInternal
                    ? IconButton(
                        icon: Icon(Icons.delete_outline, color: scheme.error),
                        onPressed: () async {
                          await AppDialog.show(
                            context,
                            title: l10n.removeLocationQ,
                            body: Text(
                              l10n.removeLocationSubtitle,
                              style: textTheme.bodyLarge,
                            ),
                            actionLabel: l10n.delete,
                            actionIcon: Icons.delete,
                            isDestructive: true,
                            onTap: () async {
                              final current = ref.read(
                                storageLocationsProvider,
                              );
                              final updated = current
                                  .where((l) => l != location)
                                  .toList();
                              await ref
                                  .read(appSettingsProvider.notifier)
                                  .setStorageLocations(updated);
                            },
                          );
                        },
                      )
                    : null,
              );
            }).toList(),
          ),
        ),
        Padding(
          padding: const .fromLTRB(24, 16, 24, 24),
          child: SizedBox(
            width: double.infinity,
            child: AppOutlinedButton(
              icon: const Icon(Icons.folder_open),
              text: l10n.addFolder,
              onPressed: () async {
                final folder = await safUtil.pickDirectory(
                  writePermission: true,
                  persistablePermission: true,
                );
                if (folder == null) return;
                final newLocation = StorageLocation(
                  name: folder.name,
                  uri: folder.uri,
                  mediaType: widget.mediaType == .book ? .audiobook : .podcast,
                );
                final current = ref.read(storageLocationsProvider);
                final updated = [...current, newLocation];
                await ref
                    .read(appSettingsProvider.notifier)
                    .setStorageLocations(updated);
              },
            ),
          ),
        ),
      ],
    );
  }
}
