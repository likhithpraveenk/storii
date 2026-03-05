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

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scroll());
  }

  void _scroll() async {
    while (mounted &&
        _scrollController.hasClients &&
        _scrollController.position.hasContentDimensions) {
      await Future.delayed(const Duration(seconds: 2));

      if (!mounted || !_scrollController.hasClients) return;

      final maxExtent = _scrollController.position.maxScrollExtent;
      const speed = 40.0; // pixels per second
      final durationInSeconds = (maxExtent / speed).round();

      await _scrollController.animateTo(
        maxExtent,
        duration: Duration(seconds: durationInSeconds.clamp(1, 10)),
        curve: Curves.linear,
      );

      await Future.delayed(const Duration(seconds: 2));

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
      child: Text(
        widget.text,
        style: widget.style,
        maxLines: 1,
        textAlign: widget.textAlign,
      ),
    );
  }
}
