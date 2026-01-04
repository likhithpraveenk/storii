import 'package:flutter/material.dart';

class PlaceholderImage extends StatelessWidget {
  final String? label;

  const PlaceholderImage({super.key, this.label});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      color: scheme.onPrimary,
      child: Stack(
        alignment: .center,
        children: [
          Opacity(
            opacity: label != null ? 0.05 : 0.2,
            child: Image.asset(
              'assets/icons/foreground.png',
              width: 120,
              height: 120,
            ),
          ),
          if (label != null)
            Text(
              label!,
              textAlign: .center,
              maxLines: 3,
              overflow: .ellipsis,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: scheme.primary.withValues(alpha: 0.8),
                fontWeight: .bold,
              ),
            ),
        ],
      ),
    );
  }
}
