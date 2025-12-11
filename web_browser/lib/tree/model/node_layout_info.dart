import 'package:web_browser/core/node/node_path.dart';

/// Reingold-Tilfordアルゴリズムで使用する内部データ構造
/// ツリーレイアウト計算中の一時的な情報を保持
class NodeLayoutInfo {
  final NodePath path;
  
  /// 相対的なX座標（親ノードを基準とした位置）
  double relativeX;
  
  /// 最終的なX座標
  double finalX;
  
  /// Y座標（深さに基づく）
  double finalY;
  
  /// このノードの修正値（Modifier）- 子孫の位置調整用
  double modifier;
  
  /// 左側の輪郭を追跡するための前のノード
  NodeLayoutInfo? leftThread;
  
  /// 右側の輪郭を追跡するための前のノード
  NodeLayoutInfo? rightThread;
  
  /// 祖先ノードへの参照（輪郭の競合解決用）
  NodeLayoutInfo? ancestor;
  
  /// 子ノードのリスト
  List<NodeLayoutInfo> children;
  
  /// 親ノードへの参照
  NodeLayoutInfo? parent;
  
  /// 兄弟内での位置（0始まり）
  int siblingIndex;

  /// このノードの幅（NodeGroupの幅）
  double nodeWidth;

  NodeLayoutInfo({
    required this.path,
    this.relativeX = 0.0,
    this.finalX = 0.0,
    this.finalY = 0.0,
    this.modifier = 0.0,
    this.leftThread,
    this.rightThread,
    this.ancestor,
    this.children = const [],
    this.parent,
    this.siblingIndex = 0,
    this.nodeWidth = 1.0, // デフォルトは1.0
  }) {
    ancestor = this; // 初期状態では自分自身を祖先として設定
  }

  /// 左端の子ノードを取得
  NodeLayoutInfo? get leftMostChild => children.isEmpty ? null : children.first;
  
  /// 右端の子ノードを取得
  NodeLayoutInfo? get rightMostChild => children.isEmpty ? null : children.last;
  
  /// 左の兄弟ノードを取得
  NodeLayoutInfo? get leftSibling {
    if (parent == null || siblingIndex == 0) return null;
    return parent!.children[siblingIndex - 1];
  }
  
  /// 右の兄弟ノードを取得
  NodeLayoutInfo? get rightSibling {
    if (parent == null || siblingIndex >= parent!.children.length - 1) return null;
    return parent!.children[siblingIndex + 1];
  }

  /// 葉ノード（子を持たない）かどうか
  bool get isLeaf => children.isEmpty;
}
