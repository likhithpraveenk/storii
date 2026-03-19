import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

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
        AppBottomSheet.show(
          scaffoldContext,
          title: AppLocalizations.of(context)!.sort,
          body: _SortBottomSheet(screen),
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

    return Column(
      children: [
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
            contentPadding: const .symmetric(horizontal: 24, vertical: 0),
          );
        }),
        const SizedBox(height: 48),
      ],
    );
  }
}
