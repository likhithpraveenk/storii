// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(themeData)
final themeDataProvider = ThemeDataProvider._();

final class ThemeDataProvider
    extends $FunctionalProvider<ThemeData, ThemeData, ThemeData>
    with $Provider<ThemeData> {
  ThemeDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeDataHash();

  @$internal
  @override
  $ProviderElement<ThemeData> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeData create(Ref ref) {
    return themeData(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeData>(value),
    );
  }
}

String _$themeDataHash() => r'c17bc778f4e6c43bac681bbfdb3520fdb041f605';

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
