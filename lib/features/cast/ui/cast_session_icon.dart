import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/cast/logic/cast_session_notifier.dart';
import 'package:storii/features/cast/ui/cast_session_sheet.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class CastSessionIcon extends ConsumerWidget {
  const CastSessionIcon({super.key, required this.itemId, this.episodeId});

  final String itemId;
  final String? episodeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(castSessionProvider(itemId, episodeId)).value;
    if (session == null) return const SizedBox.shrink();

    return IconButton(
      onPressed: () => AppBottomSheet.show(
        context,
        title: 'Cast Session',
        subtitle: l10n.localSessionSheetBody,
        body: SafeArea(
          child: CastSessionSheet(itemId: itemId, episodeId: episodeId),
        ),
      ),
      icon: Icon(
        Icons.cast,
        color: Theme.of(context).colorScheme.tertiary,
        size: 20,
      ),
    );
  }
}
