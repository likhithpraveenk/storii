import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/features/library/ui/image_widget.dart';
import 'package:storii/features/player/logic/current_item_provider.dart';

class HeroCover extends ConsumerWidget {
  const HeroCover({super.key, required this.expandFactor});

  final double expandFactor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemAsync = ref.watch(currentItemProvider);
    final imageRadius = lerpDouble(4, 12, expandFactor)!;
    return itemAsync.maybeWhen(
      data: (item) => ClipRRect(
        borderRadius: .circular(imageRadius),
        child: item != null
            ? ImageWidget(id: item.id, type: .item)
            : const SizedBox.shrink(),
      ),
      orElse: () => const SizedBox.shrink(),
    );
  }
}
