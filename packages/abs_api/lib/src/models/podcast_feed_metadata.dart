import 'package:freezed_annotation/freezed_annotation.dart';

part 'podcast_feed_metadata.freezed.dart';
part 'podcast_feed_metadata.g.dart';

@freezed
sealed class PodcastFeedMetadata with _$PodcastFeedMetadata {
  const factory({
    required Uri image,
    required List<String> categories,
    required Uri feedUrl,
    required String description,
    required String descriptionPlain,
    required String title,
    required String language,
    required String explicit,
    required String author,
    required String pubDate,
    required Uri link,
  }) = _PodcastFeedMetadata;

  factory fromJson(Map<String, dynamic> json) =>
      _$PodcastFeedMetadataFromJson(json);
}
