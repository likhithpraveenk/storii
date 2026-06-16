import 'package:flutter/material.dart';

class MarqueeText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const MarqueeText(this.text, {super.key, this.style, this.textAlign});

  @override
  State<MarqueeText> createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText> {
  late final ScrollController _scrollController;
  static const _gap = 64.0;
  static const _speed = 40.0;
  static const _pause = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scroll());
  }

  double _textWidth() {
    final painter = TextPainter(
      text: TextSpan(text: widget.text, style: widget.style),
      textDirection: .ltr,
      maxLines: 1,
    )..layout();
    return painter.width;
  }

  Future<void> _scroll() async {
    while (mounted &&
        _scrollController.hasClients &&
        _scrollController.position.hasContentDimensions) {
      await Future.delayed(_pause);

      if (!mounted || !_scrollController.hasClients) return;

      final loopWidth = _textWidth() + _gap;
      await _scrollController.animateTo(
        loopWidth,
        duration: Duration(milliseconds: (loopWidth / _speed * 1000).round()),
        curve: Curves.linear,
      );

      if (mounted && _scrollController.hasClients) {
        _scrollController.jumpTo(0.0);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: .horizontal,
      child: Row(
        children: [
          Text(widget.text, style: widget.style, maxLines: 1),
          const SizedBox(width: _gap),
          Text(widget.text, style: widget.style, maxLines: 1),
        ],
      ),
    );
  }
}
