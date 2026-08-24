import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/collections/logic/collections_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/expandable_text.dart';
import 'package:storii/shared/widgets/waveform.dart';

class CollectionDetailScreen extends ConsumerWidget {
  const new({required this.id, super.key});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionAsync = ref.watch(collectionProvider(id));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          collectionAsync.value?.name ?? '',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            tooltip: l10n.more,
            icon: const Icon(Icons.more_horiz),
            onPressed: () => AppBottomSheet.show(
              context,
              title: l10n.more,
              // TODO: edit collection name & description
              body: const SizedBox(),
            ),
          ),
        ],
      ),
      body: collectionAsync.when(
        data: (collection) {
          return Column(
            children: [
              if (collection.description != null)
                Padding(
                  padding: const .all(16),
                  child: ExpandableHtml(data: collection.description!),
                ),

              // TODO: show collection books
              const Expanded(child: Placeholder()),
            ],
          );
        },
        loading: () => const Center(child: RandomWaveform()),
        error: (e, s) => ErrorRetryWidget(
          e.toString(),
          onRetry: () {
            ref.invalidate(collectionProvider(id));
          },
        ),
      ),
    );
  }
}
