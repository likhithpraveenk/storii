// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloaded_items_migration.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DownloadedItemsMigration)
final downloadedItemsMigrationProvider = DownloadedItemsMigrationProvider._();

final class DownloadedItemsMigrationProvider
    extends $AsyncNotifierProvider<DownloadedItemsMigration, void> {
  DownloadedItemsMigrationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadedItemsMigrationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadedItemsMigrationHash();

  @$internal
  @override
  DownloadedItemsMigration create() => DownloadedItemsMigration();
}

String _$downloadedItemsMigrationHash() =>
    r'516c4b7e9311ec01ea102ac52adc435b1d2e8bee';

abstract class _$DownloadedItemsMigration extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
