class AndroidAutoPaging {
  const new({required this.page, required this.pageSize});

  final int page;
  final int pageSize;
}

AndroidAutoPaging androidAutoPagingFromOptions(Map<String, dynamic>? options) {
  const pageKey = 'android.media.browse.extra.PAGE';
  const pageSizeKey = 'android.media.browse.extra.PAGE_SIZE';
  final page = (options?[pageKey] as int?) ?? 0;
  final pageSize = ((options?[pageSizeKey] as int?) ?? 100).clamp(0, 200);
  return AndroidAutoPaging(page: page, pageSize: pageSize);
}

List<T> applyAndroidAutoPaging<T>(List<T> items, AndroidAutoPaging paging) {
  if (paging.pageSize <= 0) return items;
  final start = paging.page * paging.pageSize;
  if (start >= items.length) return const [];
  final end = (start + paging.pageSize).clamp(0, items.length);
  return items.sublist(start, end);
}
