import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/globals.dart';
import 'package:storii/l10n/l10n.dart';

class FiltersButton extends ConsumerWidget {
  const FiltersButton(this.tab, {super.key});

  final FiltersScreen tab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.filter_list),
      onPressed: () {
        final scaffoldContext = shellScaffoldKey.currentContext;
        if (scaffoldContext == null) return;
        showModalBottomSheet(
          context: scaffoldContext,
          isScrollControlled: true,
          useSafeArea: true,
          builder: (context) => _FilterBottomSheet(tab),
        );
      },
    );
  }
}

class _FilterBottomSheet extends ConsumerWidget {
  const _FilterBottomSheet(this.tab);
  final FiltersScreen tab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final filterState = ref.watch(libraryFiltersProvider(tab));
    final notifier = ref.read(libraryFiltersProvider(tab).notifier);
    final mediaContent =
        ref.watch(activeLibraryProvider).value?.mediaContent ??
        MediaContent.audiobooks;

    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            tabs: [
              Tab(text: l10n.filter),
              Tab(text: l10n.sort),
              Tab(text: l10n.display),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: TabBarView(
              children: [
                _FilterTab(
                  tab: tab,
                  state: filterState,
                  notifier: notifier,
                  mediaContent: mediaContent,
                ),
                _SortTab(
                  tab: tab,
                  state: filterState,
                  notifier: notifier,
                  mediaContent: mediaContent,
                ),
                _DisplayTab(state: filterState, notifier: notifier),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterTab extends StatelessWidget {
  const _FilterTab({
    required this.tab,
    required this.state,
    required this.notifier,
    required this.mediaContent,
  });
  final FiltersScreen tab;
  final FilterState state;
  final LibraryFiltersNotifier notifier;
  final MediaContent mediaContent;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text(AppLocalizations.of(context)!.clearFilter),
          leading: const Icon(Icons.clear_all),
          onTap: () => notifier.setFilter(null),
        ),
        const Divider(),
        ...FilterGroup.values.map(
          (group) => ListTile(
            title: Text(group.name.toUpperCase()),
            subtitle: state.filter.group == group
                ? Text(state.filter.value ?? '')
                : null,
            selected: state.filter.group == group,
            onTap: () {
              // TODO: Logic to select specific filter values would go here
            },
          ),
        ),
      ],
    );
  }
}

class _SortTab extends StatelessWidget {
  const _SortTab({
    required this.tab,
    required this.state,
    required this.notifier,
    required this.mediaContent,
  });
  final FiltersScreen tab;
  final FilterState state;
  final LibraryFiltersNotifier notifier;
  final MediaContent mediaContent;

  @override
  Widget build(BuildContext context) {
    final List<EnumHasValue> sortValues = switch (tab) {
      .library => switch (mediaContent) {
        .audiobooks => AudiobookSort.values,
        .podcasts => PodcastSort.values,
      },
      .authors => AuthorSort.values,
      .series => SeriesSort.values,
    };

    return ListView.builder(
      itemCount: sortValues.length,
      itemBuilder: (context, index) {
        final type = sortValues[index];
        final isSelected = state.sortType == type;
        return ListTile(
          title: Text(type.getDisplayString(context)),
          selected: isSelected,
          trailing: isSelected
              ? Icon(
                  state.sortAscending
                      ? Icons.arrow_upward
                      : Icons.arrow_downward,
                )
              : null,
          onTap: () => isSelected
              ? notifier.toggleSortOrder()
              : notifier.setSortType(type),
        );
      },
    );
  }
}

class _DisplayTab extends StatelessWidget {
  const _DisplayTab({required this.state, required this.notifier});
  final FilterState state;
  final LibraryFiltersNotifier notifier;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final currentMode = _getCurrentMode();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.displayMode, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: DisplayMode.values.map((mode) {
              return ChoiceChip(
                label: Text(switch (mode) {
                  .coverOnly => l10n.coverOnly,
                  .compact => l10n.compact,
                  .comfortable => l10n.comfortable,
                  .listView => l10n.listView,
                }),
                selected: currentMode == mode,
                onSelected: (selected) {
                  if (selected) notifier.setDisplayMode(mode);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  DisplayMode _getCurrentMode() {
    if (!state.isGridView) return .listView;
    if (!state.showTitle) return .coverOnly;
    return state.stackTitle ? .compact : .comfortable;
  }
}
