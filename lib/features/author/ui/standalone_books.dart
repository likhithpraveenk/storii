import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/author/logic/author_provider.dart';
import 'package:storii/features/library/ui/items_grid_view.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class StandaloneBooks extends ConsumerWidget {
  const StandaloneBooks({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authorAsync = ref.watch(authorProvider(id));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l10n.books, style: Theme.of(context).textTheme.titleMedium),
      ),
      body: authorAsync.when(
        data: (author) => ItemsGridView(author.libraryItems ?? []),
        loading: () => const Center(child: RandomWaveform()),
        error: (e, _) => ErrorRetryWidget(
          e.toString(),
          onRetry: () => ref.invalidate(authorProvider(id)),
        ),
      ),
    );
  }
}
