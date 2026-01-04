import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_meta_tags.freezed.dart';
part 'audio_meta_tags.g.dart';

@freezed
sealed class AudioMetaTags with _$AudioMetaTags {
  @JsonSerializable(includeIfNull: false)
  const factory AudioMetaTags({
    String? tagAlbum,
    String? tagArtist,
    String? tagGenre,
    String? tagTitle,
    String? tagSeries,
    String? tagSeriesPart,
    String? tagTrack,
    String? tagDisc,
    String? tagSubtitle,
    String? tagAlbumArtist,
    String? tagDate,
    String? tagComposer,
    String? tagPublisher,
    String? tagComment,
    String? tagDescription,
    String? tagEncoder,
    String? tagEncodedBy,
    String? tagIsbn,
    String? tagLanguage,
    String? tagASIN,
    String? tagOverdriveMediaMarker,
    String? tagOriginalYear,
    String? tagReleaseCountry,
    String? tagReleaseType,
    String? tagReleaseStatus,
    String? tagISRC,
    String? tagMusicBrainzTrackId,
    String? tagMusicBrainzAlbumId,
    String? tagMusicBrainzAlbumArtistId,
    String? tagMusicBrainzArtistId,
  }) = _AudioMetaTags;

  factory AudioMetaTags.fromJson(Map<String, dynamic> json) =>
      _$AudioMetaTagsFromJson(json);
}
