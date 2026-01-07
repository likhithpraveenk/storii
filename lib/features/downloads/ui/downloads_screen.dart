import 'package:flutter/material.dart';
import 'package:storii/l10n/l10n.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l.downloads)),
      body: const Center(child: Text('--')),
    );
  }
}
