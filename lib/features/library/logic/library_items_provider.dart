import 'package:riverpod_annotation/riverpod_annotation.dart';
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
  @override
  Future<List<LibraryItem>> build() async {
    final library = await ref.watch(activeLibraryProvider.future);
    return _fetchItems(library.id);
  }

  Future<List<LibraryItem>> _fetchItems(String libraryId) async {
    final user = await ref.read(authenticatedUserProvider.future);
    try {
      final response = await ref
          .read(libraryApiProvider(user))
          .getItems(libraryId, null);

      final items = response.results.map((i) => i.toDomain()).toList();
      return items;
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

  Future<void> manualSync() async {
    final library = await ref.watch(activeLibraryProvider.future);
    state = await AsyncValue.guard(() => _fetchItems(library.id));
  }
}
