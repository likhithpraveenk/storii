import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/models/requests/library_items_request_params.dart';
import 'package:storii/app/models/library_item.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'library_items_provider.g.dart';

@Riverpod(keepAlive: true)
class LibraryItemsNotifier extends _$LibraryItemsNotifier {
  static const int _defaultLimit = 100;

  LibraryItemsRequestParams _currentParams = const LibraryItemsRequestParams(
    sort: .title,
    desc: false,
    page: 0,
    limit: _defaultLimit,
  );

  @override
  Stream<List<LibraryItem>> build() async* {
    yield* _fetchItems(_currentParams);
  }

  Future<void> filterItems(LibraryItemsRequestParams params) async {
    _currentParams = params.copyWith(
      page: params.page ?? 0,
      limit: params.limit ?? _defaultLimit,
    );
    ref.invalidateSelf();
    await future;
  }

  Stream<List<LibraryItem>> _fetchItems(
    LibraryItemsRequestParams params,
  ) async* {
    final library = await ref.watch(activeLibraryProvider.future);

    final effectiveParams = params;

    try {
      final items = <LibraryItem>[];

      yield* _fetchPageRecursive(
        libraryId: library.id,
        params: effectiveParams,
        accumulator: items,
      );
    } catch (e, st) {
      final error = AppError.resolve(e);
      ref
          .read(logsProvider.notifier)
          .log(
            'LibraryItemsNotifier: $error',
            level: .error,
            stackTrace: st.toLimitedString(),
          );
      throw error;
    }
  }

  Stream<List<LibraryItem>> _fetchPageRecursive({
    required String libraryId,
    required LibraryItemsRequestParams params,
    required List<LibraryItem> accumulator,
  }) async* {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(libraryApiProvider(user));
    final response = await api.getItems(libraryId, params);

    final newItems = response.results.map((i) => i.toDomain());
    accumulator.addAll(newItems);

    yield List.unmodifiable(accumulator);

    final fetchedSoFar = accumulator.length;

    if (fetchedSoFar >= response.total) return;

    final nextParams = params.copyWith(page: params.page ?? 0 + 1);

    yield* _fetchPageRecursive(
      libraryId: libraryId,
      params: nextParams,
      accumulator: accumulator,
    );
  }

  Future<void> manualSync() async {
    ref.invalidateSelf();
    await future;
  }
}
