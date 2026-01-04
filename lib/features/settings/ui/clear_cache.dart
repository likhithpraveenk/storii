import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/settings/logic/cache_notifier.dart';

class ClearCache extends ConsumerWidget {
  const ClearCache({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cacheAsync = ref.watch(cacheSizeProvider);

    return ListTile(
      title: Text('Image Cache', style: Theme.of(context).textTheme.titleSmall),
      subtitle: cacheAsync.when(
        data: (size) => Text('Storage used: $size'),
        loading: () => const Text('Calculating...'),
        error: (err, _) => const Text('Error loading size'),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_sweep),
        onPressed: () => ref.read(cacheSizeProvider.notifier).clearCache(),
      ),
    );
  }
}
