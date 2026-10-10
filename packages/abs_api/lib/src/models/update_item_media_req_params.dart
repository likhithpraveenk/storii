import 'package:abs_api/src/models/author.dart';
import 'package:abs_api/src/models/enums.dart';
import 'package:abs_api/src/models/series.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_item_media_req_params.freezed.dart';
part 'update_item_media_req_params.g.dart';

@freezed
sealed class UpdateItemMediaReqParams with _$UpdateItemMediaReqParams {
  const factory book({
    List<String>? tags,
    UpdateMediaMetadataReqParams? metadata,
  }) = UpdateBookReqParams;

  const factory podcast({
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
    bool? abridged,
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
    String? itunesId,
    String? itunesArtistId,
    PodcastType? podcastType,
    bool? explicit,
    String? language,
    String? type,
  }) = UpdatePodcastMetadataReqParams;

  factory fromJson(Map<String, dynamic> json) =>
      _$UpdateMediaMetadataReqParamsFromJson(json);
}
