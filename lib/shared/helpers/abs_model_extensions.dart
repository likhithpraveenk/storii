//* app-layer extensions on API models

import 'package:abs_api/abs_api.dart';
import 'package:flutter/widgets.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/enums.dart';

extension AudiobookSortX on Iterable<LibraryItem> {
  List<LibraryItem> sortedBySequence() {
    return toList()..sort((a, b) {
      double parseSequence(String? seq) {
        if (seq == null || seq.isEmpty) return 0.0;

        final firstPart = seq.split(RegExp(r'[,\-]')).first;
        final numericPart = firstPart.replaceAll(RegExp(r'[^0-9.]'), '');

        return double.tryParse(numericPart) ?? 0.0;
      }

      final aVal = parseSequence(a.seriesSequence);
      final bVal = parseSequence(b.seriesSequence);

      if (aVal == bVal) {
        return (a.seriesSequence ?? '').length.compareTo(
          (b.seriesSequence ?? '').length,
        );
      }
      return aVal.compareTo(bVal);
    });
  }
}

extension MissingFilterValueX on MissingFilterValue {
  String get label {
    return switch (this) {
      .asin => l10n.asin,
      .isbn => l10n.isbn,
      .subtitle => l10n.subtitle,
      .authors => l10n.authors,
      .publishedYear => l10n.publishedYear,
      .series => l10n.series,
      .description => l10n.description,
      .genres => l10n.genres,
      .tags => l10n.tags,
      .narrators => l10n.narrators,
      .publisher => l10n.publisher,
      .language => l10n.language,
    };
  }
}

extension ProgressFilterValueX on ProgressFilterValue {
  String get label {
    return switch (this) {
      .finished => l10n.finished,
      .notStarted => l10n.notStarted,
      .inProgress => l10n.inProgress,
      .notFinished => l10n.notFinished,
    };
  }
}

extension EbooksFilterValueX on EbooksFilterValue {
  String get label {
    return switch (this) {
      .ebook => l10n.hasEbook,
      .noEbook => l10n.hasNoEbook,
      .supplementary => l10n.hasSupplementary,
      .noSupplementary => l10n.hasNoSupplementary,
    };
  }
}

extension TracksFilterValueX on TracksFilterValue {
  String get label {
    return switch (this) {
      .single => l10n.singleTrack,
      .multi => l10n.multipleTracks,
      .none => l10n.noTracks,
    };
  }
}

extension FilterGroupX on FilterGroup {
  String get label {
    return switch (this) {
      .all => l10n.all,
      .genres => l10n.genres,
      .tags => l10n.tags,
      .series => l10n.series,
      .authors => l10n.author,
      .progress => l10n.progress,
      .narrators => l10n.narrators,
      .languages => l10n.language,
      .tracks => l10n.tracks,
      .missing => l10n.missingMetadata,
      .issues => l10n.itemsWithIssues,
      .feedOpen => l10n.rssFeedOpen,
      .abridged => l10n.abridged,
      .explicit => l10n.explicit,
      .publishers => l10n.publisher,
      .publishedDecade => l10n.publishedDecade,
      .ebooks => l10n.ebooks,
    };
  }

  bool get isImmediate => switch (this) {
    .all || .issues || .feedOpen || .abridged || .explicit => true,
    _ => false,
  };

  Filter toImmediateFilter() => switch (this) {
    .all => const NoFilter(),
    .issues => const IssuesFilter(),
    .feedOpen => const FeedOpenFilter(),
    .abridged => const AbridgedFilter(),
    .explicit => const ExplicitFilter(),
    _ => throw UnsupportedError('Not an immediate group'),
  };

  List<(String label, Filter filter)> getLabelAndFilter(
    BuildContext context,
    LibraryFilterData filterData,
  ) {
    return switch (this) {
      .genres => filterData.genres.map((g) => (g, GenreFilter(g))).toList(),
      .authors =>
        filterData.authors.map((a) => (a.name, AuthorFilter(a.id))).toList(),
      .progress =>
        ProgressFilterValue.values
            .map((v) => (v.label, ProgressFilter(v)))
            .toList(),
      .tags => filterData.tags.map((t) => (t, TagFilter(t))).toList(),
      .series =>
        filterData.series.map((s) => (s.name, SeriesFilter(s.id))).toList(),

      .publishers =>
        filterData.publishers.map((p) => (p, PublishersFilter(p))).toList(),

      .publishedDecade =>
        filterData.publishedDecades
            .map((d) => (d, PublishedDecadeFilter(d)))
            .toList(),
      .narrators =>
        filterData.narrators.map((n) => (n, NarratorFilter(n))).toList(),
      .missing =>
        MissingFilterValue.values
            .map((v) => (v.label, MissingFilter(v)))
            .toList(),
      .languages =>
        filterData.languages.map((l) => (l, LanguageFilter(l))).toList(),
      .tracks =>
        TracksFilterValue.values
            .map((v) => (v.label, TracksFilter(v)))
            .toList(),
      .ebooks =>
        EbooksFilterValue.values
            .map((v) => (v.label, EbooksFilter(v)))
            .toList(),
      _ => [],
    };
  }
}

