// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dominant_color.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// getting dominant [Color] of an image via histogram/bucketing approach

@ProviderFor(dominantColor)
final dominantColorProvider = DominantColorFamily._();

/// getting dominant [Color] of an image via histogram/bucketing approach

final class DominantColorProvider
    extends $FunctionalProvider<AsyncValue<Color?>, Color?, FutureOr<Color?>>
    with $FutureModifier<Color?>, $FutureProvider<Color?> {
  /// getting dominant [Color] of an image via histogram/bucketing approach
  DominantColorProvider._({
    required DominantColorFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'dominantColorProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$dominantColorHash();

  @override
  String toString() {
    return r'dominantColorProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Color?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Color?> create(Ref ref) {
    final argument = this.argument as String;
    return dominantColor(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DominantColorProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$dominantColorHash() => r'b352697822ca41b4c81287fb26846a713caa3485';

/// getting dominant [Color] of an image via histogram/bucketing approach

final class DominantColorFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Color?>, String> {
  DominantColorFamily._()
    : super(
        retry: null,
        name: r'dominantColorProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// getting dominant [Color] of an image via histogram/bucketing approach

  DominantColorProvider call(String coverUrl) =>
      DominantColorProvider._(argument: coverUrl, from: this);

  @override
  String toString() => r'dominantColorProvider';
}
