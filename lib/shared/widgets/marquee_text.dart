import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/providers/settings_provider.dart';

const _kMarqueeGap = 40.0;

class MarqueeText extends ConsumerStatefulWidget {
  final String text;
  final TextStyle? style;

  /// Overrides marqueeSpeedProvider value
  final double? speed;

  const MarqueeText(this.text, {super.key, this.style, this.speed});

  @override
  ConsumerState<MarqueeText> createState() => _MarqueeTextState();
}

class _MarqueeTextState extends ConsumerState<MarqueeText> {
  late final ScrollController _scrollController;
  int _animationId = 0;

  double _measureText() {
    final painter = TextPainter(
      text: TextSpan(text: widget.text, style: widget.style),
      textDirection: Directionality.of(context),
      maxLines: 1,
    )..layout();
    return painter.width;
  }

  double get _speed => widget.speed ?? ref.read(marqueeSpeedProvider);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final textWidth = _measureText();
      final availableWidth = _scrollController.position.viewportDimension;
      if (textWidth > availableWidth) _startAnimation(textWidth);
    });
  }

  Future<void> _startAnimation(double textWidth) async {
    final id = ++_animationId;
    final maxScroll = textWidth + _kMarqueeGap;

    while (id == _animationId && mounted) {
      if (!_scrollController.hasClients) break;
      _scrollController.jumpTo(0);

      await Future.delayed(const Duration(milliseconds: 2000));
      if (id != _animationId || !mounted) return;

      final duration = Duration(
        milliseconds: ((maxScroll / _speed) * 1000).toInt(),
      );

      try {
        await _scrollController.animateTo(
          maxScroll,
          duration: duration,
          curve: Curves.linear,
        );
      } catch (_) {
        break;
      }
    }
  }

  @override
  void didUpdateWidget(MarqueeText old) {
    super.didUpdateWidget(old);
    if (old.text != widget.text ||
        old.style != widget.style ||
        old.speed != widget.speed) {
      _animationId++;
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (!mounted) return;
        _scrollController.jumpTo(0);

        final textWidth = _measureText();
        final availableWidth = _scrollController.position.viewportDimension;

        if (textWidth > availableWidth) {
          await _startAnimation(textWidth);
        }
      });
    }
  }

  @override
  void dispose() {
    _animationId++;
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textWidth = _measureText();
        if (textWidth <= constraints.maxWidth) {
          return Text(
            widget.text,
            style: widget.style,
            maxLines: 1,
            overflow: .ellipsis,
          );
        }
        return SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: .horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Row(
            children: [
              Text(widget.text, style: widget.style, maxLines: 1),
              const SizedBox(width: _kMarqueeGap),
              Text(widget.text, style: widget.style, maxLines: 1),
            ],
          ),
        );
      },
    );
  }
}
