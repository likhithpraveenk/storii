import 'package:abs_api/abs_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';

part 'library_filters_provider.freezed.dart';
part 'library_filters_provider.g.dart';

enum CurrentScreen { authors, library, series }

@freezed
sealed class FilterState with _$FilterState {
  const FilterState._();

  const factory FilterState({
    required EnumHasValue sortType,
    @Default(NoFilter()) Filter filter,
    @Default(true) bool sortAscending,
    @Default(false) bool collapseSeries,
  }) = _FilterState;

  bool get isFilterSet => filter != const NoFilter();
}

@Riverpod(keepAlive: true)
class LibraryFiltersNotifier extends _$LibraryFiltersNotifier {
  bool get _rememberSort => ref.read(rememberSortProvider);
  UserSettingsNotifier get _notifier => ref.read(userSettingsProvider.notifier);

  @override
  FilterState build(CurrentScreen screen) {
    final EnumHasValue initialSort;
    final bool initialAscending;
    if (_rememberSort) {
      initialSort = switch (screen) {
        .library => ref.read(audiobookSortValueProvider),
        .authors => ref.read(authorSortValueProvider),
        .series => ref.read(seriesSortValueProvider),
      };
      initialAscending = switch (screen) {
        .library => ref.read(librarySortAscendingProvider),
        .authors => ref.read(authorSortAscendingProvider),
        .series => ref.read(seriesSortAscendingProvider),
      };
    } else {
      initialSort = switch (screen) {
        .library => AudiobookSort.title,
        .authors => AuthorSort.name,
        .series => SeriesSort.name,
      };
      initialAscending = true;
    }
    final initialCollapse = ref.read(collapseSeriesProvider);

    return FilterState(
      sortType: initialSort,
      sortAscending: initialAscending,
      collapseSeries: initialCollapse,
    );
  }

  void setSortType(EnumHasValue type) {
    state = state.copyWith(sortType: type);
    if (!_rememberSort) return;
    switch (screen) {
      case .library:
        if (type is PodcastSort) {
          _notifier.setPodcastSortValue(type);
        } else if (type is AudiobookSort) {
          _notifier.setAudiobookSortValue(type);
        }
      case .authors:
        _notifier.setAuthorSortValue(type as AuthorSort);
      case .series:
        _notifier.setSeriesSortValue(type as SeriesSort);
    }
  }

  void toggleCollapseSeries() {
    final currentState = state.collapseSeries;
    _notifier.setCollapseSeries(!currentState);
    state = state.copyWith(collapseSeries: !currentState);
  }

  void toggleSortOrder() {
    final newAscending = !state.sortAscending;
    state = state.copyWith(sortAscending: newAscending);
    if (!_rememberSort) return;
    switch (screen) {
      case .library:
        _notifier.setLibrarySortAscending(newAscending);
      case .authors:
        _notifier.setAuthorSortAscending(newAscending);
      case .series:
        _notifier.setSeriesSortAscending(newAscending);
    }
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

@riverpod
DisplayMode screenDisplayMode(Ref ref, CurrentScreen screen) {
  return switch (screen) {
    .library => ref.watch(libraryDisplayModeProvider),
    .series => ref.watch(seriesDisplayModeProvider),
    .authors => ref.watch(authorDisplayModeProvider),
  };
}
