// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_theme.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playerTheme)
final playerThemeProvider = PlayerThemeFamily._();

final class PlayerThemeProvider
    extends $FunctionalProvider<ThemeData?, ThemeData?, ThemeData?>
    with $Provider<ThemeData?> {
  PlayerThemeProvider._({
    required PlayerThemeFamily super.from,
    required Brightness super.argument,
  }) : super(
         retry: null,
         name: r'playerThemeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playerThemeHash();

  @override
  String toString() {
    return r'playerThemeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ThemeData?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeData? create(Ref ref) {
    final argument = this.argument as Brightness;
    return playerTheme(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeData? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeData?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerThemeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playerThemeHash() => r'6aea3b983c35691e2fa17355a9b9b8241406a8fe';

final class PlayerThemeFamily extends $Family
    with $FunctionalFamilyOverride<ThemeData?, Brightness> {
  PlayerThemeFamily._()
    : super(
        retry: null,
        name: r'playerThemeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlayerThemeProvider call(Brightness brightness) =>
      PlayerThemeProvider._(argument: brightness, from: this);

  @override
  String toString() => r'playerThemeProvider';
}
