// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cover_url_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(coverUrl)
final coverUrlProvider = CoverUrlFamily._();

final class CoverUrlProvider
    extends $FunctionalProvider<String?, String?, String?>
    with $Provider<String?> {
  CoverUrlProvider._({
    required CoverUrlFamily super.from,
    required (
      String, {
      CoverType type,
      DateTime? updatedAt,
      int? width,
      bool raw,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'coverUrlProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$coverUrlHash();

  @override
  String toString() {
    return r'coverUrlProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String? create(Ref ref) {
    final argument =
        this.argument
            as (
              String, {
              CoverType type,
              DateTime? updatedAt,
              int? width,
              bool raw,
            });
    return coverUrl(
      ref,
      argument.$1,
      type: argument.type,
      updatedAt: argument.updatedAt,
      width: argument.width,
      raw: argument.raw,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CoverUrlProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$coverUrlHash() => r'a0d3c1cb2e026e23fb478c9b45f04dc1c277f3e7';

final class CoverUrlFamily extends $Family
    with
        $FunctionalFamilyOverride<
          String?,
          (String, {CoverType type, DateTime? updatedAt, int? width, bool raw})
        > {
  CoverUrlFamily._()
    : super(
        retry: null,
        name: r'coverUrlProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CoverUrlProvider call(
    String id, {
    required CoverType type,
    DateTime? updatedAt,
    int? width,
    bool raw = false,
  }) => CoverUrlProvider._(
    argument: (id, type: type, updatedAt: updatedAt, width: width, raw: raw),
    from: this,
  );

  @override
  String toString() => r'coverUrlProvider';
}
