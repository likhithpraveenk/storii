import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/providers/settings_provider.dart';

part 'cover_url_provider.g.dart';

enum CoverType { item, author }

@riverpod
String? coverUrl(
  Ref ref,
  String id, {
  required CoverType type,
  DateTime? updatedAt,
  int? width,
  bool raw = false,
}) {
  final route = switch (type) {
    .item => ApiRoutes.itemCover(id),
    .author => ApiRoutes.authorImage(id),
  };
  final user = ref.read(currentUserProvider);
  return user?.serverUrl
      .resolve(route)
      .replace(
        queryParameters: {
          if (updatedAt != null)
            'ts': updatedAt.millisecondsSinceEpoch.toString(),
          if (raw) 'raw': '1',
          if (!raw && width != null) 'width': '$width',
        },
      )
      .toString();
}
