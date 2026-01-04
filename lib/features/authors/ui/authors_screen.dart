import 'package:flutter/material.dart';
import 'package:storii/app/navigation/top_search/top_search_bar.dart';

class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        TopSearchBar(),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: Text('Authors Screen')),
        ),
      ],
    );
  }
}
