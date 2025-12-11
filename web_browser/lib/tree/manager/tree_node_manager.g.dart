// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_node_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TreeNodeManager)
const treeNodeManagerProvider = TreeNodeManagerFamily._();

final class TreeNodeManagerProvider
    extends $NotifierProvider<TreeNodeManager, TreeNode> {
  const TreeNodeManagerProvider._({
    required TreeNodeManagerFamily super.from,
    required NodePath super.argument,
  }) : super(
         retry: null,
         name: r'treeNodeManagerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$treeNodeManagerHash();

  @override
  String toString() {
    return r'treeNodeManagerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TreeNodeManager create() => TreeNodeManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TreeNode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TreeNode>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TreeNodeManagerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$treeNodeManagerHash() => r'22ddff47a81079cfc77dd23aa17d9880ef2a1422';

final class TreeNodeManagerFamily extends $Family
    with
        $ClassFamilyOverride<
          TreeNodeManager,
          TreeNode,
          TreeNode,
          TreeNode,
          NodePath
        > {
  const TreeNodeManagerFamily._()
    : super(
        retry: null,
        name: r'treeNodeManagerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TreeNodeManagerProvider call(NodePath path) =>
      TreeNodeManagerProvider._(argument: path, from: this);

  @override
  String toString() => r'treeNodeManagerProvider';
}

abstract class _$TreeNodeManager extends $Notifier<TreeNode> {
  late final _$args = ref.$arg as NodePath;
  NodePath get path => _$args;

  TreeNode build(NodePath path);
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
