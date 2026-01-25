import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/author.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'author_provider.g.dart';

@riverpod
Future<AuthorDomain> author(Ref ref, String authorId) async {
  final user = await ref.watch(authenticatedUserProvider.future);
  final libraryId = (await ref.watch(activeLibraryProvider.future)).id;
  final api = ref.read(authorApiProvider(user));
  try {
    final author = await api.get(authorId, libraryId);
    return author.toDomain(libraryId);
  } catch (e, s) {
    final error = AppError.resolve(e);
    LogService.log(
      'Error fetching author: $error',
      source: 'authorProvider',
      level: .error,
      stackTrace: s,
    );
    throw error;
  }
}
