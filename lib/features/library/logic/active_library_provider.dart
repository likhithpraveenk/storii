import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/library.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/libraries_provider.dart';

part 'active_library_provider.g.dart';

@riverpod
Future<Library> activeLibrary(Ref ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) throw StateError('No current user');

  final currentLibraryId = ref.watch(currentLibraryIdProvider(user.id));

  final libraries = await ref.watch(userLibrariesProvider.future);
  if (libraries.isEmpty) throw StateError('No libraries found');

  return libraries.firstWhere(
    (l) => l.id == currentLibraryId,
    orElse: () => libraries.first,
  );
}
