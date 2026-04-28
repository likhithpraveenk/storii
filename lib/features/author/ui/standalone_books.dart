import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/library/ui/items_grid_view.dart';

class StandaloneBooks extends ConsumerWidget {
  const StandaloneBooks(this.books, {super.key});

  final List<LibraryItem> books;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l10n.books, style: Theme.of(context).textTheme.titleMedium),
      ),
      body: ItemsGridView(books),
    );
  }
}
