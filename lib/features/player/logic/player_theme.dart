import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/library/logic/cover_url_provider.dart';
import 'package:storii/features/player/logic/dominant_color.dart';
import 'package:storii/features/player/logic/session_notifier.dart';

part 'player_theme.g.dart';

@riverpod
ThemeData? playerTheme(Ref ref, Brightness brightness) {
  final backgroundTheme = ref.watch(playerBackgroundThemeProvider);
  if (backgroundTheme == .none) return null;

  final itemId = ref.watch(sessionProvider.select((s) => s?.libraryItemId));

  String? coverUrl;
  if (itemId != null) {
    coverUrl = ref.watch(coverUrlProvider(itemId, type: .item));
  }

  final dominant = coverUrl != null
      ? ref.watch(dominantColorProvider(coverUrl)).value
      : null;
  if (dominant != null) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: dominant,
        brightness: brightness,
      ),
    );
  }

  return null;
}
