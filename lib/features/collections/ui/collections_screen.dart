import 'package:flutter/material.dart';
import 'package:storii/app/navigation/top_search/top_search_bar.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        TopSearchBar(),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: Text('Collections Screen')),
        ),
      ],
    );
  }
}
