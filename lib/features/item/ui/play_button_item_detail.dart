import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/abs_api/models/library_item.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/helpers/model_extensions.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class PlayButtonItemDetail extends ConsumerWidget {
  const PlayButtonItemDetail(this.item, {super.key});

  final LibraryItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;

    final session = ref.watch(sessionProvider);
    final isCurrentItem = session?.libraryItemId == item.id;

    final isLoading =
        ref.watch(audioPlayerProvider.select((s) => s.isLoading)) &&
        isCurrentItem;

    final isPlaying = isCurrentItem && ref.watch(isPlayingProvider);

    return SizedBox(
      width: double.infinity,
      child: AppFilledButton(
        loading: isLoading,
        onPressed: () async {
          if (isCurrentItem) {
            if (isPlaying) {
              await audioHandler.pause();
            } else {
              await audioHandler.play();
            }
          } else {
            await ref.read(audioPlayerProvider.notifier).play(item.id);
          }
        },
        icon: Icon(isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded),
        text: isPlaying
            ? l.pause
            : item.progress == 1.0
            ? l.replay
            : item.progress > 0
            ? l.resume
            : l.play,
      ),
    );
  }
}
