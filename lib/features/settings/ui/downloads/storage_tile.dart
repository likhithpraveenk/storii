import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:saf_util/saf_util.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/storage_location.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/logic/storage_locations_provider.dart';
import 'package:storii/features/settings/logic/folder_permission.dart';
import 'package:storii/features/settings/ui/settings_header.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/helpers/helpers.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/shared/widgets/app_dialog.dart';
import 'package:storii/storage/local/downloads_store.dart';

class StorageTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useBinary = ref.watch(useBinaryBytesProvider);
    final books = ref.watch(storageSpaceByTypeProvider(.audiobook));
    final podcasts = ref.watch(storageSpaceByTypeProvider(.podcast));

    final hasBooks = books.count > 0;
    final hasPodcasts = podcasts.count > 0;

    final bookBytes = formatBytes(books.size, useBinary: useBinary);
    final podcastBytes = formatBytes(podcasts.size, useBinary: useBinary);

    final bookStr = '$bookBytes (${books.count})';
    final podcastStr = '$podcastBytes (${podcasts.count})';

    return SettingsHeader(
      title: l10n.storage,
      children: [
        ListTile(
          trailing: const Icon(Icons.chevron_right),
          leading: const Icon(Icons.auto_stories_rounded),
          title: Text(l10n.audiobooks),
          subtitle: hasBooks ? Text(bookStr) : null,
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
          subtitle: hasPodcasts ? Text(podcastStr) : null,
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
    final bytes = ref.watch(storageBytesByLocationProvider(location));
    final useBinary = ref.watch(useBinaryBytesProvider);
    final defaultUri = location.mediaType == .audiobook
        ? ref.watch(defaultDownloadsLocationAudiobooksProvider)
        : ref.watch(defaultDownloadsLocationPodcastsProvider);
    final isDefault = defaultUri == location.uri;

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
          const SizedBox(height: 4),
          if (hasPermission)
            Row(
              mainAxisSize: .min,
              children: [
                Icon(
                  Icons.storage_outlined,
                  size: 14,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Text(
                  formatBytes(bytes, useBinary: useBinary),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                if (isDefault) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const .symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: .circular(4),
                    ),
                    child: Text(
                      l10n.defaultWord,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ],
              ],
            )
          else
            Text(
              l10n.permissionRevoked,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
        ],
      ),
      contentPadding: const .symmetric(horizontal: 16),
      trailing: Row(
        mainAxisSize: .min,
        children: [
          if (!location.isInternal)
            IconButton(
              icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
              onPressed: () async {
                final ok = await AppDialog.show<bool>(
                  context,
                  title: l10n.removeLocationQ,
                  body: Text(
                    l10n.removeLocationSubtitle,
                    style: theme.textTheme.bodyLarge,
                  ),
                  actionLabel: l10n.delete,
                  actionIcon: Icons.delete,
                  isDestructive: true,
                  onTap: () async {},
                );
                if (ok != true) return;
                await ref
                    .read(downloadsStoreProvider)
                    .removeAllFromLocation(location.uri);
                final current = ref.read(storageLocationsProvider);
                final updated = current.where((l) => l != location).toList();
                await ref
                    .read(appSettingsProvider.notifier)
                    .setStorageLocations(updated);
                if (isDefault) {
                  final notifier = ref.read(userSettingsProvider.notifier);
                  if (location.mediaType == .audiobook) {
                    await notifier.setDefaultDownloadsLocationAudiobooks(null);
                  } else {
                    await notifier.setDefaultDownloadsLocationPodcasts(null);
                  }
                }
                await SafUtil().releasePersistedPermission(
                  location.uri,
                  write: true,
                );
              },
            ),
          IconButton(
            icon: const Icon(Icons.star_outline),
            isSelected: isDefault,
            selectedIcon: const Icon(Icons.star),
            tooltip: isDefault ? l10n.removeDefault : l10n.setAsDefault,
            onPressed: () async {
              final notifier = ref.read(userSettingsProvider.notifier);
              final uri = isDefault ? null : location.uri;
              if (location.mediaType == .audiobook) {
                await notifier.setDefaultDownloadsLocationAudiobooks(uri);
              } else {
                await notifier.setDefaultDownloadsLocationPodcasts(uri);
              }
            },
          ),
        ],
      ),
    );
  }
}
