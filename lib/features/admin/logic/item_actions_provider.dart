import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/init.dart';
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
      final result = await ref.logApiCall(
        () => api.scan(libraryItemId: itemId),
        logMessage: 'Error scanning item',
        source: 'scanItem',
      );
      return switch (result) {
        .added => l10n.itemScanAdded,
        .updated => l10n.itemScanUpdated,
        .removed => l10n.itemScanRemoved,
        .upToDate => l10n.itemScanUpToDate,
        .nothing => l10n.itemScanNothing,
        _ => null,
      };
    } finally {
      state = AsyncData({...?state.value}..remove(itemId));
    }
  }
}
