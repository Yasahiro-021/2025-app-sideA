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

@ProviderFor(treeRepositoryProvider)
const treeRepositoryProviderProvider = TreeRepositoryProviderProvider._();

/// TreeRepositoryをProviderとして提供
///
/// ツリーの作成・取得・更新・削除などの操作に使用

final class TreeRepositoryProviderProvider
    extends $FunctionalProvider<TreeRepository, TreeRepository, TreeRepository>
    with $Provider<TreeRepository> {
  /// TreeRepositoryをProviderとして提供
  ///
  /// ツリーの作成・取得・更新・削除などの操作に使用
  const TreeRepositoryProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'treeRepositoryProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$treeRepositoryProviderHash();

  @$internal
  @override
  $ProviderElement<TreeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TreeRepository create(Ref ref) {
    return treeRepositoryProvider(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TreeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TreeRepository>(value),
    );
  }
}

String _$treeRepositoryProviderHash() =>
    r'85f0495dfd0ff0aa6b546e518a2238eaacecf36b';
