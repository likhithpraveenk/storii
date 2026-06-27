// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(themeData)
final themeDataProvider = ThemeDataFamily._();

final class ThemeDataProvider
    extends $FunctionalProvider<ThemeData, ThemeData, ThemeData>
    with $Provider<ThemeData> {
  ThemeDataProvider._({
    required ThemeDataFamily super.from,
    required Brightness super.argument,
  }) : super(
         retry: null,
         name: r'themeDataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$themeDataHash();

  @override
  String toString() {
    return r'themeDataProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ThemeData> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeData create(Ref ref) {
    final argument = this.argument as Brightness;
    return themeData(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeData>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ThemeDataProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$themeDataHash() => r'b0dc01f8fc260ec6511ea9556d2e4b0f3ea36fe5';

final class ThemeDataFamily extends $Family
    with $FunctionalFamilyOverride<ThemeData, Brightness> {
  ThemeDataFamily._()
    : super(
        retry: null,
        name: r'themeDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ThemeDataProvider call(Brightness brightness) =>
      ThemeDataProvider._(argument: brightness, from: this);

  @override
  String toString() => r'themeDataProvider';
}

@ProviderFor(textScaler)
final textScalerProvider = TextScalerProvider._();

final class TextScalerProvider
    extends $FunctionalProvider<TextScaler, TextScaler, TextScaler>
    with $Provider<TextScaler> {
  TextScalerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'textScalerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$textScalerHash();

  @$internal
  @override
  $ProviderElement<TextScaler> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TextScaler create(Ref ref) {
    return textScaler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextScaler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextScaler>(value),
    );
  }
}

String _$textScalerHash() => r'5c48e26aae7ff9b70b72507a77710dfac6c3057e';

@ProviderFor(appStartThemeUpdate)
final appStartThemeUpdateProvider = AppStartThemeUpdateProvider._();

final class AppStartThemeUpdateProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  AppStartThemeUpdateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appStartThemeUpdateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appStartThemeUpdateHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return appStartThemeUpdate(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$appStartThemeUpdateHash() =>
    r'4b7013e286ca2323d54c88f21016efb2bcf2608f';
