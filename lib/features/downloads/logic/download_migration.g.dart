// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_migration.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DownloadMigrationV2)
final downloadMigrationV2Provider = DownloadMigrationV2Provider._();

final class DownloadMigrationV2Provider
    extends $NotifierProvider<DownloadMigrationV2, void> {
  DownloadMigrationV2Provider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadMigrationV2Provider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadMigrationV2Hash();

  @$internal
  @override
  DownloadMigrationV2 create() => DownloadMigrationV2();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$downloadMigrationV2Hash() =>
    r'450db6d64ab8c4f4bcacf2203ce09a47d1b91fd9';

abstract class _$DownloadMigrationV2 extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
