//外部ライブラリ
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//使用モデル
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/model/group_location.dart';
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
    //設定から高さと余白を取得
    final TreeSettings treeSettings = ref.watch(treeSettingsProvider);
    final double height = treeSettings.layerHeight;
    final double padding = treeSettings.groupPadding;

    // グループの幅と位置を取得
    //余白を引く
    final double width =
        ref.watch(groupManagerProvider(nodePath)).width - padding * 2;
    final GroupLocation position = ref.watch(
      groupLocationManagerProvider(nodePath),
    );

    //スキームを取得
    final scheme = Theme.of(context).colorScheme;

    return Positioned(
      //座標をセット
      left: position.x,
      top: position.y,

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Container(
          width: width,
          height: height,
          color: scheme.primaryContainer,
          child: FittedBox(child: Text('Group: $nodePath')),
        ),
      ),
    );
  }
}
