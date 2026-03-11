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

String _$addUserNotifierHash() => r'26f0e183c5f5c79d4385d8eb2869a991d8716d07';

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
