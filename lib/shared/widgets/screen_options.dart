import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/filter_data_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/display_sheet.dart';
import 'package:storii/shared/widgets/filters_sheet.dart';
import 'package:storii/shared/widgets/sort_sheet.dart';

class ScreenOptionsButton extends StatelessWidget {
  const ScreenOptionsButton(this.screen, {super.key});
  final CurrentScreen screen;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Consumer(
        builder: (context, ref, _) {
          final isFilterSet = ref
              .watch(libraryFiltersProvider(screen))
              .isFilterSet;
          return Stack(
            clipBehavior: .none,
            children: [
              const Icon(Icons.filter_list),
              if (isFilterSet)
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error,
                      shape: .circle,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
      tooltip: l10n.filter,
      onPressed: () {
        final scaffoldContext = shellScaffoldKey.currentContext;
        if (scaffoldContext == null) return;
        showModalBottomSheet(
          context: scaffoldContext,
          useSafeArea: true,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: .vertical(top: .circular(24)),
          ),
          builder: (_) => DraggableScrollableSheet(
            maxChildSize: 0.95,
            minChildSize: 0.4,
            shouldCloseOnMinExtent: false,
            snap: true,
            expand: false,
            builder: (context, controller) {
              return DecoratedBox(
                decoration: bottomSheetDecoration(context),
                child: _ScreenOptionsSheet(screen, controller),
              );
            },
          ),
        );
      },
    );
  }
}

class _ScreenOptionsSheet extends ConsumerWidget {
  const _ScreenOptionsSheet(this.screen, this.controller);
  final CurrentScreen screen;
  final ScrollController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(libraryFiltersProvider(screen));
    final filterData = ref.watch(filterDataProvider);
    final notifier = ref.read(libraryFiltersProvider(screen).notifier);
    final mediaType =
        ref.watch(activeLibraryDetailsProvider).value?.library.mediaType ??
        MediaType.book;

    final tabLength = switch (screen) {
      .authors => 2,
      _ => 3,
    };

    return DefaultTabController(
      length: tabLength,
      child: Column(
        children: [
          TabBar(
            tabs: [
              if (screen != .authors) Tab(text: l10n.filter),
              Tab(text: l10n.sort),
              Tab(text: l10n.display),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                if (screen != .authors)
                  FilterBottomSheet(
                    screen: screen,
                    currentFilter: filterState.filter,
                    notifier: notifier,
                    mediaContent: mediaType,
                    filterData: filterData,
                    controller: controller,
                  ),
                SortBottomSheet(screen, controller),
                DisplayBottomSheet(screen, controller),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
