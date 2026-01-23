import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/features/author/logic/authors_list_provider.dart';
import 'package:storii/features/author/ui/author_card.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/features/library/ui/filters_button.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';

class AuthorListScreen extends ConsumerStatefulWidget {
  const AuthorListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthorListScreenState();
}

class _AuthorListScreenState extends ConsumerState<AuthorListScreen> {
  final _scrollController = ScrollController();
  bool _showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        setState(() {
          _showBackToTopButton = _scrollController.offset >= 400;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final authorsAsync = ref.watch(authorsListProvider);
    final filterState = ref.watch(libraryFiltersProvider(.authors));
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.authors,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: const [FiltersButton(.authors)],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(authorsListProvider.notifier).manualSync(),
        child: Column(
          children: [
            Expanded(
              child: authorsAsync.when(
                data: (authors) {
                  if (authors.isEmpty) {
                    return SliverFillRemaining(
                      child: Center(child: Text(l.empty)),
                    );
                  }

                  if (!filterState.isGridView) {
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: authors.length,
                      itemBuilder: (context, index) {
                        return AuthorCardListView(
                          key: ValueKey(authors[index].id),
                          authors[index],
                        );
                      },
                    );
                  }
                  final height = ref.watch(authorsGridHeightProvider);

                  return GridView.builder(
                    controller: _scrollController,
                    itemCount: authors.length,
                    padding: const .symmetric(horizontal: 16),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: AppStyles.maxCardWidthInGrid,
                      mainAxisExtent: height,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return AuthorCard(
                        key: ValueKey(authors[index].id),
                        authors[index],
                      );
                    },
                  );
                },
                loading: () => const Center(child: RandomWaveform()),

                error: (error, _) => ErrorRetryWidget(
                  '$error',
                  onRetry: () => ref.invalidate(authorsListProvider),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AnimatedScale(
        scale: _showBackToTopButton ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: FloatingActionButton(
          onPressed: _scrollToTop,
          mini: true,
          child: const Icon(Icons.arrow_upward),
        ),
      ),
    );
  }
}
