import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/author/ui/author_card.dart';
import 'package:storii/features/author/ui/author_list_screen.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/features/library/ui/items_grid_view.dart';
import 'package:storii/features/library/ui/library_item_card.dart';
import 'package:storii/features/series/ui/series_card.dart';
import 'package:storii/features/series/ui/series_list_screen.dart';

class _Section extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAll;
  final Widget child;

  const _Section({required this.title, this.onViewAll, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const .symmetric(horizontal: 16),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            if (onViewAll != null)
              TextButton(
                onPressed: () {
                  onViewAll?.call();
                },
                child: Text(l10n.viewAll),
              ),
          ],
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

class ItemsSection extends ConsumerWidget {
  const ItemsSection({
    super.key,
    required this.items,
    required this.title,
    required this.onViewAll,
    required this.isSeparate,
  });

  final String title;
  final List<LibraryItem> items;
  final VoidCallback onViewAll;
  final bool isSeparate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isSeparate) {
      return ItemsGridView(items);
    }
    final height = ref.watch(shelfHeightProvider(.book));

    return _Section(
      title: title,
      onViewAll: onViewAll,
      child: SizedBox(
        height: height,
        child: ListView.builder(
          scrollDirection: .horizontal,
          padding: const .symmetric(horizontal: 16),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              width: maxCardWidthInGrid,
              margin: const .only(right: 12),
              child: LibraryItemCard(items[index]),
            );
          },
        ),
      ),
    );
  }
}

class SearchChipsSection<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final IconData icon;
  final String Function(T) labelOf;
  final int Function(T) countOf;
  final void Function(T) onTap;
  final bool isSeparate;

  const SearchChipsSection({
    super.key,
    required this.title,
    required this.items,
    required this.icon,
    required this.labelOf,
    required this.countOf,
    required this.onTap,
    required this.isSeparate,
  });

  @override
  Widget build(BuildContext context) {
    final child = Padding(
      padding: const .symmetric(horizontal: 16),
      child: Wrap(
        spacing: 4,
        children: items
            .map(
              (item) => ActionChip(
                avatar: Icon(icon, size: 18),
                label: Text('${labelOf(item)} (${countOf(item)})'),
                onPressed: () => onTap(item),
                visualDensity: .compact,
              ),
            )
            .toList(),
      ),
    );
    if (isSeparate) {
      return child;
    }
    return _Section(title: title, child: child);
  }
}

class AuthorsSection extends ConsumerWidget {
  const AuthorsSection({
    super.key,
    required this.authors,
    required this.onViewAll,
    required this.isSeparate,
  });

  final List<Author> authors;
  final VoidCallback onViewAll;
  final bool isSeparate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isSeparate) {
      return AuthorsGridView(authors: authors);
    }
    final height = ref.watch(shelfHeightProvider(.authors));
    return _Section(
      title: l10n.authors,
      onViewAll: onViewAll,
      child: SizedBox(
        height: height,
        child: ListView.separated(
          scrollDirection: .horizontal,
          padding: const .symmetric(horizontal: 16),
          itemCount: authors.length,
          separatorBuilder: (_, _) => const SizedBox(width: 16),
          itemBuilder: (_, i) {
            return SizedBox(
              width: maxCardWidthInGrid,
              child: AuthorCard(authors[i]),
            );
          },
        ),
      ),
    );
  }
}

class SeriesSection extends ConsumerWidget {
  const SeriesSection({
    super.key,
    required this.series,
    required this.onViewAll,
    required this.isSeparate,
  });

  final List<Series> series;
  final VoidCallback onViewAll;
  final bool isSeparate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isSeparate) {
      return SeriesGridView(series: series);
    }
    final height = ref.watch(shelfHeightProvider(.series));
    return _Section(
      title: l10n.series,
      onViewAll: onViewAll,
      child: SizedBox(
        height: height,
        child: ListView.separated(
          scrollDirection: .horizontal,
          padding: const .symmetric(horizontal: 16),
          itemCount: series.length,
          separatorBuilder: (_, _) => const SizedBox(width: 16),
          itemBuilder: (_, i) {
            return SizedBox(
              width: maxSeriesCardWidthInGrid,
              child: SeriesCard(series[i]),
            );
          },
        ),
      ),
    );
  }
}
