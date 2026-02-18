import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/app/models/series.dart';
import 'package:storii/features/author/ui/standalone_books.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/features/library/ui/library_item_card.dart';
import 'package:storii/l10n/l10n.dart';

class AuthorContent extends StatelessWidget {
  const AuthorContent({
    super.key,
    required this.authorId,
    required this.books,
    required this.series,
  });

  final List<ItemDomain> books;
  final List<SeriesDomain> series;
  final String authorId;

  @override
  Widget build(BuildContext context) {
    if (books.isEmpty) return const SizedBox.shrink();

    final seriesBookIds = series
        .expand((s) => s.books ?? <ItemDomain>[])
        .map((item) => item.id)
        .toSet();
    final standaloneBooks = books
        .where((book) => !seriesBookIds.contains(book.id))
        .toList();

    return Column(
      children: [
        ...series.map((s) => SeriesSection(series: s)),
        if (standaloneBooks.isNotEmpty) ...[
          SectionHeader(
            title: AppLocalizations.of(context)!.standaloneBooks,
            count: standaloneBooks.length,
            onViewAll: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StandaloneBooks(standaloneBooks),
                ),
              );
            },
          ),
          HorizontalBooksCarousel(books: standaloneBooks),
        ],
        const SizedBox(height: 32),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final int count;
  final VoidCallback onViewAll;

  const SectionHeader({
    super.key,
    required this.title,
    required this.count,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisSize: .min,
            children: [
              const SizedBox(width: 16),
              Flexible(
                flex: 1,
                child: Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: .bold),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const .symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: kBorderRadius,
                ),
                child: Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight: .bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: onViewAll,
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelSmall,
          ),
          child: Row(
            mainAxisSize: .min,
            children: [
              Text(AppLocalizations.of(context)!.viewAll),
              const Icon(Icons.arrow_forward_ios, size: 12),
            ],
          ),
        ),
      ],
    );
  }
}

class SeriesSection extends StatelessWidget {
  final SeriesDomain series;

  const SeriesSection({super.key, required this.series});

  @override
  Widget build(BuildContext context) {
    final books = series.books ?? [];
    if (books.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: series.name,
          count: books.length,
          onViewAll: () =>
              context.push(AppRoute.seriesDetail.withId(series.id)),
        ),
        HorizontalBooksCarousel(books: books),
        const SizedBox(height: 16),
      ],
    );
  }
}

class HorizontalBooksCarousel extends ConsumerWidget {
  final List<ItemDomain> books;

  const HorizontalBooksCarousel({super.key, required this.books});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = ref.watch(shelfHeightProvider(.book));

    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: .horizontal,
        padding: const .symmetric(horizontal: 16),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Container(
            width: maxCardWidthInGrid,
            margin: const .only(right: 12),
            child: LibraryItemCard(books[index]),
          );
        },
      ),
    );
  }
}
