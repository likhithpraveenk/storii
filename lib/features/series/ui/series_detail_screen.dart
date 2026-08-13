import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/item/logic/user_progress_actions.dart';
import 'package:storii/features/library/ui/items_grid_view.dart';
import 'package:storii/features/series/logic/series_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/expandable_text.dart';
import 'package:storii/shared/widgets/waveform.dart';

class SeriesDetailScreen extends ConsumerWidget {
  const SeriesDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seriesAsync = ref.watch(seriesProvider(id));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          seriesAsync.value?.name ?? '',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            tooltip: l10n.more,
            icon: const Icon(Icons.more_horiz),
            onPressed: () => AppBottomSheet.show(
              context,
              title: l10n.more,
              body: _SeriesOptionsWidget(seriesId: id),
            ),
          ),
        ],
      ),
      body: seriesAsync.when(
        data: (series) {
          final books = series.books.sortedBySequence();
          return Column(
            children: [
              if (series.description != null)
                Padding(
                  padding: const .all(16),
                  child: ExpandableHtml(data: series.description!),
                ),
              Expanded(child: ItemsGridView(books)),
            ],
          );
        },
        loading: () => const Center(child: RandomWaveform()),
        error: (e, s) => ErrorRetryWidget(
          e.toString(),
          onRetry: () {
            ref.invalidate(seriesProvider(id));
          },
        ),
      ),
    );
  }
}

class _SeriesOptionsWidget extends ConsumerWidget {
  const _SeriesOptionsWidget({required this.seriesId});

  final String seriesId;

  @override
  Widget build(BuildContext context, WidgetRef ref) => ListTile(
    title: Text(l10n.reAddToContinueListening),
    leading: const Icon(Icons.playlist_add),
    onTap: () async {
      final success = await ref
          .read(userProgressActionsProvider(seriesId).notifier)
          .reAddSeriesToContinueListening(seriesId);
      globalMessengerKey.currentState?.hideCurrentSnackBar();
      globalMessengerKey.currentState?.showAppSnackBar(
        success
            ? l10n.reAddedToContinueListening
            : l10n.reAddToContinueListeningFailed,
        isError: !success,
      );
      if (context.mounted) Navigator.of(context).pop();
    },
  );
}
