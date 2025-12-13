// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_coordinate_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Group内の個別ノードの座標を計算して提供するマネージャー
///
/// GroupCoordinateとグループ内でのノードのインデックスから、
/// 個別ノードの画面上の座標を計算します。

@ProviderFor(nodeCoordinate)
const nodeCoordinateProvider = NodeCoordinateFamily._();

/// Group内の個別ノードの座標を計算して提供するマネージャー
///
/// GroupCoordinateとグループ内でのノードのインデックスから、
/// 個別ノードの画面上の座標を計算します。

final class NodeCoordinateProvider
    extends $FunctionalProvider<NodeCoordinate, NodeCoordinate, NodeCoordinate>
    with $Provider<NodeCoordinate> {
  /// Group内の個別ノードの座標を計算して提供するマネージャー
  ///
  /// GroupCoordinateとグループ内でのノードのインデックスから、
  /// 個別ノードの画面上の座標を計算します。
  const NodeCoordinateProvider._({
    required NodeCoordinateFamily super.from,
    required NodePath super.argument,
  }) : super(
         retry: null,
         name: r'nodeCoordinateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$nodeCoordinateHash();

  @override
  String toString() {
    return r'nodeCoordinateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<NodeCoordinate> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NodeCoordinate create(Ref ref) {
    final argument = this.argument as NodePath;
    return nodeCoordinate(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NodeCoordinate value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NodeCoordinate>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NodeCoordinateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$nodeCoordinateHash() => r'2539bc02c0f6160319770c51ba96109c1207f279';

/// Group内の個別ノードの座標を計算して提供するマネージャー
///
/// GroupCoordinateとグループ内でのノードのインデックスから、
/// 個別ノードの画面上の座標を計算します。

final class NodeCoordinateFamily extends $Family
    with $FunctionalFamilyOverride<NodeCoordinate, NodePath> {
  const NodeCoordinateFamily._()
    : super(
        retry: null,
        name: r'nodeCoordinateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Group内の個別ノードの座標を計算して提供するマネージャー
  ///
  /// GroupCoordinateとグループ内でのノードのインデックスから、
  /// 個別ノードの画面上の座標を計算します。

  NodeCoordinateProvider call(NodePath nodePath) =>
      NodeCoordinateProvider._(argument: nodePath, from: this);

  @override
  String toString() => r'nodeCoordinateProvider';
}
