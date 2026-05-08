import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/auth/logic/user_session_controller.dart';
import 'package:storii/shared/widgets/waveform.dart';

class LogoutTile extends ConsumerWidget {
  const LogoutTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final state = ref.watch(userSessionControllerProvider);

    return ListTile(
      leading: const Icon(Icons.logout),
      title: state == .loading ? const RandomWaveform() : Text(l10n.logout),
      onTap: user == null || state == .loading
          ? null
          : () => ref.read(userSessionControllerProvider.notifier).logout(user),
    );
  }
}
