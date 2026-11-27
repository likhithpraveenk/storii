import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/widget/logic/widget_controller.dart';
import 'package:storii/features/widget/ui/widget_binding_tip.dart';
import 'package:storii/features/widget/ui/widget_grid_card.dart';
import 'package:storii/shared/widgets/empty_state.dart';
import 'package:storii/shared/widgets/waveform.dart';

class WidgetsScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapAsync = ref.watch(availableWidgetConfigsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.widgets),
        actions: [
          IconButton(
            tooltip: l10n.widgetBindingTipTitle,
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showWidgetBindingTipDialog(context);
            },
          ),
        ],
      ),
      body: mapAsync.when(
        data: (configMap) {
          if (configMap.isEmpty) return const EmptyState();
          final keys = configMap.keys.toList()..sort();
          final cardWidth = ref.watch(imageMaxSizeProvider);
          return GridView.builder(
            padding: const .all(kSpacingMd),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: cardWidth,
              crossAxisSpacing: kSpacingMd,
              mainAxisSpacing: kSpacingMd,
            ),
            itemCount: keys.length,
            itemBuilder: (_, index) {
              final id = keys[index];
              final config = configMap[id];
              return WidgetGridCard(id, config: config);
            },
          );
        },
        loading: () => const Center(child: RandomWaveform()),
        error: (error, _) => Center(
          child: Column(
            mainAxisSize: .min,
            children: [
              Text(error.toString()),
              TextButton(
                onPressed: () => ref.invalidate(availableWidgetConfigsProvider),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
