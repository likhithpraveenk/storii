import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';

class AppScrollThumb extends StatelessWidget {
  const AppScrollThumb({
    super.key,
    required this.child,
    required this.controller,
  });

  final BoxScrollView child;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    Widget semicircle(
      Color backgroundColor,
      Animation<double> thumbAnimation,
      Animation<double> labelAnimation,
      double height, {
      Text? labelText,
      BoxConstraints? labelConstraints,
    }) {
      return FadeTransition(
        opacity: thumbAnimation,
        child: Container(
          height: height,
          width: 36,
          alignment: .centerRight,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const .only(
              topLeft: .circular(110),
              bottomLeft: .circular(110),
            ),
          ),
          child: Container(
            margin: const .only(right: 4),
            child: Icon(
              Icons.unfold_more,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              size: 24,
            ),
          ),
        ),
      );
    }

    return DraggableScrollbar(
      controller: controller,
      heightScrollThumb: 55,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      scrollThumbBuilder: semicircle,
      scrollbarAnimationDuration: const Duration(milliseconds: 200),
      scrollbarTimeToFade: const Duration(milliseconds: 1000),
      child: child,
    );
  }
}
