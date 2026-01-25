import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/shelf.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'shelves_provider.g.dart';

@Riverpod(keepAlive: true)
class ShelvesNotifier extends _$ShelvesNotifier {
  @override
  Future<List<ShelfDomain>> build() async {
    final library = await ref.watch(activeLibraryProvider.future);
    return _fetchShelves(library.id);
  }

  Future<List<ShelfDomain>> _fetchShelves(String libraryId) async {
    final user = await ref.read(authenticatedUserProvider.future);
    try {
      final response = await ref
          .read(libraryApiProvider(user))
          .getPersonalized(libraryId);

      return response.map((e) => e.toDomain(libraryId)).toList();
    } catch (e, s) {
      final error = AppError.resolve(e);
      LogService.log(
        'Error getting personalized home: $error',
        stackTrace: s,
        level: .error,
      );
      throw error;
    }
  }

  Future<void> manualSync() async {
    final library = ref.read(activeLibraryProvider).value;
    if (library == null) return;
    state = await AsyncValue.guard(() => _fetchShelves(library.id));
  }
}
