import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/l10n/l10n.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            title: Material(
              child: Container(
                decoration: BoxDecoration(color: scheme.surfaceContainer),
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    contentPadding: const .symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    prefixIcon: GestureDetector(
                      child: const Padding(
                        padding: .symmetric(horizontal: 16, vertical: 12),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                      onTap: () {
                        context.pop();
                      },
                    ),
                    hint: Text(
                      AppLocalizations.of(context)!.search,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    border: .none,
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: Center(child: Text('search to be'))),
        ],
      ),
    );
  }
}
