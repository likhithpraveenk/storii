// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_migration.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DownloadMigrationV4)
final downloadMigrationV4Provider = DownloadMigrationV4Provider._();

final class DownloadMigrationV4Provider
    extends $NotifierProvider<DownloadMigrationV4, void> {
  DownloadMigrationV4Provider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadMigrationV4Provider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadMigrationV4Hash();

  @$internal
  @override
  DownloadMigrationV4 create() => DownloadMigrationV4();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$downloadMigrationV4Hash() =>
    r'44c29149d88c2b84bf2ea7202cdf12184389cc48';

abstract class _$DownloadMigrationV4 extends $Notifier<void> {
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
