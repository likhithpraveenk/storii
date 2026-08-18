import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/router.dart';

class NavItem {
  final AppRoute route;
  final IconData icon;
  final IconData selectedIcon;

  const NavItem({
    required this.route,
    required this.icon,
    required this.selectedIcon,
  });
}
