// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_storage_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(hiveStorageService)
final hiveStorageServiceProvider = HiveStorageServiceProvider._();

final class HiveStorageServiceProvider
    extends
        $FunctionalProvider<
          HiveStorageService,
          HiveStorageService,
          HiveStorageService
        >
    with $Provider<HiveStorageService> {
  HiveStorageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hiveStorageServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hiveStorageServiceHash();

  @$internal
  @override
  $ProviderElement<HiveStorageService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HiveStorageService create(Ref ref) {
    return hiveStorageService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HiveStorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HiveStorageService>(value),
    );
  }
}

String _$hiveStorageServiceHash() =>
    r'26707da3cb3d92281c00da09a30dd559c1602839';

@ProviderFor(HiveStorage)
final hiveStorageProvider = HiveStorageProvider._();

final class HiveStorageProvider
    extends $NotifierProvider<HiveStorage, List<HiveBoxEntry>> {
  HiveStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hiveStorageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hiveStorageHash();

  @$internal
  @override
  HiveStorage create() => HiveStorage();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<HiveBoxEntry> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<HiveBoxEntry>>(value),
    );
  }
}

String _$hiveStorageHash() => r'676d343e885df29d487b1166261d2f257160bccf';

abstract class _$HiveStorage extends $Notifier<List<HiveBoxEntry>> {
  List<HiveBoxEntry> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<HiveBoxEntry>, List<HiveBoxEntry>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<HiveBoxEntry>, List<HiveBoxEntry>>,
              List<HiveBoxEntry>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
