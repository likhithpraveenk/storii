import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/author/ui/standalone_books.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/features/library/ui/library_item_card.dart';

class AuthorContent extends StatelessWidget {
  const AuthorContent({
    super.key,
    required this.authorId,
    required this.books,
    required this.series,
  });

  final List<LibraryItem> books;
  final List<Series> series;
  final String authorId;

  @override
  Widget build(BuildContext context) {
    if (books.isEmpty && series.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        if (books.isNotEmpty) ...[
          SectionHeader(
            title: l10n.books,
            count: books.length,
            onViewAll: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => StandaloneBooks(books)),
              );
            },
          ),
          HorizontalBooksCarousel(books: books),
        ],
        ...series.map((s) => SeriesSection(series: s)),
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
                  borderRadius: .circular(kRadius),
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
              Text(l10n.viewAll),
              const Icon(Icons.arrow_forward_ios, size: 12),
            ],
          ),
        ),
      ],
    );
  }
}

class SeriesSection extends StatelessWidget {
  final Series series;

  const SeriesSection({super.key, required this.series});

  @override
  Widget build(BuildContext context) {
    final books = series.books;
    if (books.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: series.name,
          count: books.length,
          onViewAll: () =>
              context.push(AppRoute.seriesDetail.path, extra: series.id),
        ),
        HorizontalBooksCarousel(books: books),
        const SizedBox(height: 16),
      ],
    );
  }
}

class HorizontalBooksCarousel extends ConsumerWidget {
  final List<LibraryItem> books;

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
