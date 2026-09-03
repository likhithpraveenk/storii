enum AndroidAutoNodeKind { resume, shelf, downloads }

class AndroidAutoNode {
  const new({
    required this.id,
    required this.title,
    this.playable = false,
    required this.kind,
    this.shelfId,
  });

  final String id;
  final String title;
  final bool playable;
  final AndroidAutoNodeKind kind;
  final String? shelfId;
}

sealed class AndroidAutoMediaId {
  const new();

  static AndroidAutoMediaId parse(String mediaId) {
    if (mediaId == 'root') return const AndroidAutoMediaRoot();

    final parts = mediaId.split(':');
    if (parts.length < 2) return const AndroidAutoMediaInvalid();

    return switch (parts[0]) {
      'shelf' => AndroidAutoMediaShelf(parts[1]),
      'item' => AndroidAutoMediaItem(parts[1]),
      'dlItem' => AndroidAutoMediaItem(parts[1], fromDownloads: true),
      'episode' => () {
        if (parts.length < 3) return const AndroidAutoMediaInvalid();
        return AndroidAutoMediaEpisode(parts[1], parts[2]);
      }(),
      _ => const AndroidAutoMediaInvalid(),
    };
  }
}

final class AndroidAutoMediaRoot extends AndroidAutoMediaId {
  const new();
}

final class AndroidAutoMediaShelf extends AndroidAutoMediaId {
  const new(this.id);
  final String id;
}

final class AndroidAutoMediaItem extends AndroidAutoMediaId {
  const new(this.id, {this.fromDownloads = false});
  final String id;
  final bool fromDownloads;
}

final class AndroidAutoMediaEpisode extends AndroidAutoMediaId {
  const new(this.itemId, this.episodeId);
  final String itemId;
  final String episodeId;
}

final class AndroidAutoMediaInvalid extends AndroidAutoMediaId {
  const new();
}
