import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';

class TrustAllCertificatesTile extends ConsumerWidget {
  const TrustAllCertificatesTile({super.key, this.inSettings = true});

  final bool inSettings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final trustCerts = ref.watch(trustAllCertificatesProvider);

    return SwitchListTile(
      contentPadding: inSettings ? null : .zero,
      secondary: inSettings ? const Icon(Icons.security) : null,
      title: Text(l10n.trustAllCertificates),
      subtitle: Text(
        l10n.trustAllCertificatesDescription,
        style: textTheme.bodyMedium?.copyWith(
          color: trustCerts ? scheme.error : scheme.onSurfaceVariant,
        ),
      ),
      activeThumbColor: scheme.error,
      value: trustCerts,
      onChanged: (value) {
        ref.read(appSettingsProvider.notifier).setTrustAllCertificates(value);
      },
    );
  }
}
