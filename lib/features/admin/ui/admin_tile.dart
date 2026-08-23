import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/user_provider.dart';

class AdminTile extends ConsumerWidget {
  const AdminTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdmin = ref.watch(isUserAdminProvider);
    if (!isAdmin) return const SizedBox.shrink();

    return ListTile(
      leading: const Icon(Icons.admin_panel_settings_outlined),
      title: Text(l10n.admin),
      onTap: () => context.push(AppRoute.admin.path),
    );
  }
}
