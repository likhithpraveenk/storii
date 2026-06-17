import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:storii/app/init.dart';
import 'package:url_launcher/url_launcher.dart';

String cleanHtml(String data) {
  return data
      .replaceAll(RegExp(r'<\/?(p|div|br\s?\/?)>'), '\n')
      .replaceAll(RegExp(r'<\/?(b|i|strong|em|span|u|a|li)[^>]*>'), '')
      .replaceAll(RegExp(r'\n{3,}'), '\n\n')
      .trim();
}

String formatBytes(int? bytes, {bool use1000 = false}) {
  if (bytes == null) return '-';

  const properUnits = [(1073741824, 'GB'), (1048576, 'MB'), (1024, 'KB')];
  const uglyUnits = [(1000000000, 'GB'), (1000000, 'MB'), (1000, 'KB')];

  final units = use1000 ? uglyUnits : properUnits;

  final formatter = NumberFormat('###.#');

  for (final (value, label) in units) {
    if (bytes >= value) {
      return '${formatter.format(bytes / value)} $label';
    }
  }

  return '$bytes B';
}

String formatBitrate(int? bitrate) {
  if (bitrate == null) return '-';

  const units = [(1000000000, 'Gbps'), (1000000, 'Mbps'), (1000, 'kbps')];

  final formatter = NumberFormat('###.#');

  for (final (value, label) in units) {
    if (bitrate >= value) {
      return '${formatter.format((bitrate / value))} $label';
    }
  }

  return '$bitrate bps';
}

Future<void> launchUrlHelper(BuildContext context, String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: .externalApplication) && context.mounted) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.couldNotUrl(url))));
  }
}
