import 'package:storii/api/endpoints/api_routes.dart';

String? getCoverUrl(
  Uri? url,
  String id,
  DateTime updatedAt, {
  int? width,
  bool raw = false,
}) {
  return url
      ?.resolve(ApiRoutes.itemCover(id))
      .replace(
        queryParameters: {
          'ts': updatedAt.millisecondsSinceEpoch.toString(),
          if (raw) 'raw': '1',
          if (width != null) 'width': '$width',
        },
      )
      .toString();
}
