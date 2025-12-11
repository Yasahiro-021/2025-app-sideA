import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/tree/manager/tree_layout_manager.dart';
import 'package:web_browser/tree/model/group_coordinate.dart';
import 'package:web_browser/tree/view/components/tree_map/group/node_group_view.dart';
import 'package:web_browser/tree/view/components/tree_map/node/simple_node_view.dart';
import 'package:web_browser/tree/view/components/tree_map/tree_map/tree_connection_painter.dart';

/// TreeLayoutManagerを使用してツリー構造を描画するウィジェット
class TreeMap extends ConsumerWidget {
  const TreeMap({super.key});

  // ノード間の表示スケール（ピクセル単位）
  static const double nodeSpacingScale = 100.0;
  static const double levelHeightScale = 150.0;

  // 定数: マージン
  static const double margin = 100.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // ルートノードから全ての子ノードパスを取得
    final rootPath = NodePath(path: []);
    final allPaths = _collectAllPaths(ref, rootPath);
    
    // 子を持つパスのみをフィルタリング（空グループを除外）
    final pathsWithChildren = allPaths.where((path) {
      final children = ref.watch(childrenAtPathMangerProvider(path));
      return children.children.isNotEmpty;
    }).toList();

    // 全グループの座標を取得
    final coordinates = <NodePath, GroupCoordinate>{};
    for (final path in allPaths) {
      coordinates[path] = ref.watch(groupCoordinateProvider(path));
    }

    // 座標の範囲を計算
    final bounds = _calculateBounds(coordinates);
    // 描画領域のサイズを計算
    final size = _calculateCanvasSize(bounds);

    // ルートノードの座標を取得
    final rootCoord = coordinates[rootPath]!;
    
    // ルートノードの中央位置を計算
    // ルートノードはレイアウト座標系の(rootCoord.x, 0)に配置
    const rootNodeSize = 40.0; // SimpleNodeViewのデフォルトサイズ
    final rootNodeX = (rootCoord.x - bounds.minX) * nodeSpacingScale + margin - (rootNodeSize / 2);
    final rootNodeY = margin - (rootNodeSize / 2); // Y座標0をmarginの位置に配置

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          // 接続線を描画（ノードの下に配置するため先に描画）
          CustomPaint(
            size: size,
            painter: TreeConnectionPainter(
              groupCoordinates: coordinates,
              ref: ref,
              offsetX: bounds.minX,
              nodeSpacingScale: nodeSpacingScale,
              levelHeightScale: levelHeightScale,
              margin: margin,
            ),
          ),
          // ルートノードを描画
          Positioned(
            left: rootNodeX,
            top: rootNodeY,
            child: SimpleNodeView(nodePath: rootPath),
          ),
          // 子を持つパスのみグループを配置（空グループは表示しない）
          ...pathsWithChildren.map((path) {
            final coord = coordinates[path]!;
            return NodeGroupView(
              parentPath: path,
              coordinate: coord,
              offsetX: bounds.minX,
              nodeSpacingScale: nodeSpacingScale,
              levelHeightScale: levelHeightScale,
              margin: margin,
            );
          }),
        ],
      ),
    );
  }

  /// 再帰的に全てのノードパスを収集
  List<NodePath> _collectAllPaths(WidgetRef ref, NodePath path) {
    final paths = <NodePath>[path];
    final children = ref.watch(childrenAtPathMangerProvider(path));
    
    for (int i = 0; i < children.children.length; i++) {
      final childPath = path.createChildPath(i);
      paths.addAll(_collectAllPaths(ref, childPath));
    }
    
    return paths;
  }

  /// 座標の範囲を計算
  _Bounds _calculateBounds(Map<NodePath, GroupCoordinate> coordinates) {
    if (coordinates.isEmpty) {
      return _Bounds(minX: 0, maxX: 0, maxY: 0);
    }

    double minX = double.infinity;
    double maxX = double.negativeInfinity;
    double maxY = 0;

    for (final coord in coordinates.values) {
      minX = coord.x < minX ? coord.x : minX;
      maxX = coord.x > maxX ? coord.x : maxX;
      maxY = coord.y > maxY ? coord.y : maxY;
    }

    return _Bounds(minX: minX, maxX: maxX, maxY: maxY);
  }

  /// 全ノードを含むキャンバスサイズを計算
  Size _calculateCanvasSize(_Bounds bounds) {
    final width = (bounds.maxX - bounds.minX) * nodeSpacingScale + margin * 2;
    // グループは親ノードの1レベル下に配置されるため、+1を追加
    final height = (bounds.maxY + 1) * levelHeightScale + margin * 2;

    return Size(width, height);
  }
}

/// 座標の範囲を表すクラス
class _Bounds {
  const _Bounds({required this.minX, required this.maxX, required this.maxY});
  final double minX;
  final double maxX;
  final double maxY;
}
