import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'item_detail_provider.g.dart';

@riverpod
Future<ItemDomain> itemDetail(Ref ref, String id) async {
  final user = await ref.read(authenticatedUserProvider.future);
  final api = ref.read(itemApiProvider(user));
  try {
    final item = await api.get(id);
    return item.toDomain();
  } catch (e, s) {
    final error = AppError.resolve(e);
    LogService.log(
      'Error fetching library item details: $error',
      source: 'itemDetailProvider',
      level: .error,
      stackTrace: s,
    );
    throw error;
  }
}

@riverpod
Future<ItemDomain> item(Ref ref, String id) async {
  final user = await ref.read(authenticatedUserProvider.future);
  final api = ref.read(itemApiProvider(user));
  try {
    final item = await api.get(id, isExpanded: false);
    return item.toDomain();
  } catch (e, s) {
    final error = AppError.resolve(e);
    LogService.log(
      'Error fetching library item: $error',
      source: 'itemProvider',
      level: .error,
      stackTrace: s,
    );
    throw error;
  }
}
