import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/helpers.dart';

class MetadataWrap extends StatelessWidget {
  const MetadataWrap(this.item, {super.key});

  final LibraryItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 16),
      child: Wrap(
        alignment: .spaceEvenly,
        spacing: 16,
        runSpacing: 8,
        children: [
          if (item.size != null)
            _MetaItem(
              icon: Icons.storage_outlined,
              label: formatBytes(item.size!),
            ),
          _MetaItem(icon: Icons.business, label: item.publisher),
          _MetaItem(icon: Icons.calendar_today, label: item.publishedYear),
          _MetaItem(icon: Icons.language, label: item.language),
          if (item.narrators.isNotEmpty)
            _MetaItem(
              icon: Icons.mic,
              label:
                  item.narrators.take(3).join(', ') +
                  (item.narrators.length > 3
                      ? ' +${item.narrators.length - 3}'
                      : ''),
            ),
          // TODO: info icon to full metadata in a bottom sheet
        ],
      ),
    );
  }
}

class _MetaItem extends StatelessWidget {
  final IconData icon;
  final String? label;

  const _MetaItem({required this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    if (label == null) {
      return const SizedBox.shrink();
    }
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: .min,
      spacing: 4,
      children: [
        Icon(icon, size: 14, color: theme.colorScheme.onSurfaceVariant),
        Flexible(
          child: Text(
            label!,
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            overflow: .ellipsis,
          ),
        ),
      ],
    );
  }
}
