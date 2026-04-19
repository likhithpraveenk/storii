import 'dart:convert';

/// Handles Base64 encoding of filter values.
sealed class Filter {
  final FilterGroup group;
  final String? value;

  const Filter(this.group, [this.value]);

  factory Filter.parse(String filter) {
    final parts = filter.split('.');

    final group = FilterGroup.byName[parts.first]!;

    final String value;
    if (parts.length > 1) {
      value = utf8.decode(base64.decode(parts[1]));
    } else {
      value = '';
    }

    return switch (group) {
      .all => const NoFilter(),
      .genres => GenreFilter(value),
      .tags => TagFilter(value),
      .series => SeriesFilter(value),
      .authors => AuthorFilter(value),
      .progress => ProgressFilter(ProgressFilterValue.byName[value]!),
      .narrators => NarratorFilter(value),
      .missing => MissingFilter(MissingFilterValue.values.byName(value)),
      .languages => LanguageFilter(value),
      .tracks => TracksFilter(TracksFilterValue.values.byName(value)),
      .issues => const IssuesFilter(),
      .feedOpen => const FeedOpenFilter(),
      .explicit => const ExplicitFilter(),
      .abridged => const AbridgedFilter(),
      .publishers => PublishersFilter(value),
      .publishedDecade => PublishedDecadeFilter(value),
      .ebooks => EbooksFilter(EbooksFilterValue.byName[value]!),
    };
  }

  @override
  String toString() {
    final value = this.value;
    if (value == null) return group.name;
    return '${group.name}.${base64.encode(utf8.encode(value))}';
  }

  @override
  bool operator ==(Object other) =>
      other is Filter && other.group == group && other.value == value;

  @override
  int get hashCode => Object.hash(group, value);
}

enum FilterGroup {
  all('all'),
  genres('genres'),
  tags('tags'),
  series('series'),
  authors('authors'),
  publishers('publishers'),
  publishedDecade('publishedDecades'),
  progress('progress'),
  narrators('narrators'),
  missing('missing'),
  languages('languages'),
  tracks('tracks'),
  ebooks('ebooks'),
  issues('issues'),
  feedOpen('feed-open'),
  abridged('abridged'),
  explicit('explicit');

  static final byName = {
    for (final value in FilterGroup.values) value.name: value,
  };

  final String name;

  const FilterGroup(this.name);
}

class NoFilter extends Filter {
  const NoFilter() : super(.all);
}

class GenreFilter extends Filter {
  const GenreFilter(String genre) : super(.genres, genre);
}

class TagFilter extends Filter {
  const TagFilter(String tag) : super(.tags, tag);
}

class SeriesFilter extends Filter {
  const SeriesFilter(String seriesId) : super(.series, seriesId);
}

class AuthorFilter extends Filter {
  const AuthorFilter(String authorId) : super(.authors, authorId);
}

class ProgressFilter extends Filter {
  ProgressFilter(ProgressFilterValue value) : super(.progress, value.name);
}

enum ProgressFilterValue {
  finished('finished'),
  notStarted('not-started'),
  notFinished('not-finished'),
  inProgress('in-progress');

  static final byName = {
    for (final value in ProgressFilterValue.values) value.name: value,
  };

  final String name;

  const ProgressFilterValue(this.name);
}

class NarratorFilter extends Filter {
  const NarratorFilter(String narrator) : super(.narrators, narrator);
}

class MissingFilter extends Filter {
  MissingFilter(MissingFilterValue value) : super(.missing, value.name);
}

enum MissingFilterValue {
  asin,
  isbn,
  subtitle,
  authors,
  publishedYear,
  series,
  description,
  genres,
  tags,
  narrators,
  publisher,
  language,
}

class LanguageFilter extends Filter {
  const LanguageFilter(String language) : super(.languages, language);
}

class TracksFilter extends Filter {
  TracksFilter(TracksFilterValue value) : super(.tracks, value.name);
}

enum TracksFilterValue { none, single, multi }

class IssuesFilter extends Filter {
  const IssuesFilter() : super(.issues);
}

enum EbooksFilterValue {
  ebook('ebook'),
  noEbook('no-ebook'),
  supplementary('supplementary'),
  noSupplementary('no-supplementary');

  static final byName = {
    for (final value in EbooksFilterValue.values) value.name: value,
  };

  final String name;

  const EbooksFilterValue(this.name);
}

class EbooksFilter extends Filter {
  EbooksFilter(EbooksFilterValue value) : super(.ebooks, value.name);
}

class PublishersFilter extends Filter {
  const PublishersFilter(String publisher) : super(.publishers, publisher);
}

class PublishedDecadeFilter extends Filter {
  const PublishedDecadeFilter(String decade) : super(.publishedDecade, decade);
}

class FeedOpenFilter extends Filter {
  const FeedOpenFilter() : super(.feedOpen);
}

class AbridgedFilter extends Filter {
  const AbridgedFilter() : super(.abridged);
}

class ExplicitFilter extends Filter {
  const ExplicitFilter() : super(.explicit);
}
