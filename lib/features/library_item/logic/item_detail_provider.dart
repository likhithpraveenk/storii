import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/library_item.dart';
import 'package:storii/app/models/to_domain.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/logs_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'item_detail_provider.g.dart';

@riverpod
Future<LibraryItem> itemDetail(Ref ref, String id) async {
  final user = await ref.read(authenticatedUserProvider.future);
  final api = ref.read(itemApiProvider(user));
  try {
    final item = await api.get(id);
    return item.toDomain();
  } catch (e, s) {
    final error = AppError.resolve(e);
    ref
        .read(logsProvider.notifier)
        .log(
          'Error fetching library item details: $error',
          source: 'itemDetailProvider',
          level: .error,
          stackTrace: s.toLimitedString(),
        );
    throw error;
  }
}

@riverpod
Future<LibraryItem> item(Ref ref, String id) async {
  final user = await ref.read(authenticatedUserProvider.future);
  final api = ref.read(itemApiProvider(user));
  try {
    final item = await api.get(id, isExpanded: false);
    return item.toDomain();
  } catch (e, s) {
    final error = AppError.resolve(e);
    ref
        .read(logsProvider.notifier)
        .log(
          'Error fetching library item: $error',
          source: 'itemProvider',
          level: .error,
          stackTrace: s.toLimitedString(),
        );
    throw error;
  }
}
