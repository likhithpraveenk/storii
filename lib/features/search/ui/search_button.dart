import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: l10n.search,
      onPressed: () => context.push(AppRoute.search.path),
      icon: const Icon(Icons.search),
    );
  }
}
