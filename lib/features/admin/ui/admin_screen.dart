import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/user_provider.dart';
import 'package:storii/features/admin/ui/library_management_screen.dart';
import 'package:storii/features/settings/ui/settings_header.dart';

class AdminScreen extends ConsumerWidget {
  const new({super.key});

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
      body: ListView(
        children: const [LibraryManagementTile(), _OnlineUsersTile()],
      ),
    );
  }
}

class _OnlineUsersTile extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final init = ref.watch(socketInitProvider).value;
    if (init == null) return const SizedBox.shrink();
    final users = init.usersOnline;

    return SettingsHeader(
      title: l10n.usersOnline(init.usersOnline.length),
      children: [
        for (final user in users)
          ListTile(
            leading: Icon(
              user.type.isAdmin ? Icons.shield_outlined : Icons.person_outline,
            ),
            title: Text(user.username),
            subtitle: user.session?.mediaMetadata.title == null
                ? null
                : Text(user.session?.mediaMetadata.title ?? ''),
          ),
      ],
    );
  }
}
