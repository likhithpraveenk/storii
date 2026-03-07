String cleanHtml(String data) {
  return data
      .replaceAll(RegExp(r'<\/?(p|div|br\s?\/?)>'), '\n')
      .replaceAll(RegExp(r'<\/?(b|i|strong|em|span|u|a)[^>]*>'), '')
      .replaceAll(RegExp(r'\n{3,}'), '\n\n')
      .trim();
}
