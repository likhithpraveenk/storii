import 'package:abs_api/src/models/author.dart';
import 'package:abs_api/src/models/book_chapter.dart';
import 'package:abs_api/src/models/series.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_item_media_req_params.freezed.dart';
part 'update_item_media_req_params.g.dart';

@freezed
sealed class UpdateItemMediaReqParams with _$UpdateItemMediaReqParams {
  const factory book({
    String? coverPath,
    List<String>? tags,
    UpdateMediaMetadataReqParams? metadata,
    List<BookChapter>? chapters,
  }) = UpdateBookReqParams;

  const factory podcast({
    String? coverPath,
    List<String>? tags,
    UpdateMediaMetadataReqParams? metadata,
    bool? autoDownloadEpisodes,
    @JsonKey(includeIfNull: true) DateTime? lastEpisodeCheck,
    int? maxEpisodesToKeep,
    int? maxNewEpisodesToDownload,
  }) = UpdatePodcastReqParams;

  factory fromJson(Map<String, dynamic> json) =>
      _$UpdateItemMediaReqParamsFromJson(json);
}

@freezed
sealed class UpdateMediaMetadataReqParams with _$UpdateMediaMetadataReqParams {
  const factory book({
    String? title,
    String? subtitle,
    List<Author>? authors,
    List<String>? narrators,
    List<Series>? series,
    List<String>? genres,
    String? publishedYear,
    String? publishedDate,
    String? publisher,
    String? description,
    String? isbn,
    String? asin,
    String? language,
    bool? explicit,
  }) = UpdateBookMetadataReqParams;

  const factory podcast({
    String? title,
    String? author,
    String? description,
    String? releaseDate,
    List<String>? genres,
    String? feedUrl,
    String? imageUrl,
    String? itunesPageUrl,
    int? itunesId,
    int? itunesArtistId,
    bool? explicit,
    String? language,
  }) = UpdatePodcastMetadataReqParams;

  factory fromJson(Map<String, dynamic> json) =>
      _$UpdateMediaMetadataReqParamsFromJson(json);
}
