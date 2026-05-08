import 'dart:math';

import 'package:flutter/material.dart';
import 'package:storii/app/init.dart';

const List<String> emojis = [
  '¯\\_(ツ)_/¯',
  '(・_・)',
  '(－_－)',
  '(￣_￣)',
  '(。-_-。)',
  '(ーー゛)',
  '(´-ω-`)',
  '(･ω･)',
  '(¬‿¬)',
  '(￣～￣)',
];

class EmptyState extends StatelessWidget {
  final String? subtitle;
  final Widget? action;

  const EmptyState({super.key, this.subtitle, this.action});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final random = Random();
    final emoji = emojis[random.nextInt(emojis.length)];

    return Center(
      child: Padding(
        padding: const .symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: .min,
          children: [
            Text(emoji, style: theme.textTheme.displaySmall),
            const SizedBox(height: 16),
            Text(
              l10n.emptyMsg,
              textAlign: .center,
              style: theme.textTheme.titleMedium,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
              ),
            ],
            if (action != null) ...[const SizedBox(height: 24), action!],
          ],
        ),
      ),
    );
  }
}
