// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_path_to_node_function.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// NodeWithPathからNodeへの変換関数を提供する。

@ProviderFor(nodeWithPathToNode)
const nodeWithPathToNodeProvider = NodeWithPathToNodeProvider._();

/// NodeWithPathからNodeへの変換関数を提供する。

final class NodeWithPathToNodeProvider
    extends
        $FunctionalProvider<
          Node Function(NodePath),
          Node Function(NodePath),
          Node Function(NodePath)
        >
    with $Provider<Node Function(NodePath)> {
  /// NodeWithPathからNodeへの変換関数を提供する。
  const NodeWithPathToNodeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nodeWithPathToNodeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nodeWithPathToNodeHash();

  @$internal
  @override
  $ProviderElement<Node Function(NodePath)> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Node Function(NodePath) create(Ref ref) {
    return nodeWithPathToNode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Node Function(NodePath) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Node Function(NodePath)>(value),
    );
  }
}

String _$nodeWithPathToNodeHash() =>
    r'dea5af4a2c9d212b0b24594ef85fc991178cfe90';
