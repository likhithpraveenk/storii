import 'package:material_ui/material_ui.dart';

class CollapsibleSection extends StatefulWidget {
  final Widget title;
  final Widget child;
  final Widget? trailing;
  final EdgeInsetsGeometry padding;

  const new({
    super.key,
    required this.title,
    required this.child,
    this.padding = const .fromLTRB(16, 0, 16, 8),
    this.trailing,
  });

  @override
  State<StatefulWidget> createState() => _CollapsibleSectionState();
}

class _CollapsibleSectionState extends State<CollapsibleSection>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  bool _expanded = true;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: .stretch,
      children: [
        InkWell(
          onTap: () => setState(() => _expanded = !_expanded),
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          child: Padding(
            padding: widget.padding,
            child: Row(
              children: [
                Expanded(child: widget.title),
                if (widget.trailing != null)
                  widget.trailing!
                else
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
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeInOutCubic,
          switchOutCurve: Curves.easeInOutCubic,
          transitionBuilder: (child, animation) =>
              SizeTransition(sizeFactor: animation, child: child),
          child: _expanded
              ? Column(
                  key: const ValueKey('expanded'),
                  children: [widget.child],
                )
              : const SizedBox.shrink(key: ValueKey('collapsed')),
        ),
      ],
    );
  }
}
