import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/l10n/l10n.dart';

class LibraryFilterBar extends ConsumerWidget {
  const LibraryFilterBar(this.tab, {super.key});

  final FiltersScreen tab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(libraryFiltersProvider(tab));
    final notifier = ref.read(libraryFiltersProvider(tab).notifier);
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const .symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          InkWell(
            borderRadius: AppStyles.circularRadius,
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Consumer(
                  builder: (context, ref, _) {
                    final filterState = ref.watch(libraryFiltersProvider(tab));
                    final l = AppLocalizations.of(context)!;

                    return Column(
                      mainAxisSize: .min,
                      crossAxisAlignment: .start,
                      children: [
                        Padding(
                          padding: const .only(left: 20, top: 16, bottom: 12),
                          child: Text(l.ascDesc, style: textTheme.bodyMedium),
                        ),
                        ...LibrarySortType.values.map(
                          (type) => ListTile(
                            title: Text(type.getDisplayString(context)),
                            trailing: filterState.sortType == type
                                ? Icon(
                                    filterState.sortAscending
                                        ? Icons.arrow_upward
                                        : Icons.arrow_downward,
                                  )
                                : null,
                            tileColor: filterState.sortType == type
                                ? Theme.of(
                                    context,
                                  ).colorScheme.surfaceContainerHighest
                                : null,
                            onTap: () {
                              if (filterState.sortType == type) {
                                notifier.setSortAscending();
                              } else {
                                notifier.setSortType(type);
                              }
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
            child: Padding(
              padding: const .symmetric(horizontal: 10, vertical: 4),
              child: Row(
                children: [
                  Text(
                    filterState.sortType.getDisplayString(context),
                    style: textTheme.titleSmall,
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    filterState.sortAscending
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            icon: Icon(
              filterState.isGridView ? Icons.list_rounded : Icons.grid_view,
            ),
            onPressed: notifier.setIsGridView,
          ),
        ],
      ),
    );
  }
}
