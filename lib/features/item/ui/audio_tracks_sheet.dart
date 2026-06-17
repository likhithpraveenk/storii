import 'package:abs_api/abs_api.dart';
import 'package:flutter/material.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/init.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/shared/helpers/helpers.dart';
import 'package:storii/shared/widgets/app_bottom_sheet.dart';

void showAudioTracksSheet(
  BuildContext context, {
  required List<AudioTrack> tracks,
  required List<AudioFile> audioFiles,
}) {
  showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: .vertical(top: .circular(24)),
    ),
    builder: (_) => SafeArea(
      child: DecoratedBox(
        decoration: bottomSheetDecoration(context),
        child: Column(
          mainAxisSize: .min,
          children: [
            Padding(
              padding: const .fromLTRB(24, 24, 24, 16),
              child: Text(
                l10n.tracks,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 20,
                  fontWeight: .w600,
                  letterSpacing: -0.3,
                ),
                textAlign: .center,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const .only(bottom: 36),
                itemCount: tracks.length,
                itemBuilder: (context, index) => _AudioTrackTile(
                  track: tracks[index],
                  index: index,
                  audioFile: audioFiles.length > index
                      ? audioFiles[index]
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _AudioTrackTile extends StatefulWidget {
  const _AudioTrackTile({
    required this.track,
    required this.index,
    this.audioFile,
  });

  final AudioTrack track;
  final int index;
  final AudioFile? audioFile;

  @override
  State<_AudioTrackTile> createState() => _AudioTrackTileState();
}

class _AudioTrackTileState extends State<_AudioTrackTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    final file = widget.audioFile;
    final filename = file?.metadata.filename ?? widget.track.title;
    final bitRate = file?.bitRate ?? widget.track.bitRate;
    final duration = file?.duration ?? widget.track.duration;
    final size = file?.metadata.size;

    return InkWell(
      onTap: () => setState(() => _expanded = !_expanded),
      child: Padding(
        padding: const .symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 32,
                  child: Text(
                    '${widget.index + 1}',
                    style: textTheme.labelMedium?.copyWith(
                      color: scheme.onSurfaceVariant.withValues(alpha: 0.5),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        filename,
                        maxLines: 1,
                        overflow: .ellipsis,
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: .w500,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${formatBitrate(bitRate)}  •  ${duration.toReadableDuration()}',
                        style: textTheme.bodySmall?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                if (size != null)
                  Text(
                    formatBytes(size),
                    style: textTheme.labelSmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                const SizedBox(width: 4),
                Icon(
                  _expanded ? Icons.expand_less : Icons.expand_more,
                  size: 20,
                  color: scheme.onSurfaceVariant.withValues(alpha: 0.5),
                ),
              ],
            ),
            if (_expanded && file != null) ...[
              const SizedBox(height: 8),
              _ExpandedDetails(file: file, track: widget.track),
            ],
          ],
        ),
      ),
    );
  }
}

class _ExpandedDetails extends StatelessWidget {
  const _ExpandedDetails({required this.file, required this.track});

  final AudioFile file;
  final AudioTrack track;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    final rows = <(String, String?)>[
      (l10n.codec, file.codec ?? track.codec),
      (l10n.bitrate, formatBitrate(file.bitRate ?? track.bitRate)),
      (l10n.channels, file.channels?.toString() ?? track.channels?.toString()),
      (l10n.format, file.format ?? track.format),
      (l10n.language, file.language ?? track.language),
      (l10n.path, file.metadata.path),
    ];

    return Container(
      margin: const .only(left: 32),
      padding: const .all(12),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: .circular(kRadius),
      ),
      child: Column(
        children: rows
            .where((r) => r.$2 != null)
            .map(
              (r) => Padding(
                padding: const .symmetric(vertical: 2),
                child: Row(
                  crossAxisAlignment: .start,
                  children: [
                    SizedBox(
                      width: 72,
                      child: Text(
                        r.$1,
                        style: textTheme.labelSmall?.copyWith(
                          color: scheme.onSurfaceVariant.withValues(alpha: 0.8),
                        ),
                      ),
                    ),
                    Expanded(child: Text(r.$2!, style: textTheme.bodySmall)),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
