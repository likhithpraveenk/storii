import 'package:flutter/material.dart';
import 'package:storii/l10n/l10n.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.downloads,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const Center(child: Text('todo')),
    );
  }
}
