import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:storii/l10n/l10n.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

class ExpandableHtml extends StatefulWidget {
  final String data;
  final double collapsedHeight;
  final String? title;

  const ExpandableHtml({
    super.key,
    required this.data,
    this.collapsedHeight = 120,
    this.title,
  });

  @override
  State<ExpandableHtml> createState() => _ExpandableHtmlState();
}

class _ExpandableHtmlState extends State<ExpandableHtml> {
  bool isExpanded = false;
  bool isOverflowing = false;
  final _contentKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkOverflow());
  }

  void _checkOverflow() {
    final ctx = _contentKey.currentContext;
    if (ctx == null) return;

    final box = ctx.findRenderObject() as RenderBox;
    final height = box.size.height;

    if (height > widget.collapsedHeight && mounted) {
      setState(() => isOverflowing = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: .start,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
        ],
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
          alignment: .topCenter,
          child: SizedBox(
            height: (!isOverflowing || isExpanded)
                ? null
                : widget.collapsedHeight,
            width: double.infinity,
            child: GestureDetector(
              onTap: () => setState(() => isExpanded = !isExpanded),
              child: Html(
                key: _contentKey,
                data: widget.data,
                style: {
                  'body': Style(
                    margin: Margins.zero,
                    padding: HtmlPaddings.zero,
                  ),
                },
              ),
            ),
          ),
        ),
        if (isOverflowing)
          AppTextButton(
            text: isExpanded ? l.collapse : l.readMore,
            onPressed: () => setState(() => isExpanded = !isExpanded),
            icon: Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            ),
          ),
      ],
    );
  }
}
