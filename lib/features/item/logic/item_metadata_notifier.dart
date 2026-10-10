import 'package:abs_api/abs_api.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'item_metadata_notifier.freezed.dart';
part 'item_metadata_notifier.g.dart';

@freezed
abstract class EditorState with _$EditorState {
  const new _();

  const factory({
    required Media original,
    required Media draft,
    required String libraryId,
    required DateTime updatedAt,
    @Default(false) bool saving,
  }) = _EditorState;

  bool get isDirty => original != draft;
  bool get isValid => draft.metadata.title?.trim().isNotEmpty == true;
  bool get canSave => isDirty && isValid && !saving;

  bool get isBook => original is BookMedia;
}

@riverpod
class ItemMetadataNotifier extends _$ItemMetadataNotifier {
  @override
  Future<EditorState> build(String id) async {
    final item = await ref.watch(itemDetailProvider(id).future);
    return EditorState(
      original: item.media,
      draft: item.media,
      libraryId: item.libraryId,
      updatedAt: item.updatedAt,
    );
  }

  void updateDraft(Media media) {
    final curr = state.value;
    if (curr == null) return;
    state = AsyncData(curr.copyWith(draft: media));
  }

  Future<bool> updateMetadata() async {
    final curr = state.value;
    if (curr == null || !curr.canSave) return false;
    state = AsyncData(curr.copyWith(saving: true));
    try {
      final params = diffMedia(draft: curr.draft, original: curr.original);
      await ref.logApiCall(() async {
        final user = await ref.read(authenticatedUserProvider.future);
        final api = await ref.read(itemApiProvider(user).future);
        await api.updateMedia(libraryItemId: id, parameters: params);
      }, source: 'ItemMetadataNotifier');
      return true;
    } catch (e) {
      return false;
    } finally {
      if (ref.mounted) {
        final latest = state.value;
        if (latest != null) {
          state = AsyncData(latest.copyWith(saving: false));
        }
      }
    }
  }

  Future<String> pickAndUploadCover() async {
    final file = await FilePicker.pickFile(
      type: .custom,
      allowedExtensions: ['png', 'jpg', 'jpeg', 'webp'],
    );
    if (file == null || file.path == null) {
      return l10n.cancelled;
    }

    try {
      final user = await ref.read(authenticatedUserProvider.future);
      final api = await ref.read(itemApiProvider(user).future);
      final response = await api.uploadCover(
        libraryItemId: id,
        coverFile: FileUpload.fromPath(
          filename: file.name,
          filePath: file.path!,
        ),
      );
      if (response.success) {
        state = AsyncData(state.value!.copyWith(updatedAt: DateTime.now()));
        return l10n.success;
      } else {
        return l10n.failed;
      }
    } catch (e, st) {
      LogService.log(
        'failed to upload cover',
        level: .error,
        originalError: e,
        stackTrace: st,
        source: 'ItemMetadataNotifier',
      );
      return l10n.failed;
    }
  }

  Future<bool> removeCover() async {
    try {
      final user = await ref.read(authenticatedUserProvider.future);
      final api = await ref.read(itemApiProvider(user).future);
      await api.removeCover(libraryItemId: id);
      state = AsyncData(state.value!.copyWith(updatedAt: DateTime.now()));
      return true;
    } catch (e, st) {
      LogService.log(
        'failed to remove cover',
        level: .error,
        originalError: e,
        stackTrace: st,
        source: 'ItemMetadataNotifier',
      );
      return false;
    }
  }
}

T? _diff<T>(T? draft, T? original) => draft == original ? null : draft;

UpdateItemMediaReqParams diffMedia({
  required Media draft,
  required Media original,
}) => switch ((draft, original)) {
  (final BookMedia m, final BookMedia o) => UpdateBookReqParams(
    tags: _diff(m.tags, o.tags),
    metadata: _toBookMetadata(
      m.metadata as BookMetadata,
      o.metadata as BookMetadata,
    ),
  ),
  (final PodcastMedia m, final PodcastMedia o) => UpdatePodcastReqParams(
    tags: _diff(m.tags, o.tags),
    metadata: _toPodcastMetadata(
      m.metadata as PodcastMetadata,
      o.metadata as PodcastMetadata,
    ),
    autoDownloadEpisodes: _diff(m.autoDownloadEpisodes, o.autoDownloadEpisodes),
    lastEpisodeCheck: _diff(m.lastEpisodeCheck, o.lastEpisodeCheck),
    maxEpisodesToKeep: _diff(m.maxEpisodesToKeep, o.maxEpisodesToKeep),
    maxNewEpisodesToDownload: _diff(
      m.maxNewEpisodesToDownload,
      o.maxNewEpisodesToDownload,
    ),
  ),
  _ => throw ArgumentError('Media type mismatch'),
};

UpdateMediaMetadataReqParams _toBookMetadata(BookMetadata d, BookMetadata o) =>
    UpdateMediaMetadataReqParams.book(
      title: _diff(d.title, o.title),
      subtitle: _diff(d.subtitle, o.subtitle),
      authors: _diff(d.authors, o.authors),
      narrators: _diff(d.narrators, o.narrators),
      series: _diff(d.series, o.series),
      genres: _diff(d.genres, o.genres),
      publishedYear: _diff(d.publishedYear, o.publishedYear),
      publishedDate: _diff(d.publishedDate, o.publishedDate),
      publisher: _diff(d.publisher, o.publisher),
      description: _diff(d.description, o.description),
      isbn: _diff(d.isbn, o.isbn),
      asin: _diff(d.asin, o.asin),
      language: _diff(d.language, o.language),
      explicit: _diff(d.explicit, o.explicit),
      abridged: _diff(d.abridged, o.abridged),
    );

UpdateMediaMetadataReqParams _toPodcastMetadata(
  PodcastMetadata d,
  PodcastMetadata o,
) => UpdateMediaMetadataReqParams.podcast(
  title: _diff(d.title, o.title),
  author: _diff(d.author, o.author),
  description: _diff(d.description, o.description),
  releaseDate: _diff(d.releaseDate, o.releaseDate),
  genres: _diff(d.genres, o.genres),
  feedUrl: _diff(d.feedUrl, o.feedUrl),
  imageUrl: _diff(d.imageUrl, o.imageUrl),
  itunesPageUrl: _diff(d.itunesPageUrl, o.itunesPageUrl),
  itunesId: _diff(d.itunesId, o.itunesId),
  itunesArtistId: _diff(d.itunesArtistId, o.itunesArtistId),
  podcastType: _diff(d.podcastType, o.podcastType),
  explicit: _diff(d.explicit, o.explicit),
  language: _diff(d.language, o.language),
);
