// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_aware_node_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(treeAwareNodeRepository)
const treeAwareNodeRepositoryProvider = TreeAwareNodeRepositoryProvider._();

final class TreeAwareNodeRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<TreeAwareNodeRepository>,
          TreeAwareNodeRepository,
          FutureOr<TreeAwareNodeRepository>
        >
    with
        $FutureModifier<TreeAwareNodeRepository>,
        $FutureProvider<TreeAwareNodeRepository> {
  const TreeAwareNodeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'treeAwareNodeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$treeAwareNodeRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<TreeAwareNodeRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TreeAwareNodeRepository> create(Ref ref) {
    return treeAwareNodeRepository(ref);
  }
}

String _$treeAwareNodeRepositoryHash() =>
    r'25e972f3e5c20058353cb8a9726c846cdffb3e55';
