import 'package:flutter/material.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/navigation/nav_bar/nav_item.dart';
import 'package:storii/l10n/l10n.dart';

enum NavTarget {
  home,
  library,
  search,
  downloads,
  collections,
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
    .search => const NavItem(
      route: AppRoute.search,
      icon: Icons.search,
      selectedIcon: Icons.search_rounded,
    ),
    .downloads => const NavItem(
      route: AppRoute.downloads,
      icon: Icons.download_outlined,
      selectedIcon: Icons.download,
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
      .search => l.search,
      .downloads => l.downloads,
      .collections => l.collections,
      .more => l.more,
    };
  }
}

const defaultNavTargets = <NavTarget>[
  .home,
  .library,
  .search,
  .downloads,
  .more,
];
