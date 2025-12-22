//外部ライブラリ
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//使用モデル
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/view/tree_settings.dart';
//使用プロバイダ
import 'package:web_browser/tree/manager/group_manager.dart';
import 'package:web_browser/tree/manager/group_location_manager.dart';
import 'package:web_browser/tree/view/tree_settengs_provider.dart';

class GroupView extends ConsumerWidget {
  final NodePath nodePath;
  const GroupView({super.key, required this.nodePath});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // グループの幅と位置を取得
    final double width = ref.watch(groupManagerProvider(nodePath)).width;
    final (double, double) position = ref.watch(
      groupLocationManagerProvider(nodePath),
    );

    //設定から高さと余白を取得
    final TreeSettings treeSettings = ref.watch(treeSettingsProvider);
    final double height = treeSettings.layerHeight;
    final double padding = treeSettings.groupPadding;

    return Positioned(
      //座標をセット
      left: position.$1,
      top: position.$2,

      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Container(
          width: width,
          height: height,
          color: Colors.blue,
          child: Text('Group: $nodePath'),
        ),
      ),
    );
  }
}
