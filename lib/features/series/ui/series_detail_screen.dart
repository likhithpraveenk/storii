import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/features/library/ui/items_grid_view.dart';
import 'package:storii/features/series/logic/series_provider.dart';
import 'package:storii/shared/helpers/extensions.dart';
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
        titleSpacing: 0,
        title: Text(
          seriesAsync.value?.name ?? '',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: seriesAsync.when(
        data: (series) {
          final books = series.books?.cast<Audiobook>().sortedBySequence();
          return Column(
            children: [
              if (series.description != null)
                Padding(
                  padding: const .all(16),
                  child: ExpandableHtml(data: series.description!),
                ),
              if (books != null) Expanded(child: ItemsGridView(books)),
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
