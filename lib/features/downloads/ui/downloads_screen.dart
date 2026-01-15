import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/l10n/l10n.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key, this.pushed = false});

  final bool pushed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.downloads),
        automaticallyImplyLeading: pushed,
        leading: pushed
            ? IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back_ios_new),
              )
            : null,
      ),
      body: const Center(child: Text('--')),
    );
  }
}
