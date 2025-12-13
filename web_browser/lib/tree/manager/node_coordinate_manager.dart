import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/manager/tree_layout_manager.dart';
import 'package:web_browser/tree/model/node_coordinate.dart';

part 'node_coordinate_manager.g.dart';

/// Group内の個別ノードの座標を計算して提供するマネージャー
/// 
/// GroupCoordinateとグループ内でのノードのインデックスから、
/// 個別ノードの画面上の座標を計算します。
@riverpod
NodeCoordinate nodeCoordinate(Ref ref, NodePath nodePath) {
  // ノードが属するグループ（親のパス）を取得
  final parentPath = nodePath.parentPath;
  
  // ルートノードの場合は特別処理
  if (parentPath == null) {
    // ルートノードは画面上部中央に配置
    // TODO: 実際の配置位置はTreeMapから取得すべき
    return const NodeCoordinate(x: 0, y: 50);
  }
  
  // 親グループの座標を取得
  final groupCoord = ref.watch(groupCoordinateProvider(parentPath));
  
  // このノードが親の子リスト内で何番目かを取得
  final nodeIndex = nodePath.path.last;
  
  // グループ内でのノードの位置を計算
  // NodeGroupViewのレイアウト定数と合わせる
  const nodeSpacingScale = 100.0; // TreeMap.nodeSpacingScale
  const levelHeightScale = 150.0; // TreeMap.levelHeightScale
  const margin = 100.0;
  const cardPadding = 12.0;
  const headerHeight = 40.0;
  const nodeSize = 36.0;
  const nodeSpacing = 8.0;
  
  // グループの画面座標を計算（TreeMapと同じ計算）
  // offsetXは0と仮定（実際にはTreeMapから取得すべき）
  final groupScreenX = groupCoord.x * nodeSpacingScale + margin;
  final groupScreenY = groupCoord.y * levelHeightScale + margin;
  
  // グループカード内でのノードの位置を計算
  // ノードは横並び（Wrap）で配置されている
  final nodeX = groupScreenX + cardPadding + (nodeSize / 2) + 
                (nodeIndex * (nodeSize + nodeSpacing));
  final nodeY = groupScreenY + headerHeight + cardPadding + (nodeSize / 2);
  
  return NodeCoordinate(x: nodeX, y: nodeY);
}
