import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'library_items_provider.g.dart';

@Riverpod(keepAlive: true)
class LibraryItemsNotifier extends _$LibraryItemsNotifier {
  @override
  Future<List<LibraryItem>> build() async {
    final library = await ref.watch(activeLibraryProvider.future);
    final params = ref.watch(
      libraryFiltersProvider(.library).select((s) => s.toItemParams()),
    );

    final items = await _fetchItems(params: params, libId: library.id);
    return items;
  }

  Future<void> manualSync() async {
    ref.invalidateSelf();
    await future;
  }

  Future<List<LibraryItem>> _fetchItems({
    required LibraryItemsRequestParams params,
    required String libId,
  }) async {
    try {
      final user = await ref.read(authenticatedUserProvider.future);
      final api = ref.read(libraryApiProvider(user));

      final response = await api.getItems(libId, params);

      return response.results;
    } catch (e, st) {
      final error = AppError.resolve(e);
      LogService.log(
        'Error fetching items: $error',
        level: .error,
        source: 'LibraryItemsNotifier',
        stackTrace: st,
      );
      throw error;
    }
  }
}
