import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/tree/manager/group_manager.dart';
import 'package:web_browser/tree/model/group_coordinate.dart';
import 'package:web_browser/tree/model/node_layout_info.dart';

part 'tree_layout_manager.g.dart';

/// Reingold-Tilfordアルゴリズムを使用してツリーレイアウトを計算するマネージャー
/// 
/// このアルゴリズムは以下の美的基準を満たすツリーレイアウトを生成します：
/// 1. 同じ深さのノードは同じY座標に配置される
/// 2. 親ノードは子ノードの中央に配置される
/// 3. サブツリーは可能な限りコンパクトに配置される
/// 4. ノード同士が重ならない
@riverpod
class TreeLayoutManager extends _$TreeLayoutManager {
  /// ノード間の最小水平距離
  static const double minNodeSpacing = 1.0;
  
  /// レベル間（親子間）の垂直距離
  static const double levelHeight = 1.0;

  @override
  Map<NodePath, GroupCoordinate> build() {
    return _computeLayout();
  }

  /// ツリー全体のレイアウトを計算
  Map<NodePath, GroupCoordinate> _computeLayout() {
    final rootPath = NodePath.root;
    final rootInfo = _buildTree(rootPath, 0, null, 0);
    
    // 第1パス: 相対座標の計算
    _firstWalk(rootInfo);
    
    // 第2パス: 絶対座標の計算
    _secondWalk(rootInfo, -rootInfo.relativeX, 0);
    
    // NodeLayoutInfoからNodeCoordinateに変換
    return _extractCoordinates(rootInfo);
  }

  /// ツリー構造を再帰的に構築
  NodeLayoutInfo _buildTree(
    NodePath path,
    int depth,
    NodeLayoutInfo? parent,
    int siblingIndex,
  ) {
    final children = ref.watch(childrenAtPathMangerProvider(path)).children;
    
    // GroupManagerからノードの幅を取得
    final group = ref.watch(groupManagerProvider(path));
    final nodeWidth = group.width.toDouble();
    
    final layoutInfo = NodeLayoutInfo(
      path: path,
      parent: parent,
      siblingIndex: siblingIndex,
      finalY: depth * levelHeight,
      nodeWidth: nodeWidth,
    );

    // 子ノードを再帰的に構築
    final childNodes = <NodeLayoutInfo>[];
    for (int i = 0; i < children.length; i++) {
      final childInfo = _buildTree(children[i], depth + 1, layoutInfo, i);
      childNodes.add(childInfo);
    }
    
    layoutInfo.children = childNodes;
    return layoutInfo;
  }

  /// 第1パス: 各ノードの相対座標とModifierを計算
  void _firstWalk(NodeLayoutInfo node) {
    if (node.isLeaf) {
      // 葉ノードの場合
      final leftSibling = node.leftSibling;
      if (leftSibling != null) {
        // 左の兄弟の右端 + 最小間隔 + 自分の幅の半分
        node.relativeX = leftSibling.relativeX + 
                         (leftSibling.nodeWidth / 2) + 
                         minNodeSpacing + 
                         (node.nodeWidth / 2);
      } else {
        // 最初の子は自分の幅の半分の位置（中心が原点）
        node.relativeX = node.nodeWidth / 2;
      }
    } else {
      // 内部ノード（子を持つノード）の場合
      
      // すべての子を再帰的に処理
      for (final child in node.children) {
        _firstWalk(child);
      }

      // 子ノードを中央揃えにする
      final leftMost = node.children.first;
      final rightMost = node.children.last;
      final mid = (leftMost.relativeX + rightMost.relativeX) / 2.0;

      final leftSibling = node.leftSibling;
      if (leftSibling != null) {
        // 左の兄弟の右端 + 最小間隔 + 自分の幅の半分
        node.relativeX = leftSibling.relativeX + 
                         (leftSibling.nodeWidth / 2) + 
                         minNodeSpacing + 
                         (node.nodeWidth / 2);
        node.modifier = node.relativeX - mid;
        _apportion(node);
      } else {
        node.relativeX = mid;
      }
    }
  }

