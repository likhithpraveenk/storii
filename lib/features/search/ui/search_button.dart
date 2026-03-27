import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';

const searchHeroTag = 'search-hero';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: searchHeroTag,
      child: IconButton(
        onPressed: () => context.push(AppRoute.search.path),
        icon: const Icon(Icons.search),
      ),
    );
  }
}
