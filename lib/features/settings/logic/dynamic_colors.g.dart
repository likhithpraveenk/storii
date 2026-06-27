// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_colors.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dynamicColors)
final dynamicColorsProvider = DynamicColorsProvider._();

final class DynamicColorsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Color>>,
          List<Color>,
          FutureOr<List<Color>>
        >
    with $FutureModifier<List<Color>>, $FutureProvider<List<Color>> {
  DynamicColorsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dynamicColorsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dynamicColorsHash();

  @$internal
  @override
  $FutureProviderElement<List<Color>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Color>> create(Ref ref) {
    return dynamicColors(ref);
  }
}

String _$dynamicColorsHash() => r'e9fa4c7fa32b494c2a39b86b8fd2630f30395c10';
