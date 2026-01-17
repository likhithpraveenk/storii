import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/ui/library_item_card.dart';
import 'package:storii/features/series/logic/series_provider.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/helpers/helpers.dart';
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
          final showTitle = ref.watch(showTitleForItemProvider);
          final stackTitle = ref.watch(stackTitleOnImageProvider);
          final showAuthor = ref.watch(showAuthorForItemProvider);

          return Column(
            children: [
              if (series.description != null)
                Padding(
                  padding: const .all(16),
                  child: ExpandableHtml(data: series.description!),
                ),
              if (books != null)
                Expanded(
                  child: GridView.builder(
                    padding: const .symmetric(horizontal: 16),
                    itemCount: books.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: calculateGridCount(context),
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 16,
                      childAspectRatio: calculateGridRatio(
                        context,
                        showTitle: showTitle,
                        stackTitle: stackTitle,
                        showAuthor: showAuthor,
                      ),
                    ),
                    itemBuilder: (context, index) {
                      return LibraryItemCard(
                        key: ValueKey(books[index].id),
                        books[index],
                        showTitle: showTitle,
                        stackTitle: stackTitle,
                        showAuthor: showAuthor,
                      );
                    },
                  ),
                ),
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
