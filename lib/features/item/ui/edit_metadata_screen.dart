import 'package:abs_api/abs_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/item/logic/item_detail_provider.dart';
import 'package:storii/features/item/logic/item_metadata_notifier.dart';
import 'package:storii/features/item/ui/update_cover_widget.dart';
import 'package:storii/features/library/logic/filter_data_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_scrollbar.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/waveform.dart';
import 'package:uuid/uuid.dart';

part 'book_metadata_form.dart';
part 'metadata_chips.dart';
part 'metadata_field_widgets.dart';
part 'podcast_metadata_form.dart';

class EditMetadataScreen extends ConsumerWidget {
  final String id;
  const new({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metadataAsync = ref.watch(itemMetadataProvider(id));
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.editMetadata),
        actions: [_SaveButton(id)],
      ),
      body: metadataAsync.when(
        loading: () => const Center(child: RandomWaveform()),
        error: (e, _) => ErrorRetryWidget(
          'failed to get metadata',
          onRetry: () => ref.invalidate(itemDetailProvider(id)),
        ),
        data: (state) => state.isBook
            ? BookMetadataForm(id: id)
            : PodcastMetadataForm(id: id),
      ),
    );
  }
}

class _SaveButton extends ConsumerWidget {
  const new(this.id);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(itemMetadataProvider(id)).value;
    if (state == null) return const SizedBox.shrink();

    if (state.saving) {
      return const Padding(
        padding: .symmetric(horizontal: 16),
        child: Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      );
    }

    return TextButton(
      onPressed: state.canSave ? () => _save(context, ref) : null,
      child: Text(l10n.save),
    );
  }

  Future<void> _save(BuildContext context, WidgetRef ref) async {
    FocusScope.of(context).unfocus();
    final ok = await ref
        .read(itemMetadataProvider(id).notifier)
        .updateMetadata();
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(ok ? l10n.success : l10n.failed)));
    if (ok) context.pop();
  }
}
