import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';

class DownloadSortSheet extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortState = ref.watch(downloadSortProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          ...DownloadSort.values.map((type) {
            final isSelected = sortState.sort == type;
            return ListTile(
              title: Text(type.label),
              selected: isSelected,
              trailing: isSelected
                  ? Icon(
                      sortState.ascending
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                    )
                  : null,
              onTap: () => isSelected
                  ? ref.read(downloadSortProvider.notifier).toggleAscending()
                  : ref.read(downloadSortProvider.notifier).setSort(type),
              contentPadding: const .symmetric(horizontal: 24, vertical: 0),
            );
          }),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
