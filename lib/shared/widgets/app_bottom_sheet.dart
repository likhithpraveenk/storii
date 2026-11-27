import 'dart:async';

import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/shared/widgets/app_buttons.dart';

BoxDecoration bottomSheetDecoration(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return BoxDecoration(
    color: scheme.surfaceContainerLowest,
    borderRadius: const .vertical(top: .circular(kRadiusXl)),
    border: .all(width: kBorderHairline, color: scheme.primary),
  );
}

TextStyle? bottomSheetTitleTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.titleLarge
      ?.copyWith(fontSize: 20, fontWeight: .w600, letterSpacing: -0.3);
}

TextStyle? bottomSheetSubtitleTextStyle(BuildContext context) {
  final theme = Theme.of(context);
  return theme.textTheme.bodySmall?.copyWith(
    color: theme.colorScheme.onSurfaceVariant,
  );
}

class AppBottomSheet extends StatelessWidget {
  const new({
    super.key,
    required this.title,
    this.subtitle,
    this.body,
    this.actionLabel,
    this.actionIcon,
    this.isDestructive = false,
    this.onTap,
  }) : assert(
         (actionLabel == null) == (onTap == null),
         'both must be set or neither',
       );

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
        borderRadius: .vertical(top: .circular(kRadiusXl)),
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
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: scheme.surfaceContainerLowest,
      shape: RoundedRectangleBorder(
        borderRadius: const .vertical(top: .circular(kRadiusXl)),
        side: .new(width: kBorderHairline, color: scheme.primary),
      ),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        children: [
          Padding(
            padding: const .fromLTRB(
              kSpacingLg,
              kSpacingLg,
              kSpacingLg,
              kSpacingMd,
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: bottomSheetTitleTextStyle(context),
                  textAlign: .center,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: kSpacingSm),
                  Text(
                    subtitle!,
                    style: bottomSheetSubtitleTextStyle(context),
                    textAlign: .center,
                  ),
                ],
              ],
            ),
          ),
          if (body != null) Flexible(child: SingleChildScrollView(child: body)),
          if (onTap != null)
            Container(
              padding: const .symmetric(horizontal: kSpacingLg),
              width: double.infinity,
              child: AppFilledButton(
                isDestructive: isDestructive,
                onPressed: () async {
                  unawaited(HapticFeedback.lightImpact());
                  await onTap?.call();
                  if (context.mounted) Navigator.of(context).pop();
                },
                text: actionLabel!,
                icon: actionIcon != null
                    ? Icon(
                        actionIcon,
                        color: isDestructive ? scheme.onError : null,
                      )
                    : null,
              ),
            ),
          const SizedBox(height: kSpacingLg),
        ],
      ),
    );
  }
}
