// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// TreeRepositoryをProviderとして提供
///
/// ツリーの作成・取得・更新・削除などの操作に使用

@ProviderFor(treeRepository)
const treeRepositoryProvider = TreeRepositoryProvider._();

/// TreeRepositoryをProviderとして提供
///
/// ツリーの作成・取得・更新・削除などの操作に使用

final class TreeRepositoryProvider
    extends $FunctionalProvider<TreeRepository, TreeRepository, TreeRepository>
    with $Provider<TreeRepository> {
  /// TreeRepositoryをProviderとして提供
  ///
  /// ツリーの作成・取得・更新・削除などの操作に使用
  const TreeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'treeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$treeRepositoryHash();

  @$internal
  @override
  $ProviderElement<TreeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TreeRepository create(Ref ref) {
    return treeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TreeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TreeRepository>(value),
    );
  }
}

String _$treeRepositoryHash() => r'0d3e3891fc2fe0fe656b6c77e628098f4975f332';
