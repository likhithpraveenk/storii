import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/author.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'author_provider.g.dart';

@riverpod
Future<Author> author(Ref ref, String authorId) async {
  final user = await ref.watch(authenticatedUserProvider.future);
  final libraryId = (await ref.watch(activeLibraryProvider.future)).id;
  final api = ref.read(authorApiProvider(user));
  try {
    final author = await api.get(authorId, libraryId);
    return author.toDomain(libraryId);
  } catch (e, s) {
    final error = AppError.resolve(e);
    ref
        .read(logsProvider.notifier)
        .log(
          'Error fetching author: $error',
          source: 'authorProvider',
          level: .error,
          stackTrace: s.toLimitedString(),
        );
    throw error;
  }
}
