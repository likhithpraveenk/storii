import 'package:flutter/material.dart';
import 'package:storii/shared/helpers/helpers.dart';

class ExpandableHtml extends StatefulWidget {
  final String data;
  final double collapsedHeight;

  const ExpandableHtml({
    super.key,
    required this.data,
    this.collapsedHeight = 80,
  });

  @override
  State<ExpandableHtml> createState() => _ExpandableHtmlState();
}

class _ExpandableHtmlState extends State<ExpandableHtml> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isExpanded = !isExpanded),
      behavior: .opaque,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        alignment: .topCenter,
        child: Column(
          mainAxisSize: .min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: isExpanded
                    ? double.infinity
                    : widget.collapsedHeight,
              ),
              child: ShaderMask(
                blendMode: .dstIn,
                shaderCallback: (bounds) => LinearGradient(
                  begin: .topCenter,
                  end: .bottomCenter,
                  colors: [
                    Colors.black,
                    isExpanded ? Colors.black : Colors.transparent,
                  ],
                  stops: const [0.8, 1.0],
                ).createShader(bounds),
                child: Text(
                  cleanHtml(widget.data),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            ),
          ],
        ),
      ),
    );
  }
}
