import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/manager/group_manager.dart';
import 'package:web_browser/tree/model/group.dart';

part 'group_location_manager.g.dart';

///parentPathからGroupを取得し、座標(x,y)を返すUsecase
@riverpod
class GroupLocationManager extends _$GroupLocationManager {
  @override
  (double, double) build(NodePath parentPath) {
    NodePath? grandPath = parentPath.parentPath;
    final double y = parentPath.depth + 1.0; // 親の深さ + 1

    final double myTreeWidth = ref
        .watch(groupManagerProvider(parentPath))
        .treeWidth; //自身のサブツリー幅を取得

    //ルートノードの子の場合、兄弟はいないのでy=1,x=サブツリーたちの中心を返す。
    if (grandPath == null) {
      final double x = myTreeWidth / 2;
      return (x, y);
    }

    //ルートノードの子でない場合、親グループのxとtreeWidthを取得し、自分が何番目の子かでxを決定する。
    final (double, double) parentLocate = ref.watch(
      groupLocationManagerProvider(grandPath),
    );
    double parentX = parentLocate.$1;

    //自身が何番目の子かを取得
    final Group parentGroup = ref.watch(groupManagerProvider(grandPath));
    final List<Group> siblings = parentGroup.childrenGroup;
    final int index = siblings.indexWhere((group) => group.path == parentPath);

    //自身より前の兄弟たちのサブツリー幅の合計を計算
    final double offsetX = siblings
        .sublist(0, index)
        .fold(0.0, (previousValue, group) => previousValue + group.treeWidth);

    //自身のx座標を計算
    final edgeX = parentX - (parentGroup.treeWidth / 2); //親のツリー幅の左端

    final double x = edgeX + offsetX + (myTreeWidth / 2); //左端へオフセットと、自身の幅の中心を足す
    return (x, y);
  }

  /// グループの左端
  (double, double) get leftEdgePos {
    final double centerXPos = state.$1;
    final width = ref.watch(groupManagerProvider(parentPath)).width;
    return (centerXPos - (width / 2), state.$2);
  }
}
