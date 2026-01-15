import 'package:flutter/cupertino.dart';
import 'package:storii/shared/widgets/waveform.dart';

class AppRefreshIndicator extends StatelessWidget {
  const AppRefreshIndicator({super.key, required this.onRefresh});

  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverRefreshControl(
      refreshTriggerPullDistance: 160,
      refreshIndicatorExtent: 80,
      onRefresh: onRefresh,
      builder: (_, _, pulledExtent, _, refreshIndicatorExtent) {
        final opacity = Curves.easeIn.transform(
          (pulledExtent / refreshIndicatorExtent).clamp(0.0, 1.0),
        );
        return Opacity(
          opacity: opacity,
          child: const Center(child: RandomWaveform()),
        );
      },
    );
  }
}