  /// サブツリー間の競合を解決
  void _apportion(NodeLayoutInfo node) {
    final leftSibling = node.leftSibling;
    if (leftSibling == null) return;

    NodeLayoutInfo? innerRight = node.leftMostChild;
    NodeLayoutInfo? outerRight = node;
    NodeLayoutInfo? innerLeft = leftSibling.rightMostChild;
    NodeLayoutInfo? outerLeft = node.parent?.children.first;

    double shiftInnerRight = innerRight?.modifier ?? 0.0;
    double shiftOuterRight = outerRight.modifier;
    double shiftInnerLeft = innerLeft?.modifier ?? 0.0;
    double shiftOuterLeft = outerLeft?.modifier ?? 0.0;

    while (innerLeft != null && innerRight != null) {
      innerLeft = _nextRight(innerLeft);
      innerRight = _nextLeft(innerRight);
      outerLeft = _nextLeft(outerLeft);
      outerRight = _nextRight(outerRight);

      if (outerRight != null) {
        outerRight.ancestor = node;
      }

      if (innerLeft != null && innerRight != null) {
        // ノードの幅を考慮した間隔計算
        // 左側のサブツリーの右端 + 右側のサブツリーの左端の間隔を計算
        final shift = (innerLeft.relativeX + shiftInnerLeft + innerLeft.nodeWidth / 2) -
            (innerRight.relativeX + shiftInnerRight - innerRight.nodeWidth / 2) +
            minNodeSpacing;

        if (shift > 0) {
          final ancestor = _getAncestor(innerLeft, node);
          _moveSubtree(ancestor, node, shift);
          shiftInnerRight += shift;
          shiftOuterRight += shift;
        }

        shiftInnerRight += innerRight.modifier;
        shiftOuterRight += outerRight?.modifier ?? 0.0;
        shiftInnerLeft += innerLeft.modifier;
        shiftOuterLeft += outerLeft?.modifier ?? 0.0;
      }
    }

    if (innerLeft != null && _nextRight(outerRight) == null) {
      outerRight?.rightThread = innerLeft;
      if (outerRight != null) {
        outerRight.modifier += shiftInnerLeft - shiftOuterRight;
      }
    }

    if (innerRight != null && _nextLeft(outerLeft) == null) {
      outerLeft?.leftThread = innerRight;
      if (outerLeft != null) {
        outerLeft.modifier += shiftInnerRight - shiftOuterLeft;
      }
    }
  }

  /// サブツリーを移動
  void _moveSubtree(NodeLayoutInfo wl, NodeLayoutInfo wr, double shift) {
    // wlは使用されるが、Reingold-Tilfordの本来のアルゴリズムでは
    // シフト量の按分に使用される。現在は単純なシフトのみ実装
    wr.relativeX += shift;
    wr.modifier += shift;
  }

  /// 共通の祖先を取得
  NodeLayoutInfo _getAncestor(NodeLayoutInfo vil, NodeLayoutInfo node) {
    if (vil.ancestor?.parent == node.parent) {
      return vil.ancestor!;
    }
    return node.parent?.children.first ?? node;
  }

  /// 左側の輪郭を辿る次のノードを取得
  NodeLayoutInfo? _nextLeft(NodeLayoutInfo? node) {
    if (node == null) return null;
    return node.children.isNotEmpty ? node.children.first : node.leftThread;
  }

  /// 右側の輪郭を辿る次のノードを取得
  NodeLayoutInfo? _nextRight(NodeLayoutInfo? node) {
    if (node == null) return null;
    return node.children.isNotEmpty ? node.children.last : node.rightThread;
  }

  /// 第2パス: 絶対座標を計算
  void _secondWalk(NodeLayoutInfo node, double modifierSum, double depth) {
    node.finalX = node.relativeX + modifierSum;
    node.finalY = depth;

    for (final child in node.children) {
      _secondWalk(child, modifierSum + node.modifier, depth + levelHeight);
    }
  }

  /// NodeLayoutInfoから座標マップを抽出
  Map<NodePath, GroupCoordinate> _extractCoordinates(NodeLayoutInfo root) {
    final result = <NodePath, GroupCoordinate>{};
    
    void traverse(NodeLayoutInfo node) {
      result[node.path] = GroupCoordinate(
        x: node.finalX,
        y: node.finalY,
      );
      
      for (final child in node.children) {
        traverse(child);
      }
    }
    
    traverse(root);
    return result;
  }
}

/// 特定のグループの座標を取得するプロバイダー
@riverpod
GroupCoordinate groupCoordinate(Ref ref, NodePath path) {
  final layoutMap = ref.watch(treeLayoutManagerProvider);
  return layoutMap[path] ?? const GroupCoordinate(x: 0, y: 0);
}
