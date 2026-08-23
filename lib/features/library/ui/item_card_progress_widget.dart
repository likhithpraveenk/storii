import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';

class ItemCardProgressWidget extends ConsumerWidget {
  const ItemCardProgressWidget({super.key, required this.item});

  final LibraryItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaProgress = ref
        .watch(mediaProgressFromMapProvider(item.id, item.recentEpisode?.id))
        .value;
    final progress = item.collapsedSeries != null
        ? item.collapsedSeries!.finishRatio
        : mediaProgress?.progress ?? item.progress;
    final isFinished =
        mediaProgress?.isFinished == true || item.isFinished || progress == 1;

    return SizedBox(
      height: 2.4,
      child: LinearProgressIndicator(
        value: progress,
        borderRadius: .circular(kRadius),
        backgroundColor: Colors.transparent,
        valueColor: AlwaysStoppedAnimation<Color>(
          isFinished ? appGreenColor : appRedColor,
        ),
      ),
    );
  }
}
