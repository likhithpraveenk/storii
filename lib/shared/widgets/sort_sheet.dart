import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';

class SortBottomSheet extends ConsumerWidget {
  const SortBottomSheet(this.screen, this.controller, {super.key});
  final CurrentScreen screen;
  final ScrollController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(libraryFiltersProvider(screen));
    final notifier = ref.read(libraryFiltersProvider(screen).notifier);
    final mediaType =
        ref.watch(activeLibraryDetailsProvider).value?.library.mediaType ??
        MediaType.book;

    final List<EnumHasValue> sortValues = switch (screen) {
      .library => switch (mediaType) {
        .book => AudiobookSort.values,
        .podcast => PodcastSort.values,
      },
      .authors => AuthorSort.values,
      .series => SeriesSort.values,
    };

    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          ...sortValues.map((type) {
            final isSelected = filterState.sortType == type;
            return ListTile(
              title: Text(type.label),
              selected: isSelected,
              trailing: isSelected
                  ? Icon(
                      filterState.sortAscending
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                    )
                  : null,
              onTap: () => isSelected
                  ? notifier.toggleSortOrder()
                  : notifier.setSortType(type),
              contentPadding: const .symmetric(horizontal: 24, vertical: 0),
            );
          }),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
