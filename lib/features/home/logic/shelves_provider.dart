import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/media_progress_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'shelves_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Shelf>> shelves(Ref ref) async {
  final library = await ref.watch(activeLibraryProvider.future);
  final progressMap = await ref.refresh(mediaProgressProvider.future);

  try {
    final user = await ref.read(authenticatedUserProvider.future);
    final rawShelves = await ref
        .read(libraryApiProvider(user))
        .getPersonalized(library.id);
    return rawShelves
        .map(
          (s) => switch (s) {
            LibraryItemsShelf() => s.copyWith(
              entities: s.entities
                  .map(
                    (item) =>
                        item.copyWith(userMediaProgress: progressMap[item.id]),
                  )
                  .toList(),
            ),
            _ => s,
          },
        )
        .toList();
  } catch (e, s) {
    final error = AppError.resolve(e);
    LogService.log(
      'Error getting personalized home: $error',
      stackTrace: s,
      level: .error,
      source: 'shelves',
    );
    throw error;
  }
}
