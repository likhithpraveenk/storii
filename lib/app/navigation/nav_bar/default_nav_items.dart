import 'package:flutter/material.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/navigation/nav_bar/nav_item.dart';

enum NavTarget {
  home,
  library,
  series,
  collections,
  authors;

  NavItem get item => switch (this) {
    .home => const NavItem(
      label: 'Home',
      route: AppRoute.home,
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
    ),
    .library => const NavItem(
      label: 'Library',
      route: AppRoute.library,
      icon: Icons.library_books_outlined,
      selectedIcon: Icons.library_books,
    ),
    .series => const NavItem(
      label: 'Series',
      route: AppRoute.series,
      icon: Icons.collections_bookmark_outlined,
      selectedIcon: Icons.collections_bookmark,
    ),
    .collections => const NavItem(
      label: 'Collections',
      route: AppRoute.collections,
      icon: Icons.folder_special_outlined,
      selectedIcon: Icons.folder_special,
    ),
    .authors => const NavItem(
      label: 'Authors',
      route: AppRoute.authors,
      icon: Icons.person_outline,
      selectedIcon: Icons.person,
    ),
  };
}

const defaultNavTargets = <NavTarget>[
  .home,
  .library,
  .series,
  .collections,
  .authors,
];
