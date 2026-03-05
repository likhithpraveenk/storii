import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/grid_height_provider.dart';

part 'library_filters_provider.freezed.dart';
part 'library_filters_provider.g.dart';

enum CurrentScreen { authors, library, series }

@freezed
sealed class FilterState with _$FilterState {
  const factory FilterState({
    required EnumHasValue sortType,
    @Default(NoFilter()) Filter filter,
    @Default(true) bool sortAscending,
    @Default(true) bool isGridView,
    @Default(false) bool collapseSeries,
    @Default(false) bool stackTitle,
    @Default(true) bool showTitle,
  }) = _FilterState;
}

@riverpod
class LibraryFiltersNotifier extends _$LibraryFiltersNotifier {
  @override
  FilterState build(CurrentScreen screen) {
    final isGridView = switch (screen) {
      .library => ref.watch(isItemsGridViewProvider),
      .authors => ref.watch(isAuthorsGridViewProvider),
      .series => ref.watch(isSeriesGridViewProvider),
    };

    final EnumHasValue initialSort = switch (screen) {
      .library => AudiobookSort.title,
      .authors => AuthorSort.name,
      .series => SeriesSort.name,
    };

    final stackTitle = ref.watch(stackTitleOnImageProvider);
    final showTitle = ref.watch(showTitleForItemProvider);

    return FilterState(
      isGridView: isGridView,
      sortType: initialSort,
      stackTitle: stackTitle,
      showTitle: showTitle,
    );
  }

  void setSortType(EnumHasValue type) {
    state = state.copyWith(sortType: type);
  }

  void toggleCollapseSeries() {
    state = state.copyWith(collapseSeries: !state.collapseSeries);
  }

  void toggleSortOrder() {
    state = state.copyWith(sortAscending: !state.sortAscending);
  }

  void setGridView(bool isGridView) {
    if (isGridView == state.isGridView) return;
    final notifier = ref.read(userSettingsProvider.notifier);
    switch (screen) {
      case .library:
        notifier.setIsItemsGridView(isGridView);
      case .authors:
        notifier.setIsAuthorsGridView(isGridView);
      case .series:
        notifier.setIsSeriesGridView(isGridView);
    }
  }

  void setDisplayMode(DisplayMode mode) => switch (mode) {
    .coverOnly => setViewPreset(stack: false, title: false),
    .comfortable => setViewPreset(stack: false, title: true),
    .compact => setViewPreset(stack: true, title: true),
    .listView => setViewPreset(stack: false, title: true, isGridView: false),
  };

  void setViewPreset({
    required bool stack,
    required bool title,
    bool isGridView = true,
  }) {
    setGridView(isGridView);
    final settings = ref.read(userSettingsProvider.notifier);
    settings.setStackTitleOnImage(stack);
    settings.setShowTitleForItem(title);
  }

  void setFilter(Filter? filter) {
    state = state.copyWith(filter: filter ?? const NoFilter());
  }
}

extension FilterStateToParamsX on FilterState {
  LibraryItemsRequestParams toItemParams() {
    return LibraryItemsRequestParams(
      sort: sortType.value,
      desc: !sortAscending,
      filter: filter,
      collapseSeries: collapseSeries,
    );
  }

  AuthorsRequestParams toAuthorParams() {
    return AuthorsRequestParams(
      desc: !sortAscending,
      filter: filter,
      sort: sortType.value,
    );
  }

  SeriesRequestParams toSeriesParams() {
    return SeriesRequestParams(
      limit: 10000,
      desc: !sortAscending,
      filter: filter,
      sort: sortType.value,
    );
  }
}
