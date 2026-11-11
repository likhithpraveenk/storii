import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/features/player/logic/audio_providers.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/widgets/placeholder_image.dart';

class PlayerCover extends ConsumerWidget {
  const new({super.key, required this.expandFactor});

  final double expandFactor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final libraryItemId = ref.watch(
      sessionProvider.select((s) => s?.libraryItemId),
    );
    final imageRadius = lerpDouble(4, kRadius, expandFactor)!;
    final ignoring = expandFactor < 0.9;
    final isPlaying = ref.watch(isPlayingProvider);

    return Semantics(
      label: ignoring ? null : (isPlaying ? l10n.pause : l10n.play),
      child: GestureDetector(
        onTap: ignoring ? null : audioHandler.togglePlay,
        child: Material(
          borderRadius: .circular(imageRadius),
          clipBehavior: .hardEdge,
          child: libraryItemId != null
              ? ImageWidget(id: libraryItemId, type: .item, isRaw: true)
              : const PlaceholderImage(),
        ),
      ),
    );
  }
}
