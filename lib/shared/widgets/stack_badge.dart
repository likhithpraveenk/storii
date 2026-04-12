import 'package:flutter/material.dart';

class StackBadge extends StatelessWidget {
  const StackBadge(this.value, {super.key});

  /// anything with toString()
  final Object value;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: .center,
      padding: const .all(4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryFixedDim,
        borderRadius: .circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        '$value',
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          fontWeight: .bold,
          color: Theme.of(context).colorScheme.onPrimaryFixed,
        ),
      ),
    );
  }
}

class DownloadBadge extends StatelessWidget {
  const DownloadBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: .center,
      padding: const .all(4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryFixedDim,
        borderRadius: .circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(
        Icons.download_done,
        size: 12,
        weight: 24,
        color: Theme.of(context).colorScheme.onSecondaryFixed,
      ),
    );
  }
}
