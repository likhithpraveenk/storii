import 'package:flutter/material.dart';
import 'package:storii/l10n/l10n.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({super.key, this.fromMore = false});

  final bool fromMore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.collections,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text('coming soon')),
          ),
        ],
      ),
    );
  }
}
