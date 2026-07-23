// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmarks_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bookmarks)
final bookmarksProvider = BookmarksFamily._();

final class BookmarksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Bookmark>>,
          List<Bookmark>,
          FutureOr<List<Bookmark>>
        >
    with $FutureModifier<List<Bookmark>>, $FutureProvider<List<Bookmark>> {
  BookmarksProvider._({
    required BookmarksFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bookmarksProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookmarksHash();

  @override
  String toString() {
    return r'bookmarksProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Bookmark>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Bookmark>> create(Ref ref) {
    final argument = this.argument as String;
    return bookmarks(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BookmarksProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookmarksHash() => r'db56fc310c6f94e3929694692936269f63ec917a';

final class BookmarksFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Bookmark>>, String> {
  BookmarksFamily._()
    : super(
        retry: null,
        name: r'bookmarksProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BookmarksProvider call(String itemId) =>
      BookmarksProvider._(argument: itemId, from: this);

  @override
  String toString() => r'bookmarksProvider';
}

@ProviderFor(BookmarksController)
final bookmarksControllerProvider = BookmarksControllerFamily._();

final class BookmarksControllerProvider
    extends $NotifierProvider<BookmarksController, void> {
  BookmarksControllerProvider._({
    required BookmarksControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bookmarksControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookmarksControllerHash();

  @override
  String toString() {
    return r'bookmarksControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BookmarksController create() => BookmarksController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BookmarksControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookmarksControllerHash() =>
    r'b4384744b5de11734d4ea7f2fc54d5b890e1738d';

final class BookmarksControllerFamily extends $Family
    with $ClassFamilyOverride<BookmarksController, void, void, void, String> {
  BookmarksControllerFamily._()
    : super(
        retry: null,
        name: r'bookmarksControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BookmarksControllerProvider call(String itemId) =>
      BookmarksControllerProvider._(argument: itemId, from: this);

  @override
  String toString() => r'bookmarksControllerProvider';
}

abstract class _$BookmarksController extends $Notifier<void> {
  late final _$args = ref.$arg as String;
  String get itemId => _$args;

  void build(String itemId);
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
    element.handleCreate(ref, () => build(_$args));
  }
}
