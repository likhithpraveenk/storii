import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/models/author.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'authors_list_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthorsListNotifier extends _$AuthorsListNotifier {
  AuthorsRequestParams _currentParams = AuthorsRequestParams(
    sort: AuthorSort.name.value,
    desc: false,
  );

  @override
  Stream<List<AuthorDomain>> build() async* {
    final library = await ref.watch(activeLibraryProvider.future);

    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(libraryApiProvider(user));

    try {
      final response = await api.getAuthors(library.id, _currentParams);

      final items = response.map((i) => i.toDomain(library.id)).toList();
      yield items;
    } catch (e, st) {
      final error = AppError.resolve(e);
      ref
          .read(logsProvider.notifier)
          .log(
            'error getting authors: $error',
            level: .error,
            source: 'AuthorsListNotifier',
            stackTrace: st,
          );
      throw error;
    }
  }

  Future<void> filterAuthors(AuthorsRequestParams params) async {
    _currentParams = params;
    ref.invalidateSelf();
    await future;
  }

  Future<void> manualSync() async {
    _currentParams = AuthorsRequestParams(
      sort: AuthorSort.name.value,
      desc: false,
    );
    ref.invalidateSelf();
    await future;
  }
}
