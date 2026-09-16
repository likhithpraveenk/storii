import 'package:abs_api/abs_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:saf_util/saf_util.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/storage_location.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/storage_locations_provider.dart';
import 'package:storii/features/settings/logic/folder_permission.dart';
import 'package:storii/features/settings/ui/settings_header.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/app_dialog.dart';
import 'package:storii/storage/local/downloads_store.dart';

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
            children: [...locations.map(_StorageLocationWidget.new)],
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
                final folder = await SafUtil().pickDirectory(
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
                final alreadyExists = current.any(
                  (l) => l.uri == newLocation.uri,
                );
                final updated = alreadyExists
                    ? current
                    : [...current, newLocation];
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

class _StorageLocationWidget extends ConsumerWidget {
  const new(this.location);

  final StorageLocation location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final hasPermission =
        ref.watch(checkFolderPermissionProvider(location)).value ?? true;
    return ListTile(
      onTap: () async {
        if (hasPermission) return;
        final folder = await SafUtil().pickDirectory(
          writePermission: true,
          persistablePermission: true,
        );
        if (folder?.uri == location.uri) {
          ref.invalidate(checkFolderPermissionProvider(location));
        } else if (folder != null) {
          await SafUtil().releasePersistedPermission(folder.uri, write: true);
        }
      },
      leading: location.isInternal
          ? const Icon(Icons.memory)
          : Icon(
              hasPermission ? Icons.sd_card_outlined : Icons.warning_rounded,
              color: hasPermission ? null : theme.colorScheme.error,
            ),
      title: Text(
        location.isInternal ? l10n.internalAppStorage : location.name,
      ),
      subtitle: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Text(location.uri.toUiPath(context)),
          if (!hasPermission)
            Text(
              l10n.permissionRevoked,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
        ],
      ),
      contentPadding: const .symmetric(horizontal: 16),
      trailing: !location.isInternal
          ? IconButton(
              icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
              onPressed: () async {
                await AppDialog.show(
                  context,
                  title: l10n.removeLocationQ,
                  body: Text(
                    l10n.removeLocationSubtitle,
                    style: theme.textTheme.bodyLarge,
                  ),
                  actionLabel: l10n.delete,
                  actionIcon: Icons.delete,
                  isDestructive: true,
                  onTap: () async {
                    await ref
                        .read(downloadsStoreProvider.notifier)
                        .removeAllFromLocation(location.uri);
                    final current = ref.read(storageLocationsProvider);
                    final updated = current
                        .where((l) => l != location)
                        .toList();
                    await ref
                        .read(appSettingsProvider.notifier)
                        .setStorageLocations(updated);
                    await SafUtil().releasePersistedPermission(
                      location.uri,
                      write: true,
                    );
                  },
                );
              },
            )
          : null,
    );
  }
}
