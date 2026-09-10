// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_migration.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DownloadMigrationV3)
final downloadMigrationV3Provider = DownloadMigrationV3Provider._();

final class DownloadMigrationV3Provider
    extends $NotifierProvider<DownloadMigrationV3, void> {
  DownloadMigrationV3Provider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadMigrationV3Provider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadMigrationV3Hash();

  @$internal
  @override
  DownloadMigrationV3 create() => DownloadMigrationV3();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$downloadMigrationV3Hash() =>
    r'c7bed31bbd24c2ac229836cee0d001476832f351';

abstract class _$DownloadMigrationV3 extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
