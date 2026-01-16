import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'library_items_provider.g.dart';
part 'library_items_provider.freezed.dart';

@freezed
abstract class LibraryItemsState with _$LibraryItemsState {
  const factory LibraryItemsState({
    @Default([]) List<ItemDomain> items,
    @Default(false) bool isLoadingMore,
    @Default(true) bool hasMore,
    Object? error,
  }) = _LibraryItemsState;
}

@Riverpod(keepAlive: true)
class LibraryItemsNotifier extends _$LibraryItemsNotifier {
  LibraryItemsRequestParams _currentParams = LibraryItemsRequestParams(
    sort: AudiobookSort.title.value,
    desc: false,
  );
  int _currentPage = 0;

  @override
  Future<LibraryItemsState> build() async {
    final library = await ref.watch(activeLibraryProvider.future);
    _currentPage = 0;
    final result = await _fetchPage(
      0,
      params: _currentParams,
      libId: library.id,
    );

    return LibraryItemsState(items: result.items, hasMore: result.hasMore);
  }

  Future<({List<ItemDomain> items, bool hasMore})> _fetchPage(
    int page, {
    required LibraryItemsRequestParams params,
    required String libId,
  }) async {
    final limit = ref.read(defaultItemsLimitProvider);
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(libraryApiProvider(user));

    final response = await api.getItems(
      libId,
      params.copyWith(limit: limit, page: page),
    );

    return (
      items: response.results.map((i) => i.toDomain()).toList(),
      hasMore: ((page * limit) + response.results.length) < response.total,
    );
  }

  Future<void> fetchMore() async {
    final currentState = state.value;
    if (currentState == null ||
        currentState.isLoadingMore ||
        !currentState.hasMore) {
      return;
    }

    state = AsyncData(currentState.copyWith(isLoadingMore: true, error: null));
    try {
      final libraryId = (await ref.read(activeLibraryProvider.future)).id;
      _currentPage++;

      final result = await _fetchPage(
        _currentPage,
        params: _currentParams,
        libId: libraryId,
      );

      state = AsyncData(
        currentState.copyWith(
          items: [...currentState.items, ...result.items],
          isLoadingMore: false,
          hasMore: result.hasMore,
        ),
      );
    } catch (e, st) {
      _currentPage--;
      final error = AppError.resolve(e);
      ref
          .read(logsProvider.notifier)
          .log(
            'error getting library items: $error',
            level: .error,
            source: 'LibraryItemsNotifier',
            stackTrace: st,
          );
      state = AsyncData(
        currentState.copyWith(isLoadingMore: false, error: error),
      );
    }
  }

  Future<void> filterItems(LibraryItemsRequestParams params) async {
    _currentParams = params;
    ref.invalidateSelf();
    await future;
  }

  Future<void> manualSync() async {
    _currentParams = LibraryItemsRequestParams(
      sort: AudiobookSort.title.value,
      desc: false,
    );
    ref.invalidateSelf();
    await future;
  }
}
