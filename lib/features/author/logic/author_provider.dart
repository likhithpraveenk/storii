import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/media_progress_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'author_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Author> author(Ref ref, String authorId) async {
  final user = await ref.watch(authenticatedUserProvider.future);
  final libraryId = (await ref.watch(
    activeLibraryDetailsProvider.future,
  )).library.id;

  final api = ref.read(authorApiProvider(user));
  final progressMap = await ref.watch(mediaProgressProvider.future);
  try {
    final author = await api.get(authorId, libraryId);
    final seriesBookIds = (author.series ?? [])
        .expand((s) => s.books)
        .map((item) => item.id)
        .toSet();
    final standaloneBooks = (author.libraryItems ?? [])
        .where((book) => !seriesBookIds.contains(book.id))
        .toList();
    return author.copyWith(
      series: author.series
          ?.map(
            (s) => s.copyWith(
              books: s.books
                  .map((i) => i.copyWith(userMediaProgress: progressMap[i.id]))
                  .toList(),
            ),
          )
          .toList(),
      libraryItems: standaloneBooks
          .map((i) => i.copyWith(userMediaProgress: progressMap[i.id]))
          .toList(),
    );
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
