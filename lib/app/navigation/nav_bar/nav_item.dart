import 'package:flutter/material.dart';
import 'package:storii/app/config/router.dart';

class NavItem {
  final String label;
  final AppRoute route;
  final IconData icon;
  final IconData selectedIcon;

  const NavItem({
    required this.label,
    required this.route,
    required this.icon,
    required this.selectedIcon,
  });
}
