import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/player/ui/full_player_actions.dart';
import 'package:storii/features/player/ui/player_actions_edit_view.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

class MoreActionsSheet extends ConsumerWidget {
  const new({
    super.key,
    required this.remaining,
    required this.session,
    this.inBigLayout = false,
  });

  final List<FullPlayerActions> remaining;
  final PlaybackSession session;
  final bool inBigLayout;

  void _openEditSheet(BuildContext context) {
    final navigator = Navigator.of(context)..pop();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => AppBottomSheet.show(
        navigator.context,
        title: l10n.edit,
        subtitle: l10n.moreActionsEditSubtitle,
        body: const PlayerActionsEditView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
      decoration: bottomSheetDecoration(context),
      child: DraggableScrollableSheet(
        minChildSize: 0.4,
        initialChildSize: 0.6,
        expand: false,
        shouldCloseOnMinExtent: false,
        builder: (context, controller) => SingleChildScrollView(
          controller: controller,
          child: Column(
            mainAxisSize: .min,
            children: [
              Padding(
                padding: const .all(16),
                child: Stack(
                  alignment: .center,
                  children: [
                    Align(
                      child: Text(
                        l10n.more,
                        style: bottomSheetTitleTextStyle(context),
                      ),
                    ),
                    if (!inBigLayout)
                      Align(
                        alignment: .centerRight,
                        child: IconButton(
                          tooltip: l10n.edit,
                          onPressed: () => _openEditSheet(context),
                          icon: const Icon(Icons.edit),
                        ),
                      ),
                  ],
                ),
              ),
              ...remaining
                  .map((a) => a.widget(context, session, inOverflow: true))
                  .whereType<Widget>(),
              SwitchListTile(
                value: ref.watch(useWavySliderProvider),
                title: Text(l10n.wavySlider),
                secondary: const Icon(Icons.waves),
                subtitle: Text(l10n.wavySliderSubtitle),
                onChanged: (value) => ref
                    .read(userSettingsProvider.notifier)
                    .setUseWavySlider(value),
              ),
              SwitchListTile(
                value: ref.watch(showChapterProgressSliderProvider),
                title: Text(l10n.chapterProgressBar),
                secondary: const Icon(Icons.segment),
                subtitle: Text(l10n.chapterProgressBarSubtitle),
                onChanged: (value) => ref
                    .read(userSettingsProvider.notifier)
                    .setShowChapterProgressSlider(value),
              ),
              SwitchListTile(
                value: ref.watch(scaleTimeBySpeedProvider),
                title: Text(l10n.speedAdjustedTime),
                secondary: const Icon(Icons.av_timer),
                subtitle: Text(l10n.speedAdjustedTimeSubtitle),
                onChanged: (value) => ref
                    .read(userSettingsProvider.notifier)
                    .setScaleTimeBySpeed(value),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
