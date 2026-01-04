// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(apiClient)
final apiClientProvider = ApiClientFamily._();

final class ApiClientProvider
    extends $FunctionalProvider<ApiClient, ApiClient, ApiClient>
    with $Provider<ApiClient> {
  ApiClientProvider._({
    required ApiClientFamily super.from,
    required User super.argument,
  }) : super(
         retry: null,
         name: r'apiClientProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$apiClientHash();

  @override
  String toString() {
    return r'apiClientProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ApiClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiClient create(Ref ref) {
    final argument = this.argument as User;
    return apiClient(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiClient>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ApiClientProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$apiClientHash() => r'4b39ad64c15792e3494cf2c6984424be448ae90b';

final class ApiClientFamily extends $Family
    with $FunctionalFamilyOverride<ApiClient, User> {
  ApiClientFamily._()
    : super(
        retry: null,
        name: r'apiClientProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ApiClientProvider call(User user) =>
      ApiClientProvider._(argument: user, from: this);

  @override
  String toString() => r'apiClientProvider';
}

@ProviderFor(authApi)
final authApiProvider = AuthApiFamily._();

final class AuthApiProvider
    extends $FunctionalProvider<AuthApi, AuthApi, AuthApi>
    with $Provider<AuthApi> {
  AuthApiProvider._({
    required AuthApiFamily super.from,
    required Uri super.argument,
  }) : super(
         retry: null,
         name: r'authApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$authApiHash();

  @override
  String toString() {
    return r'authApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AuthApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthApi create(Ref ref) {
    final argument = this.argument as Uri;
    return authApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthApi>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AuthApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$authApiHash() => r'8a73dbe516419bfb7de51787cb6c1c732c5b465d';

final class AuthApiFamily extends $Family
    with $FunctionalFamilyOverride<AuthApi, Uri> {
  AuthApiFamily._()
    : super(
        retry: null,
        name: r'authApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AuthApiProvider call(Uri baseUrl) =>
      AuthApiProvider._(argument: baseUrl, from: this);

  @override
  String toString() => r'authApiProvider';
}

@ProviderFor(serverApi)
final serverApiProvider = ServerApiFamily._();

final class ServerApiProvider
    extends $FunctionalProvider<ServerApi, ServerApi, ServerApi>
    with $Provider<ServerApi> {
  ServerApiProvider._({
    required ServerApiFamily super.from,
    required User super.argument,
  }) : super(
         retry: null,
         name: r'serverApiProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$serverApiHash();

  @override
  String toString() {
    return r'serverApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ServerApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ServerApi create(Ref ref) {
    final argument = this.argument as User;
    return serverApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ServerApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ServerApi>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ServerApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$serverApiHash() => r'e24d5c40d6ce240fdaf91cd211acf38a43703287';

final class ServerApiFamily extends $Family
    with $FunctionalFamilyOverride<ServerApi, User> {
  ServerApiFamily._()
    : super(
        retry: null,
        name: r'serverApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ServerApiProvider call(User user) =>
      ServerApiProvider._(argument: user, from: this);

  @override
  String toString() => r'serverApiProvider';
}

@ProviderFor(libraryApi)
final libraryApiProvider = LibraryApiFamily._();

final class LibraryApiProvider
    extends $FunctionalProvider<LibraryApi, LibraryApi, LibraryApi>
    with $Provider<LibraryApi> {
  LibraryApiProvider._({
    required LibraryApiFamily super.from,
    required User super.argument,
  }) : super(
         retry: null,
         name: r'libraryApiProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$libraryApiHash();

  @override
  String toString() {
    return r'libraryApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<LibraryApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LibraryApi create(Ref ref) {
    final argument = this.argument as User;
    return libraryApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LibraryApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LibraryApi>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LibraryApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$libraryApiHash() => r'788dc29edaee27afbda7cbf60d9c0c50375d6eb4';

final class LibraryApiFamily extends $Family
    with $FunctionalFamilyOverride<LibraryApi, User> {
  LibraryApiFamily._()
    : super(
        retry: null,
        name: r'libraryApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  LibraryApiProvider call(User user) =>
      LibraryApiProvider._(argument: user, from: this);

  @override
  String toString() => r'libraryApiProvider';
}

@ProviderFor(itemApi)
final itemApiProvider = ItemApiFamily._();

final class ItemApiProvider
    extends $FunctionalProvider<ItemApi, ItemApi, ItemApi>
    with $Provider<ItemApi> {
  ItemApiProvider._({
    required ItemApiFamily super.from,
    required User super.argument,
  }) : super(
         retry: null,
         name: r'itemApiProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$itemApiHash();

  @override
  String toString() {
    return r'itemApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ItemApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ItemApi create(Ref ref) {
    final argument = this.argument as User;
    return itemApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ItemApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ItemApi>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ItemApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$itemApiHash() => r'3cb2a516a26ec3c3ded3d7542862f41837348668';

final class ItemApiFamily extends $Family
    with $FunctionalFamilyOverride<ItemApi, User> {
  ItemApiFamily._()
    : super(
        retry: null,
        name: r'itemApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ItemApiProvider call(User user) =>
      ItemApiProvider._(argument: user, from: this);

  @override
  String toString() => r'itemApiProvider';
}
