import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/author.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'library_author_provider.g.dart';

@Riverpod(keepAlive: true)
class LibraryAuthorNotifier extends _$LibraryAuthorNotifier {
  @override
  Future<List<Author>> build() async {
    return _fetchAuthors();
  }

  Future<List<Author>> _fetchAuthors() async {
    final library = await ref.watch(activeLibraryProvider.future);
    final user = await ref.read(authenticatedUserProvider.future);
    try {
      final response = await ref
          .read(libraryApiProvider(user))
          .getAuthors(library.id);

      final items = response.map((i) => i.toDomain(library.id)).toList();
      return items;
    } catch (e, st) {
      final error = AppError.resolve(e);
      ref
          .read(logsProvider.notifier)
          .log(
            'LibraryAuthorNotifier: $error',
            level: .error,
            stackTrace: st.toLimitedString(),
          );
      throw error;
    }
  }

  Future<void> manualSync() async {
    state = await AsyncValue.guard(_fetchAuthors);
  }
}
