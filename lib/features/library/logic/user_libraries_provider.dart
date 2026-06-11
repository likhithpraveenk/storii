import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'user_libraries_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Library>> userLibraries(Ref ref) async {
  final user = await ref.watch(authenticatedUserProvider.future);
  final api = ref.read(libraryApiProvider(user));

  return ref.logApiCall(
    api.getAll,
    logMessage: 'Error fetching user libraries',
    source: 'userLibraries',
  );
}
