import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'item_actions_provider.g.dart';

@Riverpod(keepAlive: true)
class ScanItem extends _$ScanItem {
  @override
  Future<Set<String>> build() async => {};

  Future<String?> scan(String itemId) async {
    final user = await ref.watch(authenticatedUserProvider.future);
    final api = ref.read(itemApiProvider(user));

    try {
      state = AsyncData({...?state.value}..add(itemId));
      // TODO: use the nullable result below and convert to appropriate string for ui. add relevant strings to app_en.arb. run flutter pub get to regenerate strings
      final result = await ref.logApiCall(
        () => api.scan(libraryItemId: itemId),
        logMessage: 'Error scanning item',
        source: 'scanItem',
      );
      return result?.name;
    } finally {
      state = AsyncData({...?state.value}..remove(itemId));
    }
  }
}
