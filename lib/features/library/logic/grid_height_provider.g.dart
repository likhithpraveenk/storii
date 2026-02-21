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

String _$gridHeightHash() => r'fa16759f3a4c868924443bc3ae0b0eb1b7044c63';

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

String _$authorsGridHeightHash() => r'aa4bf2b3f940ef664b85fa1c2b3ca99d7e6fad41';

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

String _$seriesGridHeightHash() => r'025a8263f8f9a59ade7f690fe11be723465fc6a6';

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

String _$shelfHeightHash() => r'9b615604e8678627bf02fa0097f6954a25cb5a13';

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
