import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';

part 'library_filters_provider.freezed.dart';
part 'library_filters_provider.g.dart';

enum FiltersTab { authors, all, series }

@freezed
sealed class FilterState with _$FilterState {
  const factory FilterState({
    @Default(LibrarySortType.title) LibrarySortType sortType,
    @Default(true) bool sortAscending,
    @Default(2) int gridCount,
  }) = _FilterState;
}

@riverpod
class LibraryFiltersNotifier extends _$LibraryFiltersNotifier {
  @override
  FilterState build(FiltersTab tab) {
    final userId = ref.watch(currentUserProvider)?.id;
    if (userId == null) throw StateError('No current user');
    final count = switch (tab) {
      .all => ref.watch(allGridCountProvider(userId)),
      .authors => ref.watch(authorsGridCountProvider(userId)),
      .series => ref.watch(seriesGridCountProvider(userId)),
    };
    return FilterState(gridCount: count);
  }

  void setSortType(LibrarySortType type) {
    state = state.copyWith(sortType: type);
  }

  void setSortAscending() {
    state = state.copyWith(sortAscending: !state.sortAscending);
  }

  void setGridCount(int count) {
    state = state.copyWith(gridCount: count);
    final userId = ref.watch(currentUserProvider)?.id;
    if (userId == null) throw StateError('No current user');
    final notifier = ref.read(userSettingsProvider(userId).notifier);
    switch (tab) {
      case .all:
        notifier.setAllGridCount(count);
      case .authors:
        notifier.setAuthorsGridCount(count);
      case .series:
        notifier.setSeriesGridCount(count);
    }
  }
}
