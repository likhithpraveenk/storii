import 'package:flutter/material.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

BoxDecoration bottomSheetDecoration(BuildContext context) {
  final side = BorderSide(
    width: 0.5,
    strokeAlign: BorderSide.strokeAlignInside,
    color: Theme.of(context).colorScheme.primary,
  );
  return BoxDecoration(
    borderRadius: const .vertical(top: .circular(24)),
    border: Border(top: side, right: side, left: side),
  );
}

TextStyle? bottomSheetTitleTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.titleLarge?.copyWith(
    fontSize: 20,
    fontWeight: .w600,
    letterSpacing: -0.3,
  );
}

TextStyle? bottomSheetSubtitleTextStyle(BuildContext context) {
  final theme = Theme.of(context);
  return theme.textTheme.bodySmall?.copyWith(
    color: theme.colorScheme.onSurfaceVariant,
  );
}

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    required this.title,
    this.subtitle,
    this.body,
    this.actionLabel,
    this.actionIcon,
    this.isDestructive = false,
    this.onTap,
  }) : assert((actionLabel == null) == (onTap == null));

  final String title;
  final String? subtitle;
  final Widget? body;
  final String? actionLabel;
  final IconData? actionIcon;
  final bool isDestructive;
  final Future<void> Function()? onTap;

  static Future<void> show(
    BuildContext context, {
    required String title,
    String? subtitle,
    Widget? body,
    String? actionLabel,
    IconData? actionIcon,
    bool isDestructive = false,
    Future<void> Function()? onTap,
    bool isDismissible = true,
  }) {
    return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      isDismissible: isDismissible,
      shape: const RoundedRectangleBorder(
        borderRadius: .vertical(top: .circular(24)),
      ),
      builder: (_) => SafeArea(
        child: AppBottomSheet(
          title: title,
          subtitle: subtitle,
          body: body,
          actionLabel: actionLabel,
          actionIcon: actionIcon,
          isDestructive: isDestructive,
          onTap: onTap,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasButton = onTap != null;

    final decoration = bottomSheetDecoration(context);

    final header = Padding(
      padding: const .fromLTRB(24, 24, 24, 16),
      child: Column(
        children: [
          Text(
            title,
            style: bottomSheetTitleTextStyle(context),
            textAlign: .center,
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              subtitle!,
              style: bottomSheetSubtitleTextStyle(context),
              textAlign: .center,
            ),
          ],
        ],
      ),
    );

    final footer = hasButton
        ? Column(
            mainAxisSize: .min,
            children: [
              Container(
                padding: const .symmetric(horizontal: 24),
                width: double.infinity,
                child: AppFilledButton(
                  isDestructive: isDestructive,
                  onPressed: () async {
                    await onTap?.call();
                    if (context.mounted) Navigator.of(context).pop();
                  },
                  text: actionLabel!,
                ),
              ),
              const SizedBox(height: 24),
            ],
          )
        : const SizedBox(height: 16);

    return DecoratedBox(
      decoration: decoration,
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        children: [
          header,
          if (body != null) Flexible(child: SingleChildScrollView(child: body)),
          footer,
        ],
      ),
    );
  }
}
