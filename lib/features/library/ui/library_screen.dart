import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/library/ui/library_all_tab.dart';
import 'package:storii/features/library/ui/library_authors_tab.dart';
import 'package:storii/features/library/ui/library_series_tab.dart';
import 'package:storii/l10n/l10n.dart';

class LibraryScreen extends ConsumerStatefulWidget {
  const LibraryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends ConsumerState<LibraryScreen>
    with SingleTickerProviderStateMixin {
  final _scrollController = ScrollController();
  bool _showBackToTopButton = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
    _tabController.dispose();
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
    final l = AppLocalizations.of(context)!;

    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            // TODO: library switcher bottom sheet
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabDelegate(
                TabBar(
                  controller: _tabController,
                  indicatorSize: .label,
                  labelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelColor: Theme.of(context).hintColor,
                  tabs: [
                    Tab(text: l.all),
                    Tab(text: l.series),
                    Tab(text: l.authors),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
            children: [
              LibraryAllTab(controller: _scrollController),
              LibrarySeriesTab(controller: _scrollController),
              LibraryAuthorsTab(controller: _scrollController),
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
      ),
    );
  }
}

class _SliverTabDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  _SliverTabDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverTabDelegate oldDelegate) => false;
}
