// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// NodeRepositoryをProviderとして提供
///
/// ノードの保存・取得・更新・削除などの操作に使用

@ProviderFor(nodeRepository)
const nodeRepositoryProvider = NodeRepositoryProvider._();

/// NodeRepositoryをProviderとして提供
///
/// ノードの保存・取得・更新・削除などの操作に使用

final class NodeRepositoryProvider
    extends $FunctionalProvider<NodeRepository, NodeRepository, NodeRepository>
    with $Provider<NodeRepository> {
  /// NodeRepositoryをProviderとして提供
  ///
  /// ノードの保存・取得・更新・削除などの操作に使用
  const NodeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nodeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nodeRepositoryHash();

  @$internal
  @override
  $ProviderElement<NodeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NodeRepository create(Ref ref) {
    return nodeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NodeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NodeRepository>(value),
    );
  }
}

String _$nodeRepositoryHash() => r'7fac83467bcf3f2ecfef9994c09673cee601b3a4';
