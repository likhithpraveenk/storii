import 'package:flutter/material.dart';
import 'package:storii/app/config/router.dart';

class NavItem {
  final AppRoute route;
  final IconData icon;
  final IconData selectedIcon;
  final int indexInRouter;

  const NavItem({
    required this.route,
    required this.icon,
    required this.selectedIcon,
    required this.indexInRouter,
  });
}
