import 'package:abs_api/abs_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/ui/collapsible_section.dart';
import 'package:storii/features/library/ui/library_item_card.dart';
import 'package:storii/features/library/ui/library_item_list_tile.dart';

class AuthorContent extends ConsumerWidget {
  const new({
    super.key,
    required this.authorId,
    required this.books,
    required this.series,
  });

  final List<LibraryItem> books;
  final List<Series> series;
  final String authorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (books.isEmpty && series.isEmpty) return const SizedBox.shrink();

    final displayMode = ref.watch(libraryDisplayModeProvider);

    return Column(
      children: [
        if (books.isNotEmpty) ...[
          if (displayMode == .listView)
            CollapsibleSection(
              title: Padding(
                padding: const .symmetric(horizontal: 16),
                child: _SectionTitle(title: l10n.books, count: books.length),
              ),
              padding: .zero,
              trailing: TextButton(
                onPressed: () {
                  context.push(AppRoute.authorBooks.path, extra: authorId);
                },
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelSmall,
                ),
                child: Text(l10n.viewAll),
              ),
              child: Column(
                children: books.map(LibraryItemListTile.new).toList(),
              ),
            )
          else ...[
            _SectionHeader(
              title: l10n.books,
              count: books.length,
              onViewAll: () {
                context.push(AppRoute.authorBooks.path, extra: authorId);
              },
            ),
            _HorizontalBooksCarousel(books: books),
          ],
        ],
        ...series.map((s) => _SeriesSection(series: s)),
        const SizedBox(height: 32),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final int count;

  const new({required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisSize: .min,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall
                      ?.copyWith(fontWeight: .bold),
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
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final int count;
  final VoidCallback onViewAll;

  const new({
    required this.title,
    required this.count,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Expanded(
          child: _SectionTitle(title: title, count: count),
        ),
        TextButton(
          onPressed: onViewAll,
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelSmall,
          ),
          child: Text(l10n.viewAll),
        ),
      ],
    );
  }
}

class _SeriesSection extends ConsumerWidget {
  final Series series;

  const new({required this.series});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = series.books;
    if (books.isEmpty) return const SizedBox.shrink();

    final displayMode = ref.watch(libraryDisplayModeProvider);
    final isListView = displayMode == .listView;

    if (isListView) {
      return CollapsibleSection(
        title: Padding(
          padding: const .symmetric(horizontal: 16),
          child: _SectionTitle(title: series.name, count: books.length),
        ),
        padding: .zero,
        trailing: TextButton(
          onPressed: () {
            context.push(AppRoute.seriesDetail.path, extra: series.id);
          },
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelSmall,
          ),
          child: Text(l10n.viewAll),
        ),
        child: Column(children: books.map(LibraryItemListTile.new).toList()),
      );
    }

    return Column(
      crossAxisAlignment: .start,
      children: [
        _SectionHeader(
          title: series.name,
          count: books.length,
          onViewAll: () =>
              context.push(AppRoute.seriesDetail.path, extra: series.id),
        ),
        _HorizontalBooksCarousel(books: books),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _HorizontalBooksCarousel extends ConsumerWidget {
  final List<LibraryItem> books;

  const new({required this.books});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: .horizontal,
      padding: const .symmetric(horizontal: 8),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          ...books
              .take(10)
              .map(
                (book) => Container(
                  width: maxCardWidthInGrid,
                  margin: const .symmetric(horizontal: 8),
                  child: LibraryItemCard(book),
                ),
              ),
        ],
      ),
    );
  }
}
