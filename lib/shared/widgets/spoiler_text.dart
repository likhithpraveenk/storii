import 'package:flutter/material.dart';

class SpoilerText extends StatefulWidget {
  const SpoilerText(this.text, {super.key});

  final Widget text;

  @override
  State<SpoilerText> createState() => _SpoilerTextState();
}

class _SpoilerTextState extends State<SpoilerText> {
  bool _revealed = false;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => setState(() => _revealed = !_revealed),
      child: _revealed
          ? widget.text
          : Container(
              decoration: BoxDecoration(
                color: scheme.inverseSurface,
                borderRadius: .circular(4),
              ),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(scheme.inverseSurface, .srcIn),
                child: widget.text,
              ),
            ),
    );
  }
}
