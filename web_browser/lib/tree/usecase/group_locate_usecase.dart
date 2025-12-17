import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/manager/group_manager.dart';
import 'package:web_browser/tree/model/group.dart';

part 'group_locate_usecase.g.dart';

///TODO Riverpodで実装する必要があるか検討する
///parentPathからGroupを取得し、座標(x,y)を返すUsecase
@riverpod
class GroupLocateUsecase extends _$GroupLocateUsecase {
  @override
  (double, double) build(NodePath parentPath) {
    NodePath? grandPath = parentPath.parentPath;
    final double y = parentPath.depth + 1.0; // 親の深さ + 1

    //ルートノードの子の場合、兄弟はいないのでy=0,x=サブツリーたちの中心を返す。
    if (grandPath == null) {
      final double x = _calcCenterX(ref);
      return (x, y);
    }

    //ルートノードの子でない場合、親グループのxとtreeWidthを取得し、自分が何番目の子かでxを決定する。
    final (double, double) parentLocate = ref.watch(
      groupLocateUsecaseProvider(grandPath),
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
    final double x = edgeX + offsetX; //左端からのオフセットを足す
    return (x, y);
  }

  ///子のグループをルートとするサブツリーの幅の合計から中心のx座標を計算する
  double _calcCenterX(Ref ref) {
    //子のグループたちを取得
    final List<Group> childrenGroups = ref
        .watch(groupManagerProvider(parentPath))
        .childrenGroup;

    //子たちのサブツリー幅の合計を計算
    final double sumWidth = childrenGroups.fold(
      0.0,
      (previousValue, group) => previousValue + group.treeWidth,
    );

    final double x = sumWidth / 2; //中心のx座標
    return x;
  }
}
