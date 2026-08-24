class AbsUrls {
  const new _();

  static Uri webClient(Uri serverUri) => serverUri.resolve('audiobookshelf');
  static Uri authConfig(Uri serverUri) =>
      serverUri.resolve('audiobookshelf/config/authentication');
}
