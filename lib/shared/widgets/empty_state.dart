import 'dart:math';

import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';

const List<String> emojis = [
  r'¯\_(ツ)_/¯',
  '(・_・)',
  '(￣_￣)',
  '(。-_-。)',
  '(´-ω-`)',
  '(･ω･)',
  '(¬‿¬)',
  '(￣～￣)',
  '⊙▂⊙',
  '┌( ಠ‿ಠ )┘',
  '┌( ͝° ͜ʖ͡°)┘',
  'ε=ε=┏( ・＿・)┛',
  'ヽ(⌐■■)ノ♪♬',
  '(=◉ᆽ◉=)',
  '(=^ ◡ ^=)',
  'ʘ‿ʘ',
  '(╥﹏╥)',
  '(ಠ‿ಠ)',
  '(ง •̀_•́)ง',
  '(｡◕‿◕｡)',
  '┐(￣ヘ￣)┌',
  '(⌐■_■)',
  'ᕕ( ᐛ )ᕗ',
  '(=^･ω･^=)',
  'ʕ•ᴥ•ʔ',
  'ლ(´ڡ`ლ)',
  '(☞ﾟ∀ﾟ)☞',
  '(づ｡◕‿‿◕｡)づ',
  '＼(^o^)／',
  'ヾ(≧▽≦*)o',
  '(ﾉ◕ヮ◕)ﾉ*:･ﾟ✧',
  '┬─┬ノ( º _ ºノ)',
  '(╯°□°）╯︵ ┻━┻',
];

class EmptyState extends StatefulWidget {
  final String? subtitle;
  final Widget? action;

  const new({super.key, this.subtitle, this.action});

  @override
  State<EmptyState> createState() => _EmptyStateState();
}

class _EmptyStateState extends State<EmptyState> {
  late final _emoji = emojis[Random().nextInt(emojis.length)];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const .symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: .min,
          children: [
            Text(_emoji, style: theme.textTheme.displaySmall),
            const SizedBox(height: 16),
            Text(
              l10n.emptyMsg,
              textAlign: .center,
              style: theme.textTheme.titleMedium,
            ),
            if (widget.subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                widget.subtitle!,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            if (widget.action != null) ...[
              const SizedBox(height: 24),
              widget.action!,
            ],
          ],
        ),
      ),
    );
  }
}
