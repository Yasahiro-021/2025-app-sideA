import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/manager/node_coordinate_manager.dart';
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
  });

  final Map<NodePath, GroupCoordinate> groupCoordinates;
  final WidgetRef ref;
  final double offsetX;
  final double nodeSpacingScale;
  final double levelHeightScale;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    // 各グループについて、その親ノード（個別のノード）との接続線を描画
    // 線は「親ノード（個別のノード） → グループ」という形で引く
    for (final entry in groupCoordinates.entries) {
      final path = entry.key;
      final groupCoord = entry.value;
      
      // ノード（親）の座標を取得
      final parentNodeCoord = ref.read(nodeCoordinateProvider(path));

      // 座標をピクセル位置に変換（minXオフセットとマージンを考慮）
      const margin = 100.0;
      const cardWidth = 150.0; // グループカードのおおよその幅
      const topMargin = -5.0; // 子グループの上端より少し上で線を終わらせる
      
      final childGroupX = (groupCoord.x - offsetX) * nodeSpacingScale + margin;
      final childGroupY = groupCoord.y * levelHeightScale + margin;

      // 親ノードの座標（nodeCoordinateProviderから取得した座標は既にピクセル位置）
      final parentNodeX = parentNodeCoord.x;
      final parentNodeY = parentNodeCoord.y;

      final startPoint = Offset(parentNodeX, parentNodeY);
      final endPoint = Offset(childGroupX + cardWidth / 2, childGroupY + topMargin);

      final linePath = Path()
        ..moveTo(startPoint.dx, startPoint.dy)
        ..lineTo(
          endPoint.dx,
          endPoint.dy,
        );

      canvas.drawPath(linePath, paint);
    }
  }

  @override
  bool shouldRepaint(TreeConnectionPainter oldDelegate) {
    return groupCoordinates != oldDelegate.groupCoordinates ||
        offsetX != oldDelegate.offsetX ||
        nodeSpacingScale != oldDelegate.nodeSpacingScale ||
        levelHeightScale != oldDelegate.levelHeightScale;
  }
}
