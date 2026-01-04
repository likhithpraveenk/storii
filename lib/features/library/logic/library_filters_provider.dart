import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';

part 'library_filters_provider.freezed.dart';
part 'library_filters_provider.g.dart';

@freezed
sealed class FilterState with _$FilterState {
  const factory FilterState({
    @Default(LibrarySortType.title) LibrarySortType sortType,
    @Default(true) bool sortAscending,
    @Default(2) int gridCount,
  }) = _FilterState;
}

@Riverpod(keepAlive: true)
class LibraryFiltersNotifier extends _$LibraryFiltersNotifier {
  @override
  FilterState build() {
    final count = ref.read(gridCountProvider);
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
    ref.read(appSettingsProvider.notifier).setGridCount(count);
  }
}
