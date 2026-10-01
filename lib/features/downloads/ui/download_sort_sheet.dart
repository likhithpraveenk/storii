import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';

class DownloadSortSheet extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortType = ref.watch(downloadSortProvider);
    final ascending = ref.watch(downloadSortAscProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          ...DownloadSort.values.map((type) {
            final isSelected = sortType == type;
            return ListTile(
              title: Text(type.label),
              selected: isSelected,
              trailing: isSelected
                  ? Icon(ascending ? Icons.arrow_upward : Icons.arrow_downward)
                  : null,
              onTap: () => isSelected
                  ? ref.read(downloadSortAscProvider.notifier).toggle()
                  : ref.read(downloadSortProvider.notifier).set(type),
              contentPadding: const .symmetric(horizontal: 24, vertical: 0),
            );
          }),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
