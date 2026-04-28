import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:storii/app/config/theme.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/models/log_entry.dart';
import 'package:storii/app/models/playback_event.dart';

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
    return formatter.format(this);
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
  double get inSecondsPrecise =>
      inMicroseconds / Duration.microsecondsPerSecond;

  String toTime({bool padHours = false}) {
    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);
    final hoursString = hours > 0
        ? '${hours.toString().padLeft(padHours ? 2 : 1, '0')}:'
        : padHours
        ? '00:'
        : '';
    final minutesString = minutes.toString().padLeft(2, '0');
    final secondsString = seconds.toString().padLeft(2, '0');
    return '$hoursString$minutesString:$secondsString';
  }

  String toReadableDuration({bool isLeft = false, bool showSeconds = false}) {
    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);

    return isLeft
        ? l10n.durationLeft(hours, minutes)
        : showSeconds
        ? l10n.readableDurationFull(hours, minutes, seconds)
        : l10n.readableDuration(hours, minutes);
  }
}

extension DoubleToDurationX on double {
  Duration get toDuration =>
      Duration(microseconds: (this * Duration.microsecondsPerSecond).round());
}

extension PlaybackEventKindX on PlaybackEventKind {
  String get label {
    return switch (this) {
      .play => l10n.play,
      .pause => l10n.pause,
      .seek => l10n.seek,
      .complete => l10n.complete,
      .stop => l10n.stop,
      .sync => l10n.sync,
    };
  }
}
