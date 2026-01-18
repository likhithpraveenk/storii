import 'package:flutter_riverpod/flutter_riverpod.dart';
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
import 'package:storii/features/library/logic/library_filters_provider.dart';
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
  @override
  Future<LibraryItemsState> build() async {
    final library = await ref.watch(activeLibraryProvider.future);
    final params = ref.watch(
      libraryFiltersProvider(.audiobook).select((s) => s.toItemParams()),
    );

    final result = await _fetchPage(0, params: params, libId: library.id);

    return LibraryItemsState(
      items: result.items,
      hasMore: result.hasMore,
      error: result.error,
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

    final library = await ref.read(activeLibraryProvider.future);
    final params = ref.watch(
      libraryFiltersProvider(.audiobook).select((s) => s.toItemParams()),
    );
    final limit = ref.read(defaultItemsLimitProvider);
    final nextPage = (currentState.items.length / limit).ceil();

    final result = await _fetchPage(
      nextPage,
      params: params,
      libId: library.id,
    );

    state = AsyncData(
      currentState.copyWith(
        items: [...currentState.items, ...result.items],
        isLoadingMore: false,
        hasMore: result.hasMore && result.items.isNotEmpty,
        error: result.error,
      ),
    );
  }

  Future<void> manualSync() async {
    ref.invalidateSelf();
    await future;
  }

  Future<({List<ItemDomain> items, bool hasMore, Object? error})> _fetchPage(
    int page, {
    required LibraryItemsRequestParams params,
    required String libId,
  }) async {
    try {
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
        error: null,
      );
    } catch (e, st) {
      _logError('fetchPage(page: $page)', e, st);
      return (
        items: <ItemDomain>[],
        hasMore: false,
        error: AppError.resolve(e),
      );
    }
  }

  void _logError(String action, Object e, StackTrace st) {
    ref
        .read(logsProvider.notifier)
        .log(
          'Error during $action: ${AppError.resolve(e)}',
          level: .error,
          source: 'LibraryItemsNotifier',
          stackTrace: st,
        );
  }
}
