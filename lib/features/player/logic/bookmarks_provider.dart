import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/user_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'bookmarks_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Bookmark>> bookmarks(Ref ref, String itemId) async {
  final user = await ref.watch(serverUserProvider.future);
  return user.bookmarks.where((b) => b.libraryItemId == itemId).toList()
    ..sort((a, b) => a.time.compareTo(b.time));
}

@Riverpod(keepAlive: true)
class BookmarksController extends _$BookmarksController {
  @override
  void build(String itemId) {}

  Future<bool> create({required Duration time, required String title}) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(meApiProvider(user));
    try {
      await ref.logApiCall(
        () =>
            api.createBookmark(libraryItemId: itemId, time: time, title: title),
        source: 'BookmarksNotifier',
        logMessage: 'creating bookmark failed',
      );
      return true;
    } on AppError catch (_) {
      return false;
    }
  }

  Future<bool> modify({required Duration time, required String title}) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(meApiProvider(user));
    try {
      await ref.logApiCall(
        () =>
            api.updateBookmark(libraryItemId: itemId, time: time, title: title),
        source: 'BookmarksNotifier',
        logMessage: 'updating bookmark failed',
      );
      return true;
    } on AppError catch (_) {
      return false;
    }
  }

  Future<bool> remove({required Duration time}) async {
    final user = await ref.read(authenticatedUserProvider.future);
    final api = ref.read(meApiProvider(user));
    try {
      await ref.logApiCall(
        () => api.removeBookmark(libraryItemId: itemId, time: time),
        source: 'BookmarksNotifier',
        logMessage: 'removing bookmark failed',
      );
      return true;
    } on AppError catch (_) {
      return false;
    }
  }
}
