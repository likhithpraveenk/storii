import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/storage_location.dart';
import 'package:storii/app/providers/user_provider.dart';
import 'package:storii/features/downloads/logic/download_queue.dart';
import 'package:storii/features/downloads/logic/storage_locations_provider.dart';
import 'package:storii/features/downloads/ui/download_button.dart';
import 'package:storii/features/item/logic/user_progress_actions.dart';
import 'package:storii/features/player/logic/queue_providers.dart';
import 'package:storii/features/series/logic/series_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';

class SeriesOptionsWidget extends ConsumerWidget {
  const new({super.key, required this.series});

  final Series series;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showAddToContinueSeries = ref.watch(
      addToContinueSeriesProvider(series.id),
    );
    final canDownload =
        ref.watch(userPermissionsProvider).value?.download ?? false;

    return Column(
      mainAxisSize: .min,
      children: [
        ListTile(
          title: Text(l10n.playAll),
          leading: const Icon(Icons.play_circle_outlined),
          enabled: series.books.isNotEmpty,
          onTap: () async {
            if (series.finishRatio != 1) {
              final unFinished = series.books
                  .where(
                    (book) =>
                        book.userMediaProgress?.isFinished != true &&
                        book.userMediaProgress?.progress != 1,
                  )
                  .toQueueItems();
              unawaited(ref.read(queueProvider.notifier).playMany(unFinished));
            } else {
              unawaited(
                ref
                    .read(queueProvider.notifier)
                    .playMany(series.books.toQueueItems()),
              );
            }
            Navigator.of(context).pop();
          },
        ),
        if (canDownload && series.books.isNotEmpty == true)
          ListTile(
            title: Text(l10n.downloadAll),
            leading: const Icon(Icons.file_download_outlined),
            onTap: () async {
              final availableLocations = ref.read(
                storageLocationsByTypeProvider(.book),
              );
              final queue = ref.read(downloadQueueProvider.notifier);
              if (availableLocations.length == 1) {
                for (final book in series.books) {
                  unawaited(
                    queue.enqueue(
                      libraryItemId: book.id,
                      location: availableLocations.first,
                    ),
                  );
                }
              } else {
                final location = await showDialog<StorageLocation?>(
                  context: context,
                  builder: (_) => const ChooseLocationDialog(.book),
                );
                if (location != null) {
                  for (final book in series.books) {
                    unawaited(
                      queue.enqueue(libraryItemId: book.id, location: location),
                    );
                  }
                }
              }
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
        if (showAddToContinueSeries)
          ListTile(
            title: Text(l10n.reAddToContinueListening),
            leading: const Icon(Icons.playlist_add),
            onTap: () async {
              final success = await ref
                  .read(userProgressActionsProvider(series.id).notifier)
                  .reAddSeriesToContinueListening(series.id);
              globalMessengerKey.currentState?.hideCurrentSnackBar();
              globalMessengerKey.currentState?.showAppSnackBar(
                success
                    ? l10n.reAddedToContinueListening
                    : l10n.reAddToContinueListeningFailed,
                isError: !success,
              );
              if (context.mounted) Navigator.of(context).pop();
            },
          ),
      ],
    );
  }
}