extension FilterDisplayX on Filter {
  String label(BuildContext context, LibraryFilterData data) {
    return switch (this) {
      AuthorFilter(value: final id) =>
        data.authors.firstWhere((a) => a.id == id).name,
      SeriesFilter(value: final id) =>
        data.series.firstWhere((s) => s.id == id).name,

      ProgressFilter(value: final name) =>
        ProgressFilterValue.byName[name]?.label ?? '',
      MissingFilter(value: final name) =>
        MissingFilterValue.values.firstWhere((v) => v.name == name).label,
      TracksFilter(value: final name) =>
        TracksFilterValue.values.firstWhere((v) => v.name == name).label,
      EbooksFilter(value: final name) =>
        EbooksFilterValue.byName[name]?.label ?? '',

      GenreFilter(value: final v) ||
      TagFilter(value: final v) ||
      LanguageFilter(value: final v) ||
      PublishersFilter(value: final v) ||
      PublishedDecadeFilter(value: final v) ||
      NarratorFilter(value: final v) => v ?? '',

      NoFilter() ||
      IssuesFilter() ||
      FeedOpenFilter() ||
      ExplicitFilter() ||
      AbridgedFilter() => '',
    };
  }
}

extension AudiobookX on LibraryItem {
  String? get title => media.metadata.title;
  String? get subtitle =>
      media.metadata.map(book: (m) => m.subtitle, podcast: (m) => null);
  String? get description => media.metadata.description;
  String? get authorName => media.metadata.map(
    book: (m) => m.authorName ?? m.authors?.firstOrNull?.name,
    podcast: (m) => m.author,
  );
  List<Author> get authors =>
      media.metadata.map(book: (m) => m.authors ?? [], podcast: (m) => []);
  List<Series> get series =>
      media.metadata.map(book: (m) => m.series ?? [], podcast: (m) => []);
  List<String> get narrators =>
      media.metadata.map(book: (m) => m.narrators ?? [], podcast: (m) => []);

  List<String> get genres => media.metadata.genres;
  bool get explicit => media.metadata.explicit;
  String? get language => media.metadata.language;
  List<String> get tags => media.tags;
  String? get publisher => media.metadata.mapOrNull(book: (m) => m.publisher);
  String? get publishedDate =>
      media.metadata.mapOrNull(book: (m) => m.publishedDate);
  String? get publishedYear =>
      media.metadata.mapOrNull(book: (m) => m.publishedYear);

  Duration get duration => media.map(
    book: (m) => m.duration ?? Duration.zero,
    podcast: (m) => throw UnsupportedError('Podcast duration unsupported'),
  );
  List<BookChapter> get chapters =>
      media.map(book: (m) => m.chapters ?? [], podcast: (m) => []);
  List<AudioTrack> get tracks => media.map(
    book: (m) => m.tracks ?? [],
    podcast: (m) => throw UnsupportedError('Podcast tracks unsupported'),
  );
  List<PodcastEpisode> get episodes => media.map(
    book: (m) => throw UnsupportedError('Audiobook episodes unsupported'),
    podcast: (m) => m.episodes,
  );
  DateTime? get lastEpisodeCheck => media.map(
    book: (m) => throw UnsupportedError('Audiobook episode unsupported'),
    podcast: (m) => m.lastEpisodeCheck,
  );

  double get progress => userMediaProgress?.progress ?? 0.0;
  bool get isFinished => userMediaProgress?.isFinished ?? false;
  Duration get currentOffset => userMediaProgress?.currentTime ?? Duration.zero;
  bool get hideFromContinue =>
      userMediaProgress?.hideFromContinueListening ?? false;
}

extension SeriesX on Series {
  double get finishRatio {
    final int count;
    final int finished;

    if (progress != null) {
      count = progress!.libraryItemIds.length;
      finished = progress!.libraryItemIdsFinished.length;
    } else {
      count = books.length;
      finished = books.where((b) => b.progress == 1.0).length;
    }

    if (count == 0) return 0.0;
    return (finished / count);
  }
}

extension SearchX on SearchResponse {
  List<SearchFilter> filterTabs() {
    final tabs = <SearchFilter>[.all];
    if (book.isNotEmpty) tabs.add(.books);
    if (series.isNotEmpty) tabs.add(.series);
    if (authors.isNotEmpty) tabs.add(.authors);
    if (podcast.isNotEmpty) tabs.add(.podcasts);
    if (episodes.isNotEmpty) tabs.add(.episodes);
    if (narrators.isNotEmpty) tabs.add(.narrators);
    if (genres.isNotEmpty) tabs.add(.genres);
    if (tags.isNotEmpty) tabs.add(.tags);

    return tabs;
  }
}

String mediaItemIdKey(String id, [String? episodeId]) =>
    episodeId != null ? '$id$episodeId' : id;

extension PlayMethodX on PlayMethod {
  String get label {
    return switch (this) {
      .directPlay => l10n.directPlay,
      .directStream => l10n.directStream,
      .transcode => l10n.transcode,
      .local => l10n.local,
    };
  }
}
