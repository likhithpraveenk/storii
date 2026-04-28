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

String formatBytes(int bytes) {
  const units = [
    (1073741824, 'GB'), // 1024^3
    (1048576, 'MB'), // 1024^2
    (1024, 'KB'),
  ];

  final formatter = NumberFormat('###.#');

  for (final (value, label) in units) {
    if (bytes >= value) {
      return '${formatter.format(bytes / value)} $label';
    }
  }

  return '$bytes B';
}

Future<void> launchUrlHelper(BuildContext context, String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: .externalApplication) && context.mounted) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.couldNotUrl(url))));
  }
}
