// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_aware_node_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 現在選択されているツリーに基づいてノードを操作するリポジトリ
///
/// CurrentTreeNotifierが示すtreeIdを自動的に使用し、
/// 既存のコードがツリーIDを意識せずにノード操作できるようにする

@ProviderFor(TreeAwareNodeRepository)
const treeAwareNodeRepositoryProvider = TreeAwareNodeRepositoryProvider._();

/// 現在選択されているツリーに基づいてノードを操作するリポジトリ
///
/// CurrentTreeNotifierが示すtreeIdを自動的に使用し、
/// 既存のコードがツリーIDを意識せずにノード操作できるようにする
final class TreeAwareNodeRepositoryProvider
    extends $NotifierProvider<TreeAwareNodeRepository, NodeRepository> {
  /// 現在選択されているツリーに基づいてノードを操作するリポジトリ
  ///
  /// CurrentTreeNotifierが示すtreeIdを自動的に使用し、
  /// 既存のコードがツリーIDを意識せずにノード操作できるようにする
  const TreeAwareNodeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'treeAwareNodeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$treeAwareNodeRepositoryHash();

  @$internal
  @override
  TreeAwareNodeRepository create() => TreeAwareNodeRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NodeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NodeRepository>(value),
    );
  }
}

String _$treeAwareNodeRepositoryHash() =>
    r'29d99ec7268908beb0aa0276d3fec92836c52df3';

/// 現在選択されているツリーに基づいてノードを操作するリポジトリ
///
/// CurrentTreeNotifierが示すtreeIdを自動的に使用し、
/// 既存のコードがツリーIDを意識せずにノード操作できるようにする

abstract class _$TreeAwareNodeRepository extends $Notifier<NodeRepository> {
  NodeRepository build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<NodeRepository, NodeRepository>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NodeRepository, NodeRepository>,
              NodeRepository,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
