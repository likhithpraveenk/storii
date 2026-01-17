import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/l10n/l10n.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(AppLocalizations.of(context)!.profile),
      ),
      body: Center(child: Text(AppLocalizations.of(context)!.profile)),
    );
  }
}
