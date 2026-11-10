import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';

class SpoilerText extends StatefulWidget {
  const new(this.text, {super.key});

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
          : DecoratedBox(
              decoration: BoxDecoration(
                color: scheme.inverseSurface,
                borderRadius: .circular(kRadiusXs),
              ),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(scheme.inverseSurface, .srcIn),
                child: widget.text,
              ),
            ),
    );
  }
}
