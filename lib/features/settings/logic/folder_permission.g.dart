// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_permission.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(checkFolderPermission)
final checkFolderPermissionProvider = CheckFolderPermissionFamily._();

final class CheckFolderPermissionProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  CheckFolderPermissionProvider._({
    required CheckFolderPermissionFamily super.from,
    required StorageLocation super.argument,
  }) : super(
         retry: null,
         name: r'checkFolderPermissionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$checkFolderPermissionHash();

  @override
  String toString() {
    return r'checkFolderPermissionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as StorageLocation;
    return checkFolderPermission(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckFolderPermissionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$checkFolderPermissionHash() =>
    r'054a32eebf03c0bb38b9ecd35bf6183c4a98701d';

final class CheckFolderPermissionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, StorageLocation> {
  CheckFolderPermissionFamily._()
    : super(
        retry: null,
        name: r'checkFolderPermissionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CheckFolderPermissionProvider call(StorageLocation location) =>
      CheckFolderPermissionProvider._(argument: location, from: this);

  @override
  String toString() => r'checkFolderPermissionProvider';
}
