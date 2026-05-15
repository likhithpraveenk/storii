// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserSessionController)
final userSessionControllerProvider = UserSessionControllerProvider._();

final class UserSessionControllerProvider
    extends $NotifierProvider<UserSessionController, UsesSessionState> {
  UserSessionControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userSessionControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userSessionControllerHash();

  @$internal
  @override
  UserSessionController create() => UserSessionController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UsesSessionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UsesSessionState>(value),
    );
  }
}

String _$userSessionControllerHash() =>
    r'381573468479f945953c6d27cd8a02cf9c49cecc';

abstract class _$UserSessionController extends $Notifier<UsesSessionState> {
  UsesSessionState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UsesSessionState, UsesSessionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UsesSessionState, UsesSessionState>,
              UsesSessionState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
