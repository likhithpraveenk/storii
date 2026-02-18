import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/features/library/ui/items_grid_view.dart';
import 'package:storii/l10n/l10n.dart';

class StandaloneBooks extends ConsumerWidget {
  const StandaloneBooks(this.books, {super.key});

  final List<ItemDomain> books;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          AppLocalizations.of(context)!.standaloneBooks,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: ItemsGridView(books),
    );
  }
}
