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
    return '#${argb.toRadixString(16).padLeft(8, '0')}'.toUpperCase();
  }

  String toHexNoAlpha({bool addHash = false}) {
    final argb = toARGB32();
    final result = (argb & 0xFFFFFF)
        .toRadixString(16)
        .padLeft(6, '0')
        .toUpperCase();
    return addHash ? '#$result' : result;
  }

  static Color fromHex(String hex) {
    final string = hex.replaceFirst('#', '');
    return switch (string.length) {
      3 => Color.fromARGB(
        255,
        int.parse(string[0] + string[0], radix: 16),
        int.parse(string[1] + string[1], radix: 16),
        int.parse(string[2] + string[2], radix: 16),
      ),
      6 => Color.fromARGB(
        255,
        int.parse(string.substring(0, 2), radix: 16),
        int.parse(string.substring(2, 4), radix: 16),
        int.parse(string.substring(4, 6), radix: 16),
      ),
      8 => Color.fromARGB(
        int.parse(string.substring(0, 2), radix: 16),
        int.parse(string.substring(2, 4), radix: 16),
        int.parse(string.substring(4, 6), radix: 16),
        int.parse(string.substring(6, 8), radix: 16),
      ),
      _ => throw FormatException('Invalid hex color: $hex'),
    };
  }
}

extension SnackBarShorthand on ScaffoldMessengerState {
  void showAppSnackBar(
    String message, {
    bool isError = false,
    Duration? duration,
  }) {
    showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration ?? const Duration(seconds: 2),
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

extension DurationX on Duration {
  Duration clamp(Duration start, Duration end) {
    if (this < start) return start;
    if (this > end) return end;
    return this;
  }
}

extension DynamicSchemeVariantX on DynamicSchemeVariant {
  String get label {
    return switch (this) {
      .tonalSpot => l10n.tonalSpot,
      .fidelity => l10n.fidelity,
      .monochrome => l10n.monochrome,
      .neutral => l10n.neutral,
      .vibrant => l10n.vibrant,
      .expressive => l10n.expressive,
      _ => l10n.empty,
    };
  }

  String get subtitle {
    return switch (this) {
      .tonalSpot => l10n.tonalSpotSubtitle,
      .fidelity => l10n.fidelitySubtitle,
      .monochrome => l10n.monochromeSubtitle,
      .neutral => l10n.neutralSubtitle,
      .vibrant => l10n.vibrantSubtitle,
      .expressive => l10n.expressiveSubtitle,
      _ => l10n.empty,
    };
  }
}

extension PrettyJsonX on Map<String, dynamic> {
  String toPrettyJson([List<String>? keysToHide]) {
    final Map<String, dynamic> copy = Map.from(this);

    if (keysToHide != null) {
      copy.removeWhere((key, _) => keysToHide.contains(key));
    }

    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(copy);
  }
}
