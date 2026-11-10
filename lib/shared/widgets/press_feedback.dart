import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';

class PressFeedback extends StatefulWidget {
  const new({super.key, required this.child});

  final Widget child;

  @override
  State<PressFeedback> createState() => _PressFeedbackState();
}

class _PressFeedbackState extends State<PressFeedback> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed == value) return;
    setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final disabled = MediaQuery.disableAnimationsOf(context);
    return Listener(
      onPointerDown: (_) => _setPressed(true),
      onPointerUp: (_) => _setPressed(false),
      onPointerCancel: (_) => _setPressed(false),
      child: AnimatedScale(
        scale: _pressed && !disabled ? 0.96 : 1.0,
        duration: kDurationXs,
        curve: kCurveDecelerate,
        child: widget.child,
      ),
    );
  }
}
