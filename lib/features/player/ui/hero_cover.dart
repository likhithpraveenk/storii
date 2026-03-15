import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/features/player/logic/session_notifier.dart';
import 'package:storii/shared/widgets/placeholder_image.dart';

class HeroCover extends ConsumerWidget {
  const HeroCover({super.key, required this.expandFactor});

  final double expandFactor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    final imageRadius = lerpDouble(4, kRadius, expandFactor)!;

    return Material(
      borderRadius: .circular(imageRadius),
      clipBehavior: .hardEdge,
      child: session != null
          ? ImageWidget(id: session.libraryItemId, type: .item, isRaw: true)
          : const PlaceholderImage(),
    );
  }
}
