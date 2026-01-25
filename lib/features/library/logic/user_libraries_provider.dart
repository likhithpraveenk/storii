import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/library.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'user_libraries_provider.g.dart';

@riverpod
Future<List<LibraryDomain>> userLibraries(Ref ref) async {
  final user = await ref.watch(authenticatedUserProvider.future);
  final api = ref.read(libraryApiProvider(user));

  try {
    final librariesDto = await api.getAll();
    return librariesDto.map((l) => l.toDomain(user.serverUrl)).toList();
  } catch (e, st) {
    final error = AppError.resolve(e);
    LogService.log(
      'Error fetching user libraries: ${error.message}',
      source: 'UserLibrariesProvider',
      level: .error,
      stackTrace: st,
    );
    throw error;
  }
}
