import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/tree/manager/group_location_manager.dart';
import 'package:web_browser/tree/model/element_location.dart';
import 'package:web_browser/tree/view/tree_settengs_provider.dart';

part 'element_location_manager.g.dart';

@Riverpod(keepAlive: true)
class ElementLocationManager extends _$ElementLocationManager {
  @override
  ElementLocation build(NodePath nodePath) {
    return _calcElementPos();
  }

  // 要素の位置を計算
  ElementLocation _calcElementPos() {
    // 親のNodePathを取得
    final NodePath? parentPath = nodePath.parentPath;

    // 親がいない(ルートノード)場合はy= 0,x= 子の直上に配置
    if (parentPath == null) {
      double childX = ref.watch(groupLocationManagerProvider(nodePath)).x;
      double x = childX + ref.watch(treeSettingsProvider).elementWidth / 2;
      return ElementLocation(
        x: x,
        y: 0.0,
        centerX: _getCenterXpos(x),
        bottomY: _getBottomYpos(0.0),
      );
    }

    // ルートノード以外の場合
    // yは所属するグループから算出
    double yPos = ref.watch(groupLocationManagerProvider(parentPath)).y;

    // グループの左端を取得。パディングを含む。
    double leftEdgePos = ref.watch(groupLocationManagerProvider(parentPath)).x;

    // グループの左端を初期値とする。
    double xPos = leftEdgePos;
    // グループ内での自身のindexを取得
    int index = ref
        .watch(childrenAtPathMangerProvider(parentPath))
        .children
        .indexOf(nodePath);

    // index分、要素の幅を加算sする
    // 要素の幅
    double elementWidth = ref.watch(treeSettingsProvider).elementWidth;
    //加算
    xPos += elementWidth * index; //それ以降の要素

    return ElementLocation(
      x: xPos,
      y: yPos,
      centerX: _getCenterXpos(xPos),
      bottomY: _getBottomYpos(yPos),
    );
  }

  /// 要素の中心X座標
  double _getCenterXpos(double edgeXPos) {
    double centerXPos =
        edgeXPos +
        ref.watch(treeSettingsProvider).elementWidth / 2; //要素の幅の半分を足す
    return centerXPos;
  }

  /// 要素の下端
  double _getBottomYpos(double topYPos) {
    final double elementHeight = ref.watch(treeSettingsProvider).layerHeight;
    return topYPos + elementHeight;
  }
}
