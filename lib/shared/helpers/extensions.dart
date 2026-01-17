import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:storii/app/models/item.dart';
import 'package:storii/app/models/log_entry.dart';

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
}

extension LogLevelX on LogLevelDomain {
  Color color(ColorScheme scheme) {
    return switch (this) {
      .info => scheme.primary,
      .warning => scheme.tertiary,
      .error => scheme.error,
    };
  }
}

extension LocalFormatterX on DateTime {
  static final Map<String, DateFormat> _cache = {};

  String fString({String format = 'dd MMM yyyy', bool forLogs = false}) {
    final pattern = forLogs ? 'dd MMM, HH:mm:ss.SSS' : format;

    final formatter = _cache.putIfAbsent(pattern, () => DateFormat(pattern));
    return formatter.format(toLocal());
  }
}

extension StackTraceX on StackTrace {
  String toLimitedString({int lines = 10}) =>
      toString().split('\n').take(lines).join('\n');
}

extension AudiobookSortX on Iterable<ItemDomain> {
  List<ItemDomain> sortedBySequence() {
    return toList()..sort((a, b) {
      double parseSequence(String? seq) {
        if (seq == null || seq.isEmpty) return 0.0;
        final numericPart = seq.replaceAll(RegExp(r'[^0-9.]'), '');
        return double.tryParse(numericPart) ?? 0.0;
      }

      final aVal = parseSequence(
        a.mapOrNull(audiobook: (x) => x.seriesSequence),
      );
      final bVal = parseSequence(
        b.mapOrNull(audiobook: (x) => x.seriesSequence),
      );

      return aVal.compareTo(bVal);
    });
  }
}
