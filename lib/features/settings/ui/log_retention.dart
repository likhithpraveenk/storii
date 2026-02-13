import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/l10n/l10n.dart';

class LogRetentionTile extends ConsumerWidget {
  const LogRetentionTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final days = ref.watch(logRetentionProvider).inDays;

    return ListTile(
      leading: const Icon(Icons.bug_report),
      title: Text(AppLocalizations.of(context)!.logHistory),
      subtitle: Text(AppLocalizations.of(context)!.keepLogsFor(days)),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        final scaffoldContext = shellScaffoldKey.currentContext;
        if (scaffoldContext == null) return;
        showModalBottomSheet(
          context: scaffoldContext,
          showDragHandle: true,
          builder: (context) => const LogRetentionSheet(),
        );
      },
    );
  }
}

class LogRetentionSheet extends ConsumerStatefulWidget {
  const LogRetentionSheet({super.key});

  @override
  ConsumerState<LogRetentionSheet> createState() => _LogRetentionSheetState();
}

class _LogRetentionSheetState extends ConsumerState<LogRetentionSheet> {
  double? _currentTempDays;

  @override
  Widget build(BuildContext context) {
    final savedDays = ref.watch(logRetentionProvider).inDays.toDouble();
    final displayDays = _currentTempDays ?? savedDays;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppLocalizations.of(context)!.keepLogsFor(displayDays.round()),
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        Slider(
          value: displayDays,
          min: 1,
          max: 14,
          divisions: 13,
          onChanged: (value) {
            setState(() => _currentTempDays = value);
          },
          onChangeEnd: (value) {
            ref
                .read(appSettingsProvider.notifier)
                .setLogRetention(Duration(days: value.round()));
          },
        ),
        Text(
          AppLocalizations.of(context)!.autoDeleteNotice,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
