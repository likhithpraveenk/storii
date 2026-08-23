import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/user_provider.dart';
import 'package:storii/features/admin/ui/library_management_screen.dart';

class AdminScreen extends ConsumerWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final isAdmin = ref.watch(isUserAdminProvider);
    if (!isAdmin) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.admin, style: textTheme.titleLarge)),
        body: Padding(
          padding: const .all(16),
          child: Center(child: Text(l10n.loginWithAdmin, textAlign: .center)),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l10n.admin, style: textTheme.titleLarge),
      ),
      body: ListView(children: const [LibraryManagementTile()]),
    );
  }
}
