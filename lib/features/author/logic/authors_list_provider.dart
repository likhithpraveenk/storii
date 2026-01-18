import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/author.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'authors_list_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthorsListNotifier extends _$AuthorsListNotifier {
  @override
  Stream<List<AuthorDomain>> build() async* {
    final library = await ref.watch(activeLibraryProvider.future);

    final params = ref.watch(
      libraryFiltersProvider(.author).select((s) => s.toAuthorParams()),
    );

    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(libraryApiProvider(user));

    try {
      final response = await api.getAuthors(library.id, params);
      yield response.map((i) => i.toDomain(library.id)).toList();
    } catch (e, st) {
      _logError(e, st);
      throw AppError.resolve(e);
    }
  }

  Future<void> manualSync() async {
    ref.invalidate(libraryFiltersProvider(.author));
    ref.invalidateSelf();
    await future;
  }

  void _logError(Object e, StackTrace st) {
    ref
        .read(logsProvider.notifier)
        .log(
          'error getting authors: ${AppError.resolve(e)}',
          level: .error,
          source: 'AuthorsListNotifier',
          stackTrace: st,
        );
  }
}
