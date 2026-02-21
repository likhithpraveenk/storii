// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_colors.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dynamicColors)
final dynamicColorsProvider = DynamicColorsFamily._();

final class DynamicColorsProvider
    extends
        $FunctionalProvider<
          AsyncValue<ColorScheme?>,
          ColorScheme?,
          FutureOr<ColorScheme?>
        >
    with $FutureModifier<ColorScheme?>, $FutureProvider<ColorScheme?> {
  DynamicColorsProvider._({
    required DynamicColorsFamily super.from,
    required Brightness super.argument,
  }) : super(
         retry: null,
         name: r'dynamicColorsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$dynamicColorsHash();

  @override
  String toString() {
    return r'dynamicColorsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ColorScheme?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ColorScheme?> create(Ref ref) {
    final argument = this.argument as Brightness;
    return dynamicColors(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DynamicColorsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$dynamicColorsHash() => r'4c4f2640c0c1cda06b17da801dd6e99130d523d3';

final class DynamicColorsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ColorScheme?>, Brightness> {
  DynamicColorsFamily._()
    : super(
        retry: null,
        name: r'dynamicColorsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DynamicColorsProvider call(Brightness brightness) =>
      DynamicColorsProvider._(argument: brightness, from: this);

  @override
  String toString() => r'dynamicColorsProvider';
}
