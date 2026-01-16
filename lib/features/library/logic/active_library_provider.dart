import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/library.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/user_libraries_provider.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'active_library_provider.g.dart';

@riverpod
Future<LibraryDomain> activeLibrary(Ref ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) throw StateError('No current user');

  final currentLibraryId = ref.watch(currentLibraryIdProvider(user.id));

  final libraries = await ref.watch(userLibrariesProvider.future);
  if (libraries.isEmpty) throw StateError('No libraries found');
  final library = libraries.firstWhereOrNull((l) => l.id == currentLibraryId);
  if (library != null) return library;
  ref
      .read(userSettingsProvider(user.id).notifier)
      .setCurrentLibraryId(libraries.first.id);
  return libraries.first;
}
