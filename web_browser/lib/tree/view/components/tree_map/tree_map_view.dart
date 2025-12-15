import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';

/// シンプルなツリー表示ウィジェット
/// 
/// NodePathとChildrenAtPathMangerProviderを使用して
/// ツリー構造を表示します。
class TreeMapView extends ConsumerWidget {
  const TreeMapView({super.key});

  // レイアウト定数
  static const double nodeWidth = 80.0;
  static const double nodeHeight = 40.0;
  static const double horizontalSpacing = 20.0;
  static const double verticalSpacing = 60.0;
  static const double margin = 50.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InteractiveViewer(
      constrained: false,
      boundaryMargin: const EdgeInsets.all(double.infinity),
      minScale: 0.1,
      maxScale: 4.0,
      panEnabled: true,
      scaleEnabled: true,
      child: _TreeCanvas(ref: ref),
    );
  }
}

/// ツリーを描画するキャンバス
class _TreeCanvas extends StatelessWidget {
  const _TreeCanvas({required this.ref});

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    // ツリー全体の座標情報を計算
    final layoutInfo = _calculateLayout(ref, NodePath.root, 0, 0);
    
    // キャンバスサイズを計算
    final canvasWidth = (layoutInfo.maxX + 1) * (TreeMapView.nodeWidth + TreeMapView.horizontalSpacing) + TreeMapView.margin * 2;
    final canvasHeight = (layoutInfo.maxDepth + 1) * (TreeMapView.nodeHeight + TreeMapView.verticalSpacing) + TreeMapView.margin * 2;

    return SizedBox(
      width: canvasWidth,
      height: canvasHeight,
      child: CustomPaint(
        painter: _TreeConnectionPainter(layoutInfo.nodes),
        child: Stack(
          children: layoutInfo.nodes.map((node) => _buildNodeWidget(context, node)).toList(),
        ),
      ),
    );
  }

  /// ツリーのレイアウトを計算
  _LayoutInfo _calculateLayout(WidgetRef ref, NodePath path, int depth, int startX) {
    final children = ref.watch(childrenAtPathMangerProvider(path));
    final nodes = <_NodeLayoutData>[];
    int currentX = startX;
    int maxX = startX;
    int maxDepth = depth;

    if (children.children.isEmpty) {
      // 葉ノードの場合
      nodes.add(_NodeLayoutData(
        path: path,
        x: startX,
        depth: depth,
      ));
      return _LayoutInfo(nodes: nodes, nextX: startX + 1, maxX: startX, maxDepth: depth);
    }

    // 子ノードを再帰的に処理
    final childLayouts = <_LayoutInfo>[];
    for (final childPath in children.children) {
      final childLayout = _calculateLayout(ref, childPath, depth + 1, currentX);
      childLayouts.add(childLayout);
      nodes.addAll(childLayout.nodes);
      currentX = childLayout.nextX;
      if (childLayout.maxX > maxX) maxX = childLayout.maxX;
      if (childLayout.maxDepth > maxDepth) maxDepth = childLayout.maxDepth;
    }

    // 親ノードのX座標は子ノードの中央
    final firstChildX = childLayouts.first.nodes.first.x;
    final lastChildX = childLayouts.last.nodes.first.x;
    final parentX = (firstChildX + lastChildX) / 2.0;

    nodes.add(_NodeLayoutData(
      path: path,
      x: parentX.toInt(),
      depth: depth,
      exactX: parentX,
    ));

    return _LayoutInfo(
      nodes: nodes,
      nextX: currentX,
      maxX: maxX > parentX ? maxX : parentX.toInt(),
      maxDepth: maxDepth,
    );
  }

  /// ノードウィジェットを構築
  Widget _buildNodeWidget(BuildContext context, _NodeLayoutData node) {
    final x = (node.exactX ?? node.x.toDouble()) * (TreeMapView.nodeWidth + TreeMapView.horizontalSpacing) + TreeMapView.margin;
    final y = node.depth * (TreeMapView.nodeHeight + TreeMapView.verticalSpacing) + TreeMapView.margin;

    return Positioned(
      left: x,
      top: y.toDouble(),
      child: _TreeNodeWidget(nodePath: node.path),
    );
  }
}

/// 個別のノードウィジェット
class _TreeNodeWidget extends StatelessWidget {
  const _TreeNodeWidget({required this.nodePath});

  final NodePath nodePath;

  @override
  Widget build(BuildContext context) {
    final isRoot = nodePath.path.isEmpty;
    final label = isRoot ? 'Root' : nodePath.path.last.toString();

    return Container(
      width: TreeMapView.nodeWidth,
      height: TreeMapView.nodeHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}

/// 接続線を描画するペインター
class _TreeConnectionPainter extends CustomPainter {
  _TreeConnectionPainter(this.nodes);

  final List<_NodeLayoutData> nodes;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    // ノードをパスでマップ化
    final nodeMap = <String, _NodeLayoutData>{};
    for (final node in nodes) {
      nodeMap[node.path.toString()] = node;
    }

    // 各ノードから親への線を描画
    for (final node in nodes) {
      final parentPath = node.path.parentPath;
      if (parentPath == null) continue;

      final parent = nodeMap[parentPath.toString()];
      if (parent == null) continue;

      final nodeX = (node.exactX ?? node.x.toDouble()) * (TreeMapView.nodeWidth + TreeMapView.horizontalSpacing) + TreeMapView.margin + TreeMapView.nodeWidth / 2;
      final nodeY = node.depth * (TreeMapView.nodeHeight + TreeMapView.verticalSpacing) + TreeMapView.margin;

      final parentX = (parent.exactX ?? parent.x.toDouble()) * (TreeMapView.nodeWidth + TreeMapView.horizontalSpacing) + TreeMapView.margin + TreeMapView.nodeWidth / 2;
      final parentY = parent.depth * (TreeMapView.nodeHeight + TreeMapView.verticalSpacing) + TreeMapView.margin + TreeMapView.nodeHeight;

      // 親の下端から子の上端へ線を引く
      final path = Path()
        ..moveTo(parentX, parentY)
        ..lineTo(nodeX, nodeY);

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_TreeConnectionPainter oldDelegate) {
    return nodes != oldDelegate.nodes;
  }
}

/// ノードのレイアウト情報
class _NodeLayoutData {
  _NodeLayoutData({
    required this.path,
    required this.x,
    required this.depth,
    this.exactX,
  });

  final NodePath path;
  final int x;
  final int depth;
  final double? exactX; // 親ノードの正確なX座標（子の中央）
}

/// レイアウト計算結果
class _LayoutInfo {
  _LayoutInfo({
    required this.nodes,
    required this.nextX,
    required this.maxX,
    required this.maxDepth,
  });

  final List<_NodeLayoutData> nodes;
  final int nextX;
  final int maxX;
  final int maxDepth;
}