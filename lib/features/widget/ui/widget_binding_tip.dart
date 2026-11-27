import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/app_tips.dart';
import 'package:storii/shared/widgets/app_dialog.dart';

Future<void> showWidgetBindingTipDialog(
  BuildContext context, {
  Future<void> Function(AppTip tip)? onSetDismissed,
}) async {
  var doNotShowAgain = false;
  await AppDialog.show<bool>(
    context,
    title: l10n.widgetBindingTipTitle,
    body: StatefulBuilder(
      builder: (context, setState) => Column(
        crossAxisAlignment: .start,
        spacing: kSpacingSm,
        children: [
          Text(
            l10n.widgetBindingTipBody,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          if (onSetDismissed != null)
            ListTile(
              leading: Icon(
                doNotShowAgain
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                size: 20,
                color: doNotShowAgain
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
              onTap: () => setState(() => doNotShowAgain = !doNotShowAgain),
              title: Text(l10n.doNotShowTipAgain),
              visualDensity: .compact,
              dense: true,
              contentPadding: .zero,
            ),
        ],
      ),
    ),
    actionLabel: l10n.gotIt,
    onTap: () async {
      if (doNotShowAgain) {
        return onSetDismissed?.call(.widgetBinding);
      }
    },
  );
}
