import 'package:flutter/widgets.dart';
import 'package:storii/l10n/l10n.dart';

enum MediaContent { audiobook, podcast }

enum LibrarySortType {
  title,
  author,
  addedAt,
  updatedAt,
  size,
  duration,
  publishedYear;

  String getDisplayString(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return switch (this) {
      LibrarySortType.title => l10n.sortTitle,
      LibrarySortType.author => l10n.sortAuthor,
      LibrarySortType.addedAt => l10n.sortAddedAt,
      LibrarySortType.updatedAt => l10n.sortUpdatedAt,
      LibrarySortType.size => l10n.sortSize,
      LibrarySortType.duration => l10n.sortDuration,
      LibrarySortType.publishedYear => l10n.sortPublishedYear,
    };
  }
}

enum Languages {
  en('English'),
  es('Español'),
  fr('Français'),
  de('Deutsch'),
  pt('Português');

  final String displayName;
  const Languages(this.displayName);
}
