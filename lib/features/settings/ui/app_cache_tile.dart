import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/settings/logic/cache_notifier.dart';
import 'package:storii/shared/helpers/helpers.dart';
import 'package:storii/shared/widgets/waveform.dart';

class AppCacheTile extends ConsumerWidget {
  const AppCacheTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cacheAsync = ref.watch(cacheSizeProvider);

    return ListTile(
      leading: const Icon(Icons.cached),
      title: Text(l10n.appCache),
      subtitle: cacheAsync.when(
        data: (size) => Text(formatBytes(size)),
        loading: () => const RandomWaveform(barMaxHeight: 16, barCount: 8),
        error: (err, _) {
          log('app cache error: $err');
          return Icon(Icons.error, color: Theme.of(context).colorScheme.error);
        },
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_sweep),
        onPressed: () {
          ref.read(cacheSizeProvider.notifier).clearCache();
        },
      ),
    );
  }
}
