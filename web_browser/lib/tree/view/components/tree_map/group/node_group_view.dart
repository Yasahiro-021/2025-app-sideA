import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/tree/manager/group_manager.dart';
import 'package:web_browser/tree/model/group_coordinate.dart';
import 'package:web_browser/tree/model/node_group.dart';
import 'package:web_browser/tree/view/components/tree_map/node/simple_node_view.dart';

/// TreeLayoutManagerから取得した座標に基づいてNodeGroupを描画するウィジェット
class NodeGroupView extends ConsumerWidget {
  const NodeGroupView({
    required this.parentPath,
    required this.coordinate,
    required this.offsetX,
    required this.nodeSpacingScale,
    required this.levelHeightScale,
    required this.margin,
    super.key,
  });

  final NodePath parentPath;
  final GroupCoordinate coordinate;
  final double offsetX;
  final double nodeSpacingScale;
  final double levelHeightScale;
  final double margin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nodeGroup = ref.watch(groupManagerProvider(parentPath));
    final children = ref.watch(childrenAtPathMangerProvider(parentPath));
    
    // 座標をピクセル位置に変換（minXオフセットとマージンを考慮）
    // グループは親ノードの1レベル下に配置される
    // coordinate は親ノードの座標なので、Y座標は +1 して子グループの深さにする
    final left = (coordinate.x - offsetX) * nodeSpacingScale + margin;
    final top = (coordinate.y + 1) * levelHeightScale + margin;

    return Positioned(
      left: left,
      top: top,
      child: _buildGroupCard(nodeGroup, children.children),
    );
  }
  /// NodeGroupの内容を表示するカード
  /// グループ内のノード群を表示する
  Widget _buildGroupCard(NodeGroup nodeGroup, List<NodePath> childNodes) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // グループの親パス情報
            Text(
              'Group ${parentPath.path.isEmpty ? 'Root' : parentPath.path.join('-')}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            // グループ内のノード群を横並びで表示
            if (childNodes.isEmpty)
              const Text(
                '(empty)',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              )
            else
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.center,
                children: childNodes.map((nodePath) {
                  return SimpleNodeView(
                    nodePath: nodePath,
                    size: 36.0,
                  );
                }).toList(),
              ),
            const SizedBox(height: 4),
            // 幅情報
            Text(
              'Width: ${nodeGroup.width}',
              style: const TextStyle(
                fontSize: 9,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}