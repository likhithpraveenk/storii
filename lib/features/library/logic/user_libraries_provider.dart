import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'user_libraries_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Library>> userLibraries(Ref ref) async {
  final user = await ref.watch(authenticatedUserProvider.future);
  final api = ref.read(libraryApiProvider(user));

  try {
    final libraries = await api.getAll();
    return libraries;
  } catch (e, st) {
    final error = AppError.resolve(e);
    LogService.log(
      'Error fetching user libraries: ${error.message}',
      source: 'userLibraries',
      level: .error,
      stackTrace: st,
    );
    throw error;
  }
}
