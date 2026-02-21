import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/features/player/logic/active_item_provider.dart';

class HeroCover extends ConsumerWidget {
  const HeroCover({super.key, required this.expandFactor});

  final double expandFactor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(activeItemProvider);
    if (item == null) return const SizedBox.shrink();

    final imageRadius = lerpDouble(4, kRadius, expandFactor)!;

    return Material(
      borderRadius: .circular(imageRadius),
      child: ImageWidget(id: item.id, type: .item),
    );
  }
}
