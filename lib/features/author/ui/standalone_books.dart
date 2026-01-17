import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/ui/library_item_card.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/helpers.dart';

class StandaloneBooks extends ConsumerWidget {
  const StandaloneBooks(this.books, {super.key});

  final List<ItemDomain> books;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showTitle = ref.watch(showTitleForItemProvider);
    final stackTitle = ref.watch(stackTitleOnImageProvider);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          AppLocalizations.of(context)!.standaloneBooks,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: GridView.builder(
        padding: const .all(16),
        itemCount: books.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: calculateGridCount(context),
          mainAxisSpacing: 8,
          crossAxisSpacing: 16,
          childAspectRatio: calculateGridRatio(
            context,
            showTitle: showTitle,
            stackTitle: stackTitle,
            showAuthor: false,
          ),
        ),
        itemBuilder: (context, index) {
          return LibraryItemCard(
            key: ValueKey(books[index].id),
            books[index],
            showTitle: showTitle,
            stackTitle: stackTitle,
            showAuthor: false,
          );
        },
      ),
    );
  }
}
