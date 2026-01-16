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

    switch (group) {
      case .genres:
        return GenreFilter(value);
      case .tags:
        return TagFilter(value);
      case .series:
        return SeriesFilter(value);
      case .authors:
        return AuthorFilter(value);
      case .progress:
        return ProgressFilter(ProgressFilterValue.byName[value]!);
      case .narrators:
        return NarratorFilter(value);
      case .missing:
        return MissingFilter(MissingFilterValue.values.byName(value));
      case .languages:
        return LanguageFilter(value);
      case .tracks:
        return TracksFilter(TracksFilterValue.values.byName(value));
      case .issues:
        return const IssuesFilter();
      case .feedOpen:
        return const FeedOpenFilter();
    }
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
  genres('genres'),
  tags('tags'),
  series('series'),
  authors('authors'),
  progress('progress'),
  narrators('narrators'),
  missing('missing'),
  languages('languages'),
  tracks('tracks'),
  issues('issues'),
  feedOpen('feed-open');

  static final byName = {
    for (final value in FilterGroup.values) value.name: value,
  };

  final String name;

  const FilterGroup(this.name);
}

class GenreFilter extends Filter {
  const GenreFilter(String genre) : super(FilterGroup.genres, genre);
}

class TagFilter extends Filter {
  const TagFilter(String tag) : super(FilterGroup.tags, tag);
}

class SeriesFilter extends Filter {
  const SeriesFilter(String seriesId) : super(FilterGroup.series, seriesId);
}

class AuthorFilter extends Filter {
  const AuthorFilter(String authorId) : super(FilterGroup.authors, authorId);
}

class ProgressFilter extends Filter {
  ProgressFilter(ProgressFilterValue value)
    : super(FilterGroup.progress, value.name);
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
  const NarratorFilter(String narrator)
    : super(FilterGroup.narrators, narrator);
}

class MissingFilter extends Filter {
  MissingFilter(MissingFilterValue value)
    : super(FilterGroup.missing, value.name);
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
  const LanguageFilter(String language)
    : super(FilterGroup.languages, language);
}

class TracksFilter extends Filter {
  TracksFilter(TracksFilterValue value) : super(FilterGroup.tracks, value.name);
}

enum TracksFilterValue { single, multi }

class IssuesFilter extends Filter {
  const IssuesFilter() : super(FilterGroup.issues);
}

class FeedOpenFilter extends Filter {
  const FeedOpenFilter() : super(FilterGroup.feedOpen);
}
