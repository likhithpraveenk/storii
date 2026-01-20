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

String _$gridHeightHash() => r'0bd43b36431f77d4640708b9f850ab4395022328';

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

String _$authorsGridHeightHash() => r'0b718398923939f31e67d3056ae05f0de7885c77';

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

String _$seriesGridHeightHash() => r'5e42b95adb2da02d9d77368beb6f8f0189fe9877';

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

String _$shelfHeightHash() => r'f7d75213a4e4d111b7409cf8eb66f91e3c1f87a1';

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
