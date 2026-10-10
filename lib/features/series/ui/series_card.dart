import 'package:abs_api/abs_api.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/series/ui/series_options_widget.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/stacked_images_card.dart';

class SeriesCard extends StatelessWidget {
  const new(this.series, {super.key});
  final Series series;

  @override
  Widget build(BuildContext context) {
    final authorName = series.books.firstOrNull?.authorName;
    final itemIds = series.books.map((b) => b.id).toList();

    return StackedImagesCard(
      onTap: () => context.push(AppRoute.seriesDetail.withId(series.id)),
      onLongPress: () => AppBottomSheet.show(
        context,
        title: l10n.more,
        body: SeriesOptionsWidget(series: series),
      ),
      itemIds: itemIds,
      title: series.name,
      subtitle: authorName,
      progress: series.finishRatio,
    );
  }
}
