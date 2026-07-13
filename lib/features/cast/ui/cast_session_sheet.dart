import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/cast/logic/cast_controller.dart';
import 'package:storii/features/cast/logic/cast_session_notifier.dart';
import 'package:storii/features/cast/models/cast_session.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/widgets/app_buttons.dart';
import 'package:storii/storage/local/cast_session_store.dart';

class CastSessionSheet extends ConsumerStatefulWidget {
  const CastSessionSheet({super.key, required this.itemId, this.episodeId});
  final String itemId;
  final String? episodeId;

  @override
  ConsumerState<CastSessionSheet> createState() => _CastSessionSheetState();
}

class _CastSessionSheetState extends ConsumerState<CastSessionSheet> {
  static const _step = Duration(minutes: 1);
  var _timeListened = Duration.zero;

  @override
  void initState() {
    super.initState();
    final session = ref
        .read(castSessionProvider(widget.itemId, widget.episodeId))
        .value;
    _timeListened = _computeListened(session);
  }

  Duration _computeListened(CastSession? session) {
    final listened =
        (session?.currentGlobalPosition ?? Duration.zero) -
        (session?.initialPosition ?? Duration.zero);
    return listened.isNegative ? Duration.zero : listened;
  }

  void _adjust(Duration delta) {
    setState(() {
      final next = _timeListened + delta;
      _timeListened = next.isNegative ? Duration.zero : next;
    });
  }

  @override
  Widget build(BuildContext context) {
    final session = ref
        .watch(castSessionProvider(widget.itemId, widget.episodeId))
        .value;
    final notifier = ref.read(
      castSessionProvider(widget.itemId, widget.episodeId).notifier,
    );
    return Padding(
      padding: const .symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Consumer(
            builder: (context, ref, _) {
              final isCurrentSessionAction = ref.watch(
                castControllerProvider.select(
                  (s) => s.id == session?.id && s.isActive,
                ),
              );
              if (!isCurrentSessionAction) return const SizedBox.shrink();
              return Container(
                padding: const .only(bottom: 8),
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: ref.read(castControllerProvider.notifier).stop,
                  icon: const Icon(Icons.stop_circle_outlined),
                  label: Text(l10n.stop),
                ),
              );
            },
          ),
          _SessionInfoRow(label: l10n.deviceName, value: session?.device?.name),
          const SizedBox(height: 8),
          _SessionInfoRow(
            label: l10n.subtitle,
            value: session?.device?.subtitle,
          ),
          const SizedBox(height: 8),
          _SessionInfoRow(label: l10n.title, value: session?.target?.title),
          const SizedBox(height: 8),
          _SessionInfoRow(
            label: l10n.startedAt,
            value: session?.initialPosition.toTime(padHours: true),
          ),
          const SizedBox(height: 8),
          _SessionInfoRow(
            label: l10n.currentPosition,
            value: session?.currentGlobalPosition.toTime(padHours: true),
          ),
          const SizedBox(height: 8),
          _EditableListenedTimeRow(
            label: l10n.totalListeningTime,
            value: _timeListened,
            onDecrement: () => _adjust(-_step),
            onIncrement: () => _adjust(_step),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: .spaceAround,
            children: [
              AppFilledButton(
                text: l10n.delete,
                isDestructive: true,
                onPressed: () {
                  if (session?.id != null) {
                    ref
                        .read(castSessionStoreProvider.notifier)
                        .delete(session!.id!);
                    Navigator.of(context).pop();
                  }
                },
              ),
              AppFilledButton(
                text: l10n.sync,
                onPressed: () async {
                  if (session?.id != null) {
                    try {
                      await notifier.sync(_timeListened);
                      if (context.mounted) Navigator.of(context).pop();
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(
                          context,
                        ).showAppSnackBar('$e', isError: true);
                      }
                    }
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _SessionInfoRow extends StatelessWidget {
  const _SessionInfoRow({required this.label, required this.value});

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    if (value == null) return const SizedBox.shrink();

    final theme = Theme.of(context);
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: .w400,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            maxLines: 2,
            overflow: .ellipsis,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            value!,
            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: .w500),
            softWrap: true,
            textAlign: .start,
          ),
        ),
      ],
    );
  }
}

class _EditableListenedTimeRow extends StatelessWidget {
  const _EditableListenedTimeRow({
    required this.label,
    required this.value,
    required this.onDecrement,
    required this.onIncrement,
  });

  final String label;
  final Duration value;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: .w400,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            maxLines: 2,
            overflow: .ellipsis,
          ),
        ),
        Row(
          mainAxisSize: .min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: value > Duration.zero ? onDecrement : null,
              visualDensity: .compact,
            ),
            SizedBox(
              width: 72,
              child: Text(
                value.toReadableDuration(showSeconds: true),
                textAlign: .center,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: onIncrement,
              visualDensity: .compact,
            ),
          ],
        ),
      ],
    );
  }
}
