import 'package:freezed_annotation/freezed_annotation.dart';

part 'rss_feed_metadata.freezed.dart';
part 'rss_feed_metadata.g.dart';

@freezed
sealed class RssFeedMetadata with _$RssFeedMetadata {
  const factory({
    required String title,
    required String description,
    required String author,
    required Uri imageUrl,
    required Uri feedUrl,
    required Uri link,
    required bool explicit,
  }) = _RssFeedMetadata;

  factory fromJson(Map<String, dynamic> json) =>
      _$RssFeedMetadataFromJson(json);
}
