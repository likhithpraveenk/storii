import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:storii/l10n/l10n.dart';

class ExpandableHtml extends StatefulWidget {
  final String data;
  final double collapsedHeight;

  const ExpandableHtml({
    super.key,
    required this.data,
    this.collapsedHeight = 100,
  });

  @override
  State<ExpandableHtml> createState() => _ExpandableHtmlState();
}

class _ExpandableHtmlState extends State<ExpandableHtml> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Column(
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 400),
          curve: Curves.fastOutSlowIn,
          alignment: .topCenter,
          child: SizedBox(
            height: isExpanded ? null : widget.collapsedHeight,
            width: double.infinity,
            child: Html(
              data: widget.data,
              style: {
                'body': Style(margin: Margins.zero, padding: HtmlPaddings.zero),
              },
            ),
          ),
        ),
        TextButton.icon(
          onPressed: () => setState(() => isExpanded = !isExpanded),
          icon: Icon(
            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          ),
          label: Text(isExpanded ? l.collapse : l.readMore),
        ),
      ],
    );
  }
}
