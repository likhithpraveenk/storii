String cleanHtml(String data) {
  return data
      .replaceAll(RegExp(r'<\/?(p|div|br\s?\/?)>'), '\n')
      .replaceAll(RegExp(r'<\/?(b|i|strong|em|span|u|a)[^>]*>'), '')
      .replaceAll(RegExp(r'\n{3,}'), '\n\n')
      .trim();
}

String formatBytes(int bytes) {
  if (bytes >= 1024 * 1024) {
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  } else if (bytes >= 1024) {
    return '${(bytes / 1024).toStringAsFixed(1)} KB';
  }
  return '$bytes B';
}
