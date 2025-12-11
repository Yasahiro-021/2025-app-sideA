import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/tree/model/group_coordinate.dart';

/// ツリーノード間の接続線を描画するCustomPainter
/// 親ノード（個別のノード）から、その子グループへの線を描画する
class TreeConnectionPainter extends CustomPainter {
  TreeConnectionPainter({
    required this.groupCoordinates,
    required this.ref,
    required this.offsetX,
    required this.nodeSpacingScale,
    required this.levelHeightScale,
    required this.margin,
  });

  final Map<NodePath, GroupCoordinate> groupCoordinates;
  final WidgetRef ref;
  final double offsetX;
  final double nodeSpacingScale;
  final double levelHeightScale;
  final double margin;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    // 各パスについて、そのパスが子を持つ場合に線を描画
    // 線は「ノード（path） → そのノードの子グループ（path/*）」という形で引く
    for (final entry in groupCoordinates.entries) {
      final path = entry.key;
      
      // このパスに子がいるかチェック
      final children = ref.read(childrenAtPathMangerProvider(path));
      if (children.children.isEmpty) continue; // 子がないなら線を引く必要がない
      
      // 親ノードの座標（このpathのノードの座標）
      final parentCoord = groupCoordinates[path];
      if (parentCoord == null) continue;
      
      // 子グループの座標（子グループの親はこのpath、つまり座標はこのpathと同じだが深さ+1）
      // 子グループはdepth = path.depth + 1の位置に配置される
      final childGroupY = (path.depth + 1) * levelHeightScale + margin;
      
      // 親ノードのピクセル座標を計算
      // ノードは自身の座標の中央に配置される
      const nodeSize = 40.0;
      final parentNodeX = (parentCoord.x - offsetX) * nodeSpacingScale + margin;
      final parentNodeY = parentCoord.y * levelHeightScale + margin;
      
      // 子グループのX座標は親ノードの真下
      final childGroupX = parentNodeX;

      // 線の始点：親ノードの下端中央
      final startPoint = Offset(parentNodeX, parentNodeY + nodeSize / 2);
      // 線の終点：子グループの上端中央
      final endPoint = Offset(childGroupX, childGroupY - 5.0);

      final linePath = Path()
        ..moveTo(startPoint.dx, startPoint.dy)
        ..lineTo(endPoint.dx, endPoint.dy);

      canvas.drawPath(linePath, paint);
    }
  }

  @override
  bool shouldRepaint(TreeConnectionPainter oldDelegate) {
    return groupCoordinates != oldDelegate.groupCoordinates ||
        offsetX != oldDelegate.offsetX ||
        nodeSpacingScale != oldDelegate.nodeSpacingScale ||
        levelHeightScale != oldDelegate.levelHeightScale ||
        margin != oldDelegate.margin;
  }
}
