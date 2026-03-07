import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'shelves_provider.g.dart';

@riverpod
Future<List<Shelf>> shelves(Ref ref) async {
  //! TODO: only invalidate on socket event
  ref.invalidate(mediaProgressMapProvider);

  final rawShelves = await ref.watch(rawShelvesProvider.future);
  final progressMap = await ref.watch(mediaProgressMapProvider.future);

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
}

@riverpod
Future<List<Shelf>> rawShelves(Ref ref) async {
  final libraryId = (await ref.watch(
    activeLibraryDetailsProvider.future,
  )).library.id;
  try {
    final user = await ref.read(authenticatedUserProvider.future);
    final rawShelves = await ref
        .read(libraryApiProvider(user))
        .getPersonalized(libraryId);
    return rawShelves;
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
