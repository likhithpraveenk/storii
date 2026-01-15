import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/shelf.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'shelves_provider.g.dart';

@Riverpod(keepAlive: true)
class ShelvesNotifier extends _$ShelvesNotifier {
  @override
  Future<List<Shelf>> build() async {
    final library = await ref.watch(activeLibraryProvider.future);
    return _fetchShelves(library.id);
  }

  Future<List<Shelf>> _fetchShelves(String libraryId) async {
    final user = await ref.read(authenticatedUserProvider.future);
    try {
      final response = await ref
          .read(libraryApiProvider(user))
          .getPersonalized(libraryId);

      return response.map((e) => e.toDomain(libraryId)).toList();
    } catch (e, s) {
      final error = AppError.resolve(e);
      ref
          .read(logsProvider.notifier)
          .log(
            'Error getting personalized home: $error',
            stackTrace: s.toLimitedString(),
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
