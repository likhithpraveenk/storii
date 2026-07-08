import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/settings/ui/trust_all_certificates_tile.dart';

class AdvancedOptions extends ConsumerWidget {
  const AdvancedOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [TrustAllCertificatesTile(inSettings: false)],
    );
  }
}
