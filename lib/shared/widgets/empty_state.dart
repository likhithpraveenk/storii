import 'dart:math';

import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';

const List<String> emojis = [
  r'¯\_(ツ)_/¯',
  '(・_・)',
  '(－_－)',
  '(￣_￣)',
  '(。-_-。)',
  '(ーー゛)',
  '(´-ω-`)',
  '(･ω･)',
  '(¬‿¬)',
  '(￣～￣)',
  '(^^)',
  '⊙▂⊙',
  '┌( ಠ‿ಠ )┘',
  '-===≡≡≡┌( ͝° ͜ʖ͡°)┘',
  '-===≡≡≡( ͝° ͜ʖ͡°)',
  'ε=ε=┏( ・＿・)┛',
  'ヽ(⌐■■)ノ♪♬',
  '(=◉ᆽ◉=)',
  '(=^ ◡ ^=)',
  'ʘ‿ʘ',
  '(╥﹏╥)',
  '(ಠ‿ಠ)',
  '(⊙_☉)',
  '(╬ಠ益ಠ)',
  '(ง •̀_•́)ง',
  '(♥‿♥)',
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

class EmptyState extends StatelessWidget {
  final String? subtitle;
  final Widget? action;

  const new({super.key, this.subtitle, this.action});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final random = Random();
    final emoji = emojis[random.nextInt(emojis.length)];

    return Center(
      child: Padding(
        padding: const .symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: .min,
          children: [
            Text(emoji, style: theme.textTheme.displaySmall),
            const SizedBox(height: 16),
            Text(
              l10n.emptyMsg,
              textAlign: .center,
              style: theme.textTheme.titleMedium,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
              ),
            ],
            if (action != null) ...[const SizedBox(height: 24), action!],
          ],
        ),
      ),
    );
  }
}
