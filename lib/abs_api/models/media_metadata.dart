import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/author.dart';
import 'package:storii/abs_api/models/enums.dart';
import 'package:storii/abs_api/models/series.dart';

part 'media_metadata.freezed.dart';
part 'media_metadata.g.dart';

@freezed
sealed class MediaMetadata with _$MediaMetadata {
  const MediaMetadata._();

  const factory MediaMetadata.book({
    String? title,
    String? titleIgnorePrefix,
    String? subtitle,
    List<Author>? authors,
    List<String>? narrators,
    @JsonKey(readValue: _readSeries) List<Series>? series,
    @Default([]) List<String> genres,
    String? publishedYear,
    String? publishedDate,
    String? publisher,
    String? description,
    String? isbn,
    String? asin,
    String? language,
    @Default(false) bool explicit,
    bool? abridged,
    String? authorName,
    String? authorNameLF,
    String? narratorName,
    String? seriesName,
    String? descriptionPlain,
  }) = BookMetadata;

  const factory MediaMetadata.podcast({
    String? title,
    String? titleIgnorePrefix,
    String? author,
    String? description,
    DateTime? releaseDate,
    @Default([]) List<String> genres,
    Uri? feedUrl,
    Uri? imageUrl,
    Uri? itunesPageUrl,
    int? itunesId,
    int? itunesArtistId,
    @Default(false) bool explicit,
    String? language,
  }) = PodcastMetadata;

  factory MediaMetadata.fromJson(Map<String, dynamic> json) =>
      const MediaMetadataConverter().fromJson(json);
}

class MediaMetadataConverter
    implements JsonConverter<MediaMetadata, Map<String, dynamic>> {
  const MediaMetadataConverter();

  @override
  MediaMetadata fromJson(Map<String, dynamic> json) {
    if (json.containsKey('runtimeType')) return _$MediaMetadataFromJson(json);

    final MediaType mediaType;
    if (json.containsKey('authors') || json.containsKey('authorName')) {
      mediaType = .book;
    } else if (json.containsKey('author')) {
      mediaType = .podcast;
    } else {
      throw CheckedFromJsonException(
        json,
        '(authors || authorName) || author',
        'MediaMetadata',
        'Unknown media type',
      );
    }

    return switch (mediaType) {
      .book => BookMetadata.fromJson(json),
      .podcast => PodcastMetadata.fromJson(json),
    };
  }

  @override
  Map<String, dynamic> toJson(MediaMetadata metadata) => metadata.toJson();
}

Object? _readSeries(Map json, String key) {
  final value = json[key];
  if (value is Map) return [value];
  return value;
}
