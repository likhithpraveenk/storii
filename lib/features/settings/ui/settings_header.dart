import 'package:flutter/material.dart';

class SettingsHeader extends StatefulWidget {
  final String title;
  final List<Widget> children;

  const new({super.key, required this.title, this.children = const []});

  @override
  State<SettingsHeader> createState() => _SettingsHeaderState();
}

class _SettingsHeaderState extends State<SettingsHeader>
    with SingleTickerProviderStateMixin {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: .stretch,
      children: [
        InkWell(
          onTap: () => setState(() => _expanded = !_expanded),
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          child: Padding(
            padding: const .fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: .bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                if (widget.children.isNotEmpty)
                  AnimatedRotation(
                    turns: _expanded ? 0.25 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: theme.colorScheme.primaryFixedDim.withValues(
                        alpha: 0.3,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutCubic,
          child: _expanded
              ? Column(children: widget.children)
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
