import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/l10n/l10n.dart';

class SortButton extends ConsumerWidget {
  const SortButton(this.screen, {super.key});

  final CurrentScreen screen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.sort),
      onPressed: () {
        final scaffoldContext = shellScaffoldKey.currentContext;
        if (scaffoldContext == null) return;
        showModalBottomSheet(
          context: scaffoldContext,
          isScrollControlled: true,
          useSafeArea: true,
          builder: (context) => _SortBottomSheet(screen),
        );
      },
    );
  }
}

class _SortBottomSheet extends ConsumerWidget {
  const _SortBottomSheet(this.screen);
  final CurrentScreen screen;

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

    return DraggableScrollableSheet(
      minChildSize: 0.1,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return ListView(
          controller: scrollController,
          children: [
            Padding(
              padding: const .fromLTRB(16, 12, 16, 8),
              child: Text(
                AppLocalizations.of(context)!.sort,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const Divider(height: 1),
            ...sortValues.map((type) {
              final isSelected = filterState.sortType == type;
              return ListTile(
                title: Text(type.getDisplayString(context)),
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
              );
            }),
          ],
        );
      },
    );
  }
}
