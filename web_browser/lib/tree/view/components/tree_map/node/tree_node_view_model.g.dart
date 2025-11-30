// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_node_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TreeNodeViewModel)
const treeNodeViewModelProvider = TreeNodeViewModelFamily._();

final class TreeNodeViewModelProvider
    extends $NotifierProvider<TreeNodeViewModel, TreeNode> {
  const TreeNodeViewModelProvider._({
    required TreeNodeViewModelFamily super.from,
    required NodePath super.argument,
  }) : super(
         retry: null,
         name: r'treeNodeViewModelProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$treeNodeViewModelHash();

  @override
  String toString() {
    return r'treeNodeViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TreeNodeViewModel create() => TreeNodeViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TreeNode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TreeNode>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TreeNodeViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$treeNodeViewModelHash() => r'a458f81a40a6a2345ad13a7536f2ea591cee34f5';

final class TreeNodeViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          TreeNodeViewModel,
          TreeNode,
          TreeNode,
          TreeNode,
          NodePath
        > {
  const TreeNodeViewModelFamily._()
    : super(
        retry: null,
        name: r'treeNodeViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  TreeNodeViewModelProvider call(NodePath nodePath) =>
      TreeNodeViewModelProvider._(argument: nodePath, from: this);

  @override
  String toString() => r'treeNodeViewModelProvider';
}

abstract class _$TreeNodeViewModel extends $Notifier<TreeNode> {
  late final _$args = ref.$arg as NodePath;
  NodePath get nodePath => _$args;

  TreeNode build(NodePath nodePath);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<TreeNode, TreeNode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TreeNode, TreeNode>,
              TreeNode,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
