// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_height_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(gridHeight)
final gridHeightProvider = GridHeightProvider._();

final class GridHeightProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  GridHeightProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gridHeightProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gridHeightHash();

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    return gridHeight(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$gridHeightHash() => r'e86eb09bfc84ed900dd320eb0763ea05c3ebbcfe';

@ProviderFor(authorsGridHeight)
final authorsGridHeightProvider = AuthorsGridHeightProvider._();

final class AuthorsGridHeightProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  AuthorsGridHeightProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authorsGridHeightProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authorsGridHeightHash();

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    return authorsGridHeight(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$authorsGridHeightHash() => r'c4389f7a1407a95be047dbf21283c7f5df638f98';

@ProviderFor(seriesGridHeight)
final seriesGridHeightProvider = SeriesGridHeightProvider._();

final class SeriesGridHeightProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  SeriesGridHeightProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'seriesGridHeightProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$seriesGridHeightHash();

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    return seriesGridHeight(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$seriesGridHeightHash() => r'6bfa0846fd56db8e454196c13aa2fdfc81a05076';

@ProviderFor(shelfHeight)
final shelfHeightProvider = ShelfHeightFamily._();

final class ShelfHeightProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  ShelfHeightProvider._({
    required ShelfHeightFamily super.from,
    required ShelfType super.argument,
  }) : super(
         retry: null,
         name: r'shelfHeightProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$shelfHeightHash();

  @override
  String toString() {
    return r'shelfHeightProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    final argument = this.argument as ShelfType;
    return shelfHeight(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ShelfHeightProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$shelfHeightHash() => r'f7c14504cd4a8b3e84d94bf692658f072a924f96';

final class ShelfHeightFamily extends $Family
    with $FunctionalFamilyOverride<double, ShelfType> {
  ShelfHeightFamily._()
    : super(
        retry: null,
        name: r'shelfHeightProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ShelfHeightProvider call(ShelfType type) =>
      ShelfHeightProvider._(argument: type, from: this);

  @override
  String toString() => r'shelfHeightProvider';
}
