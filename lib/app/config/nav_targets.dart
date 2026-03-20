import 'package:flutter/material.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/models/nav_item.dart';
import 'package:storii/l10n/l10n.dart';

enum NavTarget {
  home,
  library,
  series,
  downloads,
  collections,
  authors,
  more;

  NavItem get item => switch (this) {
    .home => const NavItem(
      route: AppRoute.home,
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
    ),
    .library => const NavItem(
      route: AppRoute.library,
      icon: Icons.library_books_outlined,
      selectedIcon: Icons.library_books,
    ),
    .series => const NavItem(
      route: AppRoute.series,
      icon: Icons.stacked_bar_chart_outlined,
      selectedIcon: Icons.stacked_bar_chart,
    ),
    .downloads => const NavItem(
      route: AppRoute.downloads,
      icon: Icons.download_outlined,
      selectedIcon: Icons.download,
    ),
    .authors => const NavItem(
      route: AppRoute.authors,
      icon: Icons.person_outline,
      selectedIcon: Icons.person,
    ),
    .collections => const NavItem(
      route: AppRoute.collections,
      icon: Icons.collections_bookmark_outlined,
      selectedIcon: Icons.collections_bookmark,
    ),
    .more => const NavItem(
      route: AppRoute.more,
      icon: Icons.more_horiz_outlined,
      selectedIcon: Icons.more_horiz,
    ),
  };

  String label(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return switch (this) {
      .home => l.home,
      .library => l.library,
      .series => l.series,
      .downloads => l.downloads,
      .collections => l.collections,
      .authors => l.authors,
      .more => l.more,
    };
  }
}

const defaultNavTargets = <NavTarget>[
  .home,
  .library,
  .series,
  .authors,
  .more,
];

const podcastNavTargets = <NavTarget>[.home, .library, .more];
