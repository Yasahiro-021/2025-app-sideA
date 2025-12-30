import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/manager/group_manager.dart';
import 'package:web_browser/tree/view/components/element/element_view.dart';
import 'package:web_browser/tree/view/components/group/group_view.dart';
import 'package:web_browser/tree/view/components/line_painter/line_widget.dart';
import 'package:web_browser/tree/view/components/tree_map/tree_map_view_model.dart';

import 'tree_map_state.dart';

/// ツリーの全体を描画するウィジェット
///
///
/// ツリー構造を表示します。
class TreeMapView extends ConsumerWidget {
  const TreeMapView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TreeMapState state = ref.watch(treeMapViewModelProvider);
    List<LineWidget> lines = [];
    List<GroupView> groups = [];
    List<ElementView> elements = [];
    for (var path in state.allPaths) {
      // グループを追加
      groups.add(GroupView(nodePath: path));
    }
    for (var path in state.allPaths) {
      // エレメントを追加
      elements.add(ElementView(nodePath: path));
    }
    for (var path in state.allPaths) {
      // 線を追加
      lines.add(LineWidget(path: path));
    }

    double width = ref.watch(groupManagerProvider(NodePath.root)).treeWidth;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,

      child: Container(
        decoration: BoxDecoration(
          border: BoxBorder.all(color: Colors.black)
        ),
        child: SizedBox(
          //ノード全体のサイズを指定
          width: width,
          height: 5000,
          child: Stack(
            children: [
              // グループの配置
              ...groups,
              // エレメントの配置
              ...elements,
              // 線の配置
              ...lines,
            ],
          ),
        ),
      ),
    );
  }
}
