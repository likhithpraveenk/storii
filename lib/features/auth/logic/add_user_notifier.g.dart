// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_user_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddUserNotifier)
final addUserProvider = AddUserNotifierProvider._();

final class AddUserNotifierProvider
    extends $NotifierProvider<AddUserNotifier, UserState> {
  AddUserNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addUserNotifierHash();

  @$internal
  @override
  AddUserNotifier create() => AddUserNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserState>(value),
    );
  }
}

String _$addUserNotifierHash() => r'6fc60b46ebc0014ac83564fa8145915d89c3a9f8';

abstract class _$AddUserNotifier extends $Notifier<UserState> {
  UserState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UserState, UserState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserState, UserState>,
              UserState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
