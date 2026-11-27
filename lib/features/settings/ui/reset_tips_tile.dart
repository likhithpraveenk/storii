import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/tips_provider.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_dialog.dart';

class ResetTipsTile extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: const Icon(Icons.lightbulb_outline),
      title: Text(l10n.resetTips),
      onTap: () async {
        await AppDialog.show(
          context,
          title: l10n.resetTips,
          body: Text(
            l10n.resetTipsSubtitle,
            style: bottomSheetSubtitleTextStyle(context),
          ),
          actionLabel: l10n.reset,
          onTap: () async {
            await ref.read(tipsProvider.notifier).reset();
            if (context.mounted) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(l10n.success)));
            }
          },
        );
      },
    );
  }
}
