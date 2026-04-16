import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'item_detail_provider.g.dart';

@riverpod
Future<LibraryItem> itemDetail(
  Ref ref,
  String id, {
  bool includeProgress = false,
}) async {
  final user = await ref.read(authenticatedUserProvider.future);
  final api = ref.read(itemApiProvider(user));
  try {
    final item = await api.get(id, includeProgress: includeProgress);
    return item;
  } catch (e) {
    final error = AppError.resolve(e);
    LogService.log(
      'Error fetching library item details: $error',
      source: 'itemDetail',
      level: .error,
    );
    throw error;
  }
}
