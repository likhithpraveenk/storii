import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/features/admin/logic/task_stream_provider.dart';

part 'library_actions_provider.g.dart';

@riverpod
class ScanLibrary extends _$ScanLibrary {
  @override
  Future<Set<String>> build() async {
    ref.listen(taskStartProvider, (_, next) async {
      final start = next.value;
      if (start?.data?.libraryId != null) {
        final current = await future;
        state = AsyncData({...current}..add(start!.data!.libraryId!));
      }
    });

    ref.listen(taskCompleteProvider, (_, next) async {
      final complete = next.value;
      if (complete?.data?.libraryId != null) {
        final current = await future;
        state = AsyncData({...current}..remove(complete!.data!.libraryId!));
      }
    });

    return {};
  }

  Future<void> scan(String libraryId) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final repo = ref.read(libraryRepositoryProvider(user));
    return repo.scanLibrary(libraryId);
  }
}
