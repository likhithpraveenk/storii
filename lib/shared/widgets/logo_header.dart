import 'package:flutter/material.dart';
import 'package:storii/app/config/constants.dart';

class LogoHeader extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .all(24),
      alignment: .center,
      child: Image.asset(
        appIcon,
        width: 100,
        height: 100,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
