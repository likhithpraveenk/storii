import 'dart:convert';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:storii/abs_api/abs_api.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/models/log_entry.dart';
import 'package:storii/app/models/playable_item.dart';
import 'package:storii/l10n/l10n.dart';

extension IterableExtensions<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

extension ColorX on Uri {
  Color get color {
    final r = (hashCode & 0xFF0000) >> 16;
    final g = (hashCode & 0x00FF00) >> 8;
    final b = (hashCode & 0x0000FF);

    final brightR = (r - 30).clamp(0, 255).toInt();
    final brightG = (g - 30).clamp(0, 255).toInt();
    final brightB = (b - 30).clamp(0, 255).toInt();

    return Color.fromARGB(255, brightR, brightG, brightB);
  }

  String get cleanString {
    return toString().replaceFirst('//', '//\u2060');
  }
}

extension StringExtensions on String {
  Uri get normalizedUri {
    final input = trim().toLowerCase();

    if (!input.startsWith('http://') && !input.startsWith('https://')) {
      throw FormatException('URL must start with http:// or https://', this);
    }

    final uri = Uri.parse(input);

    final cleanPath = uri.path.endsWith('/') && uri.path.length > 1
        ? uri.path.substring(0, uri.path.length - 1)
        : uri.path;

    return uri.replace(host: uri.host.toLowerCase(), path: cleanPath);
  }

  String toPrettyJson() {
    try {
      final dynamic decoded = jsonDecode(this);
      const encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(decoded);
    } catch (_) {
      return this;
    }
  }
}

extension LogLevelX on LogLevel {
  Color color(ColorScheme scheme) {
    return switch (this) {
      .debug => appWhiteColor,
      .info => scheme.primary,
      .warning => appYellowColor,
      .error => appRedColor,
      .http => appGreenColor,
    };
  }
}

extension LocalFormatterX on DateTime {
  static final Map<String, DateFormat> _cache = {};

  String fString({String format = 'dd MMM y', bool forLogs = false}) {
    final pattern = forLogs ? '$format, HH:mm:ss.SSS' : format;

    final formatter = _cache.putIfAbsent(pattern, () => DateFormat(pattern));
    return formatter.format(toLocal());
  }
}

extension AudiobookSortX on Iterable<LibraryItem> {
  List<LibraryItem> sortedBySequence() {
    return toList()..sort((a, b) {
      double parseSequence(String? seq) {
        if (seq == null || seq.isEmpty) return 0.0;

        final firstPart = seq.split(RegExp(r'[,\-]')).first;
        final numericPart = firstPart.replaceAll(RegExp(r'[^0-9.]'), '');

        return double.tryParse(numericPart) ?? 0.0;
      }

      final aVal = parseSequence(a.seriesSequence);
      final bVal = parseSequence(b.seriesSequence);

      if (aVal == bVal) {
        return (a.seriesSequence ?? '').length.compareTo(
          (b.seriesSequence ?? '').length,
        );
      }
      return aVal.compareTo(bVal);
    });
  }
}

extension MissingFilterValueX on MissingFilterValue {
  String getDisplayString(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return switch (this) {
      .asin => l.missingAsin,
      .isbn => l.missingIsbn,
      .subtitle => l.missingSubtitle,
      .authors => l.missingAuthors,
      .publishedYear => l.missingPublishedYear,
      .series => l.missingSeries,
      .description => l.missingDescription,
      .genres => l.missingGenres,
      .tags => l.missingTags,
      .narrators => l.missingNarrators,
      .publisher => l.missingPublisher,
      .language => l.missingLanguage,
    };
  }
}

extension ProgressFilterValueX on ProgressFilterValue {
  String getDisplayString(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return switch (this) {
      .finished => l.statusFinished,
      .notStarted => l.statusNotStarted,
      .inProgress => l.statusInProgress,
      .notFinished => l.statusNotFinished,
    };
  }
}

extension TracksFilterValueX on TracksFilterValue {
  String getDisplayString(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return switch (this) {
      .single => l.singleTrack,
      .multi => l.multipleTracks,
    };
  }
}

extension FilterGroupX on FilterGroup {
  String getDisplayString(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return switch (this) {
      .all => l.all,
      .genres => l.filterGenre,
      .tags => l.filterTag,
      .series => l.filterSeries,
      .authors => l.filterAuthor,
      .progress => l.filterStatus,
      .narrators => l.filterNarrator,
      .languages => l.filterLanguage,
      .tracks => l.filterTracks,
      .missing => l.filterMissing,
      .issues => l.issuesFound,
      .feedOpen => l.feedOpen,
      .abridged => l.abridged,
      .explicit => l.explicit,
    };
  }
}

extension ColorExtensions on Color {
  String toHex() {
    final argb = toARGB32();
    return '#${argb.toRadixString(16).padLeft(8, '0')}';
  }

  String toHexNoAlpha() {
    final argb = toARGB32();
    return '#${(argb & 0xFFFFFF).toRadixString(16).padLeft(6, '0')}';
  }
}

extension AudiobookX on LibraryItem {
  (int, Duration) getIndexAndOffset() {
    var accumulated = Duration.zero;
    for (var i = 0; i < tracks.length; i++) {
      final trackLen = tracks[i].duration;
      if (currentOffset < accumulated + trackLen) {
        return (i, currentOffset - accumulated);
      }
      accumulated += trackLen;
    }
    return (0, Duration.zero);
  }
}

extension SnackBarShorthand on ScaffoldMessengerState {
  void showAppSnackBar(String message, {bool isError = false}) {
    showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: isError ? appRedColor : null,
      ),
    );
  }
}

extension DurationPreciseX on Duration {
  double get inSecondsPrecise => inMicroseconds / 1e6;

  String toTimestamp() {
    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);

    final hoursString = hours > 0 ? '${hours.toString().padLeft(2, '0')}:' : '';
    final minutesString = minutes.toString().padLeft(2, '0');
    final secondsString = seconds.toString().padLeft(2, '0');
    return '$hoursString$minutesString:$secondsString';
  }
}

extension DoubleToDurationX on double {
  Duration get toDuration => Duration(microseconds: (this * 1e6).round());
}

extension PlayableItemX on PlayableItem {
  // BookChapter? findChapter(Duration position) {
  //   return map(
  //     audiobook: (b) {
  //       final sec = position.inSecondsPrecise;
  //       return b.chapters.firstWhereOrNull(
  //         (c) => sec >= c.start && sec < c.end,
  //       );
  //     },
  //     podcast: (_) => null,
  //   );
  // }

  MediaItem toMediaItem() {
    return MediaItem(
      id: id,
      title: title ?? '',
      artist: map(
        audiobook: (b) => b.authorName,
        podcast: (p) => p.podcastTitle,
      ),
      duration: duration,
      artUri: cover,
      extras: {'sessionId': sessionId},
    );
  }
}
