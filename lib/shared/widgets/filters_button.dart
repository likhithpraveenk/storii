import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/filter_data_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';

class FiltersButton extends ConsumerWidget {
  const FiltersButton(this.screen, {super.key});

  final CurrentScreen screen;

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
          builder: (context) => Consumer(
            builder: (context, ref, _) {
              final filterState = ref.watch(libraryFiltersProvider(screen));
              final filterData = ref.watch(filterDataProvider);
              final notifier = ref.read(
                libraryFiltersProvider(screen).notifier,
              );
              final mediaType =
                  ref
                      .watch(activeLibraryDetailsProvider)
                      .value
                      ?.library
                      .mediaType ??
                  MediaType.book;

              return DraggableScrollableSheet(
                minChildSize: 0.1,
                expand: false,
                builder: (context, scrollController) {
                  return _FilterBottomSheet(
                    screen: screen,
                    currentFilter: filterState.filter,
                    notifier: notifier,
                    mediaContent: mediaType,
                    filterData: filterData,
                    controller: scrollController,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class _FilterBottomSheet extends StatefulWidget {
  const _FilterBottomSheet({
    required this.screen,
    required this.currentFilter,
    required this.notifier,
    required this.mediaContent,
    required this.filterData,
    required this.controller,
  });
  final CurrentScreen screen;
  final Filter currentFilter;
  final LibraryFiltersNotifier notifier;
  final MediaType mediaContent;
  final LibraryFilterData filterData;
  final ScrollController controller;

  @override
  State<_FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<_FilterBottomSheet> {
  FilterGroup? _expandedGroup;

  @override
  void initState() {
    super.initState();
    _expandedGroup = widget.currentFilter.group;
  }

  @override
  Widget build(BuildContext context) {
    final Set<FilterGroup> candidateGroups = {};

    switch (widget.screen) {
      case .library:
        switch (widget.mediaContent) {
          case .book:
            candidateGroups.addAll(FilterAudiobooks.values.map((f) => f.group));
          case .podcast:
            candidateGroups.addAll(FilterPodcasts.values.map((f) => f.group));
        }
      case .series:
        candidateGroups.addAll(FilterSeries.values.map((f) => f.group));
      case .authors:
        throw UnsupportedError('authors screen has no filters');
    }

    final groups = candidateGroups
        .where(widget.filterData.hasValuesForGroup)
        .toList();

    return ListView(
      controller: widget.controller,
      children: [
        Padding(
          padding: const .fromLTRB(24, 24, 24, 12),
          child: Text(
            AppLocalizations.of(context)!.filter,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        const Divider(height: 1),
        ActiveFiltersChips(widget.screen),
        ...groups.map((group) {
          if (group.isImmediate) {
            return ListTile(
              contentPadding: const .only(left: 24, right: 24),
              title: Text(group.getDisplayString(context)),
              selected: widget.currentFilter.group == group,
              onTap: () => widget.notifier.setFilter(group.toImmediateFilter()),
            );
          }
          return ExpansionTile(
            key: ValueKey('filter_${group.name}_${_expandedGroup == group}'),
            title: Text(group.getDisplayString(context)),
            initiallyExpanded: _expandedGroup == group,
            tilePadding: const .only(left: 24, right: 12),
            onExpansionChanged: (isExpanded) {
              setState(() {
                _expandedGroup = isExpanded ? group : null;
              });
            },
            children: [
              FilterSubOptionsList(
                group: group,
                filterData: widget.filterData,
                currentFilter: widget.currentFilter,
                onSelect: widget.notifier.setFilter,
              ),
            ],
          );
        }),
        const SizedBox(height: 48),
      ],
    );
  }
}

class FilterSubOptionsList extends StatelessWidget {
  final FilterGroup group;
  final LibraryFilterData filterData;
  final Filter currentFilter;
  final ValueChanged<Filter> onSelect;

  const FilterSubOptionsList({
    super.key,
    required this.group,
    required this.filterData,
    required this.currentFilter,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final items = group.getLabelAndFilter(context, filterData);

    return Column(
      children: items.map((item) {
        final (label, filter) = item;
        final isSelected = currentFilter == filter;
        return ListTile(
          contentPadding: const .only(left: 32, right: 24),
          title: Text(
            label,
            style: TextStyle(
              fontWeight: isSelected ? .bold : .normal,
              color: isSelected ? Theme.of(context).colorScheme.primary : null,
            ),
          ),
          trailing: isSelected ? const Icon(Icons.check, size: 18) : null,
          onTap: () {
            onSelect(filter);
            Navigator.of(context).pop();
          },
        );
      }).toList(),
    );
  }
}

class ActiveFiltersChips extends ConsumerWidget {
  const ActiveFiltersChips(this.screen, {super.key});

  final CurrentScreen screen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(libraryFiltersProvider(screen));
    final filter = state.filter;
    if (filter is NoFilter) return const SizedBox.shrink();

    final filterData = ref.watch(filterDataProvider);

    final groupLabel = filter.group.getDisplayString(context);
    final valueLabel = filter.getDisplayLabel(context, filterData);

    void removeFilter() {
      ref.read(libraryFiltersProvider(screen).notifier).setFilter(null);
      Navigator.of(context).pop();
    }

    return Container(
      alignment: .centerLeft,
      padding: const .symmetric(horizontal: 16, vertical: 8),
      child: FilterChip(
        label: Text(
          valueLabel.isEmpty ? groupLabel : '$groupLabel: $valueLabel',
        ),
        onSelected: (_) => removeFilter(),
        onDeleted: removeFilter,
      ),
    );
  }
}
