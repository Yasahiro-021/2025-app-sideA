import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
//モデル
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/model/group.dart';
import 'package:web_browser/tree/model/group_location.dart';
//マネージャー
import 'package:web_browser/tree/manager/group_manager.dart';
import 'package:web_browser/tree/view/tree_settengs_provider.dart';

part 'group_location_manager.g.dart';

///parentPathからGroupを取得し、座標(x,y)を返すUsecase
@Riverpod(keepAlive: true)
class GroupLocationManager extends _$GroupLocationManager {
  @override
  GroupLocation build(NodePath parentPath) {
    //各設定を取得
    NodePath? grandPath = parentPath.parentPath;
    final double layerHeight = ref.watch(treeSettingsProvider).layerHeight;
    final double padding = ref.watch(treeSettingsProvider).groupPadding;
    final double verticalSpacing = ref
        .watch(treeSettingsProvider)
        .groupVerticalSpacing;
    final double y =
        (parentPath.depth + 1.0) *
        (layerHeight + verticalSpacing); // (親の深さ + 1)　* (層の高さ + 垂直間隔)

    final double myTreeWidth = ref
        .watch(groupManagerProvider(parentPath))
        .treeWidth; //自身のサブツリー幅を取得

    final double myWidth = ref.watch(groupManagerProvider(parentPath)).width;
    //ルートノードの子の場合、兄弟はいないのでy=1,x=サブツリーたちの中心から、自分の幅の半分を引いた位置を返す。
    if (grandPath == null) {
      //左端を中心に合わせてしまわないよう、自分の幅を半分引く
      final double x = myTreeWidth / 2 - myWidth / 2;

      return GroupLocation(
        x: x,
        y: y,
        centerX: _centerXPos(x),
        leftEdgeX: x + padding,
      );
    }

    //ルートノードの子でない場合、親グループのxとtreeWidthを取得し、自分が何番目の子かでxを決定する。
    final GroupLocation parentLocate = ref.watch(
      groupLocationManagerProvider(grandPath),
    );
    double parentX = parentLocate.centerX;

    //自身が何番目の子かを取得
    final Group parentGroup = ref.watch(groupManagerProvider(grandPath));
    final List<Group> siblings = parentGroup.childrenGroup;
    final int index = siblings.indexWhere((group) => group.path == parentPath);

    //自身より前の兄弟たちのサブツリー幅の合計を計算
    final double offsetX = siblings
        .sublist(0, index)
        .fold(0.0, (previousValue, group) => previousValue + group.treeWidth);

    //自身のx座標を計算
    //親のツリー幅の左端
    final edgeX = parentX - (parentGroup.treeWidth / 2);
    //左端へオフセットと、自身のツリー幅の範囲を足し、中央の座標を取得
    double x;
    x = edgeX + offsetX + (myTreeWidth / 2);
    //中心の座標から自身の幅の半分を引いて、中央に配置するための座標を計算
    x -= myWidth / 2;
    if (kDebugMode) {
      //ログ出力
      log(
        "グループ$parentPath の位置は x: $x , y: $y \n 親グループ: $grandPath , 親グループx: $parentX , ツリー幅: $myTreeWidth ,グループ幅: $myWidth , インデックス: $index , オフセットX: $offsetX",
      );
    }
    return GroupLocation(
      x: x,
      y: y,
      centerX: _centerXPos(x),
      leftEdgeX: x + padding,
    );
  }

  /// グループの中央
  double _centerXPos(double x) {
    final width = ref.watch(groupManagerProvider(parentPath)).width;
    return x + (width / 2);
  }
}
