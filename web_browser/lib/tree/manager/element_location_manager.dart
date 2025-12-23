import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/tree/manager/group_location_manager.dart';
import 'package:web_browser/tree/view/tree_settengs_provider.dart';

part 'element_location_manager.g.dart';

@riverpod
class ElementLocationManager extends _$ElementLocationManager {
  @override
  (double, double) build(NodePath nodePath) {
    return _calcElementPos();
  }

  // 要素の位置を計算
  (double, double) _calcElementPos() {
    // 親のNodePathを取得
    final NodePath? parentPath = nodePath.parentPath;

    // 親がいない(ルートノード)場合はy= 0,x= 子の直上に配置
    if (parentPath == null) {
      double childX = ref.watch(groupLocationManagerProvider(nodePath)).$1;
      return (childX, 0.0);
    }

    // ルートノード以外の場合
    // yはパスから算出
    double yPos = parentPath.depth + 1.0;

    // グループの左端を取得。パディングを含む。
    (double, double) leftEdgePos = ref
        .watch(groupLocationManagerProvider(parentPath).notifier)
        .leftEdgePos;

    // グループのパディングを取得
    double padding = ref.watch(treeSettingsProvider).groupPadding;

    // 描画上、グループの左端の線がある位置を初期値とする。
    double xPos = leftEdgePos.$1 + padding;

    // グループ内での自身のindexを取得
    int index = ref
        .watch(childrenAtPathMangerProvider(parentPath))
        .children
        .indexOf(nodePath);

    // index分、要素の幅と要素のパディングを加算していく
    // 要素の幅
    double elementWidth = ref.watch(treeSettingsProvider).elementWidth;
    // indexが0の場合は余白は挟まない
    if (index == 0) {
      xPos += elementWidth / 2;
    } else {
      // 要素のパディング
      double elementPadding = ref
          .watch(treeSettingsProvider)
          .elementHorizontalSpacing;
      xPos +=
          elementWidth /
              2 //最初の要素分
              +
          (elementPadding + elementWidth) * index; //それ以降の要素分
    }

    return (xPos, yPos);
  }
}
