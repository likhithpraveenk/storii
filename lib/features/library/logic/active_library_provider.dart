import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/filter_data_provider.dart';
import 'package:storii/features/library/logic/user_libraries_provider.dart';

part 'active_library_provider.g.dart';

@Riverpod(keepAlive: true)
Future<LibraryResponse> activeLibraryDetails(Ref ref) async {
  final currentLibrary = ref.watch(currentLibraryProvider);

  Future<LibraryResponse> fetchFullLibrary(Library lib) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(libraryApiProvider(user));
    return await api.get(lib.id);
  }

  if (currentLibrary == null) {
    final libraries = await ref.watch(userLibrariesProvider.future);
    if (libraries.isEmpty) throw StateError('No libraries found');

    final sortedLibraries = libraries
      ..sort((a, b) => a.displayOrder.compareTo(b.displayOrder));
    return fetchFullLibrary(sortedLibraries.first);
  }

  return fetchFullLibrary(currentLibrary);
}

@riverpod
void librarySyncController(Ref ref) {
  ref.listen(activeLibraryDetailsProvider, (prev, next) {
    next.whenData((response) {
      ref.read(filterDataProvider.notifier).set(response.filterData);
      ref
          .read(userSettingsProvider.notifier)
          .setCurrentLibrary(response.library);
    });
  });
}
