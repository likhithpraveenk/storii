import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/init.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l10n.profile),
      ),
      body: const Center(child: Text('coming soon')),
    );
  }
}
