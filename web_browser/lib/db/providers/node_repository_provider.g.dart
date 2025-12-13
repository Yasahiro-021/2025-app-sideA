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

@ProviderFor(nodeRepositoryProvider)
const nodeRepositoryProviderProvider = NodeRepositoryProviderProvider._();

/// NodeRepositoryをProviderとして提供
///
/// ノードの保存・取得・更新・削除などの操作に使用

final class NodeRepositoryProviderProvider
    extends $FunctionalProvider<NodeRepository, NodeRepository, NodeRepository>
    with $Provider<NodeRepository> {
  /// NodeRepositoryをProviderとして提供
  ///
  /// ノードの保存・取得・更新・削除などの操作に使用
  const NodeRepositoryProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nodeRepositoryProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nodeRepositoryProviderHash();

  @$internal
  @override
  $ProviderElement<NodeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NodeRepository create(Ref ref) {
    return nodeRepositoryProvider(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NodeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NodeRepository>(value),
    );
  }
}

String _$nodeRepositoryProviderHash() =>
    r'f8d51e973772bf7ae5575285ac8df9362ff2e392';
