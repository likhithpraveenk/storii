import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';

class DownloadSortSheet extends ConsumerWidget {
  const DownloadSortSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortType = ref.watch(downloadSortTypeProvider);
    final ascending = ref.watch(downloadSortAscendingProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          ...DownloadSortType.values.map((type) {
            final isSelected = sortType == type;
            return ListTile(
              title: Text(type.label),
              selected: isSelected,
              trailing: isSelected
                  ? Icon(ascending ? Icons.arrow_upward : Icons.arrow_downward)
                  : null,
              onTap: () => isSelected
                  ? ref.read(downloadSortAscendingProvider.notifier).toggle()
                  : ref.read(downloadSortTypeProvider.notifier).set(type),
              contentPadding: const .symmetric(horizontal: 24, vertical: 0),
            );
          }),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
