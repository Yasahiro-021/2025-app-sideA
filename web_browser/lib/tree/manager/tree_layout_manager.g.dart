// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_layout_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Reingold-Tilfordアルゴリズムを使用してツリーレイアウトを計算するマネージャー
///
/// このアルゴリズムは以下の美的基準を満たすツリーレイアウトを生成します：
/// 1. 同じ深さのノードは同じY座標に配置される
/// 2. 親ノードは子ノードの中央に配置される
/// 3. サブツリーは可能な限りコンパクトに配置される
/// 4. ノード同士が重ならない

@ProviderFor(TreeLayoutManager)
const treeLayoutManagerProvider = TreeLayoutManagerProvider._();

/// Reingold-Tilfordアルゴリズムを使用してツリーレイアウトを計算するマネージャー
///
/// このアルゴリズムは以下の美的基準を満たすツリーレイアウトを生成します：
/// 1. 同じ深さのノードは同じY座標に配置される
/// 2. 親ノードは子ノードの中央に配置される
/// 3. サブツリーは可能な限りコンパクトに配置される
/// 4. ノード同士が重ならない
final class TreeLayoutManagerProvider
    extends
        $NotifierProvider<TreeLayoutManager, Map<NodePath, GroupCoordinate>> {
  /// Reingold-Tilfordアルゴリズムを使用してツリーレイアウトを計算するマネージャー
  ///
  /// このアルゴリズムは以下の美的基準を満たすツリーレイアウトを生成します：
  /// 1. 同じ深さのノードは同じY座標に配置される
  /// 2. 親ノードは子ノードの中央に配置される
  /// 3. サブツリーは可能な限りコンパクトに配置される
  /// 4. ノード同士が重ならない
  const TreeLayoutManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'treeLayoutManagerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$treeLayoutManagerHash();

  @$internal
  @override
  TreeLayoutManager create() => TreeLayoutManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<NodePath, GroupCoordinate> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<NodePath, GroupCoordinate>>(
        value,
      ),
    );
  }
}

String _$treeLayoutManagerHash() => r'9fcaa3cf0b1475749cdd1e09c71709310a1c97d6';

/// Reingold-Tilfordアルゴリズムを使用してツリーレイアウトを計算するマネージャー
///
/// このアルゴリズムは以下の美的基準を満たすツリーレイアウトを生成します：
/// 1. 同じ深さのノードは同じY座標に配置される
/// 2. 親ノードは子ノードの中央に配置される
/// 3. サブツリーは可能な限りコンパクトに配置される
/// 4. ノード同士が重ならない

abstract class _$TreeLayoutManager
    extends $Notifier<Map<NodePath, GroupCoordinate>> {
  Map<NodePath, GroupCoordinate> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Map<NodePath, GroupCoordinate>,
              Map<NodePath, GroupCoordinate>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Map<NodePath, GroupCoordinate>,
                Map<NodePath, GroupCoordinate>
              >,
              Map<NodePath, GroupCoordinate>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// 特定のグループの座標を取得するプロバイダー

@ProviderFor(groupCoordinate)
const groupCoordinateProvider = GroupCoordinateFamily._();

/// 特定のグループの座標を取得するプロバイダー

final class GroupCoordinateProvider
    extends
        $FunctionalProvider<GroupCoordinate, GroupCoordinate, GroupCoordinate>
    with $Provider<GroupCoordinate> {
  /// 特定のグループの座標を取得するプロバイダー
  const GroupCoordinateProvider._({
    required GroupCoordinateFamily super.from,
    required NodePath super.argument,
  }) : super(
         retry: null,
         name: r'groupCoordinateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$groupCoordinateHash();

  @override
  String toString() {
    return r'groupCoordinateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<GroupCoordinate> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GroupCoordinate create(Ref ref) {
    final argument = this.argument as NodePath;
    return groupCoordinate(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GroupCoordinate value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GroupCoordinate>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GroupCoordinateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$groupCoordinateHash() => r'837a9b9427f9963dde1df6594b0acf0482512293';

/// 特定のグループの座標を取得するプロバイダー

final class GroupCoordinateFamily extends $Family
    with $FunctionalFamilyOverride<GroupCoordinate, NodePath> {
  const GroupCoordinateFamily._()
    : super(
        retry: null,
        name: r'groupCoordinateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 特定のグループの座標を取得するプロバイダー

  GroupCoordinateProvider call(NodePath path) =>
      GroupCoordinateProvider._(argument: path, from: this);

  @override
  String toString() => r'groupCoordinateProvider';
}
