import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/l10n/l10n.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({super.key, this.fromMore = false});

  final bool fromMore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: fromMore,
        leading: fromMore
            ? IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back_ios_new),
              )
            : null,
        title: Text(AppLocalizations.of(context)!.collections),
      ),
      body: const CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text('Collections Screen')),
          ),
        ],
      ),
    );
  }
}
