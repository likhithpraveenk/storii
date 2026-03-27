//* app-layer extensions on API models

import 'package:flutter/widgets.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/l10n/l10n.dart';

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
  String getDisplayString(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return switch (this) {
      .asin => l.asin,
      .isbn => l.isbn,
      .subtitle => l.subtitle,
      .authors => l.authors,
      .publishedYear => l.publishedYear,
      .series => l.series,
      .description => l.description,
      .genres => l.genres,
      .tags => l.tags,
      .narrators => l.narrators,
      .publisher => l.publisher,
      .language => l.language,
    };
  }
}

extension ProgressFilterValueX on ProgressFilterValue {
  String getDisplayString(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return switch (this) {
      .finished => l.finished,
      .notStarted => l.notStarted,
      .inProgress => l.inProgress,
      .notFinished => l.notFinished,
    };
  }
}

extension EbooksFilterValueX on EbooksFilterValue {
  String getDisplayString(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return switch (this) {
      .ebook => l.hasEbook,
      .noEbook => l.hasNoEbook,
      .supplementary => l.hasSupplementary,
      .noSupplementary => l.hasNoSupplementary,
    };
  }
}

extension TracksFilterValueX on TracksFilterValue {
  String getDisplayString(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return switch (this) {
      .single => l.singleTrack,
      .multi => l.multipleTracks,
      .none => l.noTracks,
    };
  }
}

extension FilterGroupX on FilterGroup {
  String getDisplayString(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return switch (this) {
      .all => l.all,
      .genres => l.genres,
      .tags => l.tags,
      .series => l.series,
      .authors => l.author,
      .progress => l.progress,
      .narrators => l.narrators,
      .languages => l.language,
      .tracks => l.tracks,
      .missing => l.missingMetadata,
      .issues => l.itemsWithIssues,
      .feedOpen => l.rssFeedOpen,
      .abridged => l.abridged,
      .explicit => l.explicit,
      .publishers => l.publisher,
      .publishedDecade => l.publishedDecade,
      .ebooks => l.ebooks,
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
            .map((v) => (v.getDisplayString(context), ProgressFilter(v)))
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
            .map((v) => (v.getDisplayString(context), MissingFilter(v)))
            .toList(),
      .languages =>
        filterData.languages.map((l) => (l, LanguageFilter(l))).toList(),
      .tracks =>
        TracksFilterValue.values
            .map((v) => (v.getDisplayString(context), TracksFilter(v)))
            .toList(),
      .ebooks =>
        EbooksFilterValue.values
            .map((v) => (v.getDisplayString(context), EbooksFilter(v)))
            .toList(),
      _ => [],
    };
  }
}

extension FilterDisplayX on Filter {
  String getDisplayLabel(BuildContext context, LibraryFilterData data) {
    return switch (this) {
      AuthorFilter(value: final id) =>
        data.authors.firstWhere((a) => a.id == id).name,
      SeriesFilter(value: final id) =>
        data.series.firstWhere((s) => s.id == id).name,

      ProgressFilter(value: final name) =>
        ProgressFilterValue.byName[name]?.getDisplayString(context) ?? '',
      MissingFilter(value: final name) =>
        MissingFilterValue.values
            .firstWhere((v) => v.name == name)
            .getDisplayString(context),
      TracksFilter(value: final name) =>
        TracksFilterValue.values
            .firstWhere((v) => v.name == name)
            .getDisplayString(context),
      EbooksFilter(value: final name) =>
        EbooksFilterValue.byName[name]?.getDisplayString(context) ?? '',

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
