import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';

part 'current_item_provider.g.dart';

@riverpod
Future<ItemDomain?> currentItem(Ref ref) async {
  final itemId = ref.watch(currentItemIdProvider);
  if (itemId == null) return null;
  final audiobook = await ref.watch(itemDetailProvider(itemId).future);
  return audiobook;
}
