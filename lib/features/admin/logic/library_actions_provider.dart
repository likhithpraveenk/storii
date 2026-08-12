import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/admin/logic/task_stream_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'library_actions_provider.g.dart';

@riverpod
class ScanLibrary extends _$ScanLibrary {
  @override
  Future<Set<String>> build() async {
    ref.listen(taskStartProvider, (_, next) {
      final start = next.value;
      if (start?.data?.libraryId != null) {
        state = AsyncData({...?state.value}..add(start!.data!.libraryId!));
      }
    });

    ref.listen(taskCompleteProvider, (_, next) {
      final complete = next.value;
      if (complete?.data?.libraryId != null) {
        state = AsyncData(
          {...?state.value}..remove(complete!.data!.libraryId!),
        );
      }
    });

    return {};
  }

  Future<void> scan(String libraryId) async {
    final user = await ref.watch(authenticatedUserProvider.future);
    final api = ref.read(libraryApiProvider(user));

    return ref.logApiCall(
      () => api.scan(libraryId),
      logMessage: 'Error scanning library',
      source: 'scanLibrary',
    );
  }
}
