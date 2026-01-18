import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/l10n/l10n.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key, this.fromMore = false});

  final bool fromMore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(AppLocalizations.of(context)!.downloads),
        automaticallyImplyLeading: fromMore,
        leading: fromMore
            ? IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back),
              )
            : null,
      ),
      body: const Center(child: Text('-')),
    );
  }
}
