import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';

part 'library_filters_provider.freezed.dart';
part 'library_filters_provider.g.dart';

enum FiltersScreen { authors, all, series }

@freezed
sealed class FilterState with _$FilterState {
  const factory FilterState({
    @Default(LibrarySortType.title) LibrarySortType sortType,
    @Default(true) bool sortAscending,
    @Default(true) bool isGridView,
  }) = _FilterState;
}

@riverpod
class LibraryFiltersNotifier extends _$LibraryFiltersNotifier {
  @override
  FilterState build(FiltersScreen tab) {
    final userId = ref.watch(currentUserProvider)?.id;
    if (userId == null) throw StateError('No current user');
    final isGridView = switch (tab) {
      .all => ref.watch(isItemsGridViewProvider(userId)),
      .authors => ref.watch(isAuthorsGridViewProvider(userId)),
      .series => ref.watch(isSeriesGridViewProvider(userId)),
    };
    return FilterState(isGridView: isGridView);
  }

  void setSortType(LibrarySortType type) {
    state = state.copyWith(sortType: type);
  }

  void setSortAscending() {
    state = state.copyWith(sortAscending: !state.sortAscending);
  }

  void setIsGridView() {
    final isGridView = !state.isGridView;
    state = state.copyWith(isGridView: isGridView);
    final userId = ref.watch(currentUserProvider)?.id;
    if (userId == null) throw StateError('No current user');
    final notifier = ref.read(userSettingsProvider(userId).notifier);
    switch (tab) {
      case .all:
        notifier.setIsItemsGridView(isGridView);
      case .authors:
        notifier.setIsAuthorsGridView(isGridView);
      case .series:
        notifier.setIsSeriesGridView(isGridView);
    }
  }
}
