import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/library.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/filter_data_provider.dart';
import 'package:storii/features/library/logic/user_libraries_provider.dart';
import 'package:storii/shared/helpers/extensions.dart';
part 'active_library_provider.g.dart';

@Riverpod(keepAlive: true)
Future<LibraryDomain> activeLibrary(Ref ref) async {
  final user = await ref.watch(authenticatedUserProvider.future);

  final libraries = await ref.watch(userLibrariesProvider.future);
  if (libraries.isEmpty) throw StateError('No libraries found');

  final currentLibraryId = ref.watch(currentLibraryIdProvider);
  final library =
      libraries.firstWhereOrNull((l) => l.id == currentLibraryId) ??
      libraries.first;
  if (currentLibraryId != library.id) {
    await ref
        .read(userSettingsProvider.notifier)
        .setCurrentLibraryId(library.id);
  }
  final api = ref.read(libraryApiProvider(user));
  final response = await api.get(library.id);

  ref.read(filterDataProvider.notifier).set(response.filterData);

  return response.library.toDomain(user.serverUrl);
}
