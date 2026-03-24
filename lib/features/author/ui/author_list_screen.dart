import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/author/logic/authors_list_provider.dart';
import 'package:storii/features/author/ui/author_card.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_scrollbar.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/screen_options.dart';
import 'package:storii/shared/widgets/waveform.dart';

class AuthorListScreen extends ConsumerStatefulWidget {
  const AuthorListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthorListScreenState();
}

class _AuthorListScreenState extends ConsumerState<AuthorListScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authorsAsync = ref.watch(authorsListProvider);
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Text(
          AppLocalizations.of(context)!.authors,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: const [ScreenOptionsButton(.authors)],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(libraryFiltersProvider(.authors));
          ref.invalidate(authorsListProvider);
        },
        child: authorsAsync.when(
          data: (authors) {
            if (authors.isEmpty) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: .center,
                  child: Text(l.empty),
                ),
              );
            }
            final height = ref.watch(authorsGridHeightProvider);

            final displayMode = ref.watch(authorDisplayModeProvider);
            final isListView = displayMode == .listView;

            return AppScrollbar(
              controller: _scrollController,
              child: !isListView
                  ? GridView.builder(
                      key: const ValueKey('author_grid_view'),
                      controller: _scrollController,
                      itemCount: authors.length,
                      padding: const .symmetric(horizontal: 16),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: maxCardWidthInGrid,
                        mainAxisExtent: height,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return AuthorCard(
                          key: ValueKey(authors[index].id),
                          authors[index],
                        );
                      },
                    )
                  : ListView.builder(
                      key: const ValueKey('author_list_view'),
                      controller: _scrollController,
                      itemCount: authors.length,
                      itemBuilder: (context, index) {
                        return AuthorCardListView(
                          key: ValueKey(authors[index].id),
                          authors[index],
                        );
                      },
                    ),
            );
          },
          loading: () => const Center(child: RandomWaveform()),
          error: (error, _) => ErrorRetryWidget(
            '$error',
            onRetry: () => ref.invalidate(authorsListProvider),
          ),
        ),
      ),
    );
  }
}
