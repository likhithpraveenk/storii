import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/keys.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/more/logic/changelog_provider.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';
import 'package:storii/shared/widgets/app_scrollbar.dart';
import 'package:storii/shared/widgets/error_retry.dart';
import 'package:storii/shared/widgets/scrollable_widget.dart';
import 'package:storii/shared/widgets/waveform.dart';

class ChangelogTile extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.new_releases_outlined),
      title: Text(l10n.changelog),
      onTap: () => context.push(AppRoute.changelog.path),
    );
  }
}

class ChangelogScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<ChangelogScreen> createState() => _ChangelogScreenState();
}

class _ChangelogScreenState extends ConsumerState<ChangelogScreen> {
  final controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final changelogAsync = ref.watch(changelogProvider);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l10n.changelog, style: textTheme.titleLarge),
      ),
      body: changelogAsync.when(
        loading: () => const Center(child: RandomWaveform()),
        error: (e, _) => ScrollableWidget(
          child: ErrorRetryWidget(
            e.toString(),
            onRetry: () => ref.invalidate(changelogProvider),
          ),
        ),
        data: (entries) => AppScrollbar(
          controller: controller,
          child: ListView.separated(
            controller: controller,
            padding: const .symmetric(horizontal: 24),
            itemCount: entries.length,
            separatorBuilder: (_, _) => const Divider(),
            itemBuilder: (context, index) => ChangelogEntryView(entries[index]),
          ),
        ),
      ),
    );
  }
}

Future<void> showWhatsNew(ChangelogEntry entry) async {
  final context = shellScaffoldKey.currentContext;
  if (context == null) return;

  await AppBottomSheet.show(
    context,
    title: l10n.whatsNew,
    body: Padding(
      padding: const .symmetric(horizontal: 24),
      child: ChangelogEntryView(entry),
    ),
  );
}

class ChangelogEntryView extends ConsumerWidget {
  const new(this.entry, {super.key});

  final ChangelogEntry entry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final date = entry.date?.fString(format: ref.watch(dateTimeFormatProvider));

    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          spacing: 16,
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(entry.version, style: textTheme.headlineMedium),
            if (date != null)
              Text(
                date,
                style: textTheme.bodyLarge?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
          ],
        ),
        for (final group in entry.groups) ...[
          const SizedBox(height: 16),
          Text(group.title, style: textTheme.titleLarge),
          const SizedBox(height: 8),
          for (final item in group.items)
            Padding(
              padding: const .only(bottom: 6),
              child: Row(
                crossAxisAlignment: .start,
                spacing: 8,
                children: [
                  const Text(kDot),
                  Expanded(child: Text(item, style: textTheme.bodyMedium)),
                ],
              ),
            ),
        ],
      ],
    );
  }
}
