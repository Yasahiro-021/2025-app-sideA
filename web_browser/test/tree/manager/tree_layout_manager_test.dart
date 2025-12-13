import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/node/node_children.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/tree/manager/group_manager.dart';
import 'package:web_browser/tree/manager/tree_layout_manager.dart';
import 'package:web_browser/tree/model/node_group.dart';

void main() {
  group('TreeLayoutManager - Reingold-Tilfordアルゴリズム', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('ルートノードのみの場合、(0, 0)に配置される', () {
      container = ProviderContainer(
        overrides: [
          childrenAtPathMangerProvider(NodePath.root).overrideWithValue(
            const NodeChildren(children: []),
          ),
          groupManagerProvider(NodePath.root).overrideWithValue(
            NodeGroup(parentPath: NodePath.root, width: 1),
          ),
        ],
      );

      final layout = container.read(treeLayoutManagerProvider);
      final rootCoord = layout[NodePath.root];

      expect(rootCoord, isNotNull);
      expect(rootCoord!.x, equals(0.0));
      expect(rootCoord.y, equals(0.0));
    });

    test('ルートに1つの子がいる場合、適切に配置される', () {
      final child0 = NodePath(path: [0]);

      container = ProviderContainer(
        overrides: [
          childrenAtPathMangerProvider(NodePath.root).overrideWithValue(
            NodeChildren(children: [child0]),
          ),
          childrenAtPathMangerProvider(child0).overrideWithValue(
            const NodeChildren(children: []),
          ),
          groupManagerProvider(NodePath.root).overrideWithValue(
            NodeGroup(parentPath: NodePath.root, width: 3),
          ),
          groupManagerProvider(child0).overrideWithValue(
            NodeGroup(parentPath: child0, width: 1),
          ),
        ],
      );

      final layout = container.read(treeLayoutManagerProvider);
      
      final rootCoord = layout[NodePath.root];
      final child0Coord = layout[child0];

      expect(rootCoord, isNotNull);
      expect(child0Coord, isNotNull);

      // ルートはY=0
      expect(rootCoord!.y, equals(0.0));
      // 子は深さ1
      expect(child0Coord!.y, equals(1.0));
    });

    test('ルートに2つの子がいる場合、左右に配置される', () {
      final child0 = NodePath(path: [0]);
      final child1 = NodePath(path: [1]);

      container = ProviderContainer(
        overrides: [
          childrenAtPathMangerProvider(NodePath.root).overrideWithValue(
            NodeChildren(children: [child0, child1]),
          ),
          childrenAtPathMangerProvider(child0).overrideWithValue(
            const NodeChildren(children: []),
          ),
          childrenAtPathMangerProvider(child1).overrideWithValue(
            const NodeChildren(children: []),
          ),
          groupManagerProvider(NodePath.root).overrideWithValue(
            NodeGroup(parentPath: NodePath.root, width: 4),
          ),
          groupManagerProvider(child0).overrideWithValue(
            NodeGroup(parentPath: child0, width: 1),
          ),
          groupManagerProvider(child1).overrideWithValue(
            NodeGroup(parentPath: child1, width: 1),
          ),
        ],
      );

      final layout = container.read(treeLayoutManagerProvider);
      
      final rootCoord = layout[NodePath.root];
      final child0Coord = layout[child0];
      final child1Coord = layout[child1];

      expect(rootCoord, isNotNull);
      expect(child0Coord, isNotNull);
      expect(child1Coord, isNotNull);

      // すべてのノードが適切な深さに配置されている
      expect(rootCoord!.y, equals(0.0));
      expect(child0Coord!.y, equals(1.0));
      expect(child1Coord!.y, equals(1.0));

      // ルートは子の中央に配置される
      final childCenter = (child0Coord.x + child1Coord.x) / 2;
      expect(rootCoord.x, equals(childCenter));
      
      // 子は最小間隔以上で配置されている
      expect(child1Coord.x - child0Coord.x, greaterThanOrEqualTo(TreeLayoutManager.minNodeSpacing));
    });

    test('3階層のツリーで正しく配置される', () {
      final child0 = NodePath(path: [0]);
      final child1 = NodePath(path: [1]);
      final child0_0 = NodePath(path: [0, 0]);
      final child0_1 = NodePath(path: [0, 1]);

      container = ProviderContainer(
        overrides: [
          childrenAtPathMangerProvider(NodePath.root).overrideWithValue(
            NodeChildren(children: [child0, child1]),
          ),
          childrenAtPathMangerProvider(child0).overrideWithValue(
            NodeChildren(children: [child0_0, child0_1]),
          ),
          childrenAtPathMangerProvider(child1).overrideWithValue(
            const NodeChildren(children: []),
          ),
          childrenAtPathMangerProvider(child0_0).overrideWithValue(
            const NodeChildren(children: []),
          ),
          childrenAtPathMangerProvider(child0_1).overrideWithValue(
            const NodeChildren(children: []),
          ),
          groupManagerProvider(NodePath.root).overrideWithValue(
            NodeGroup(parentPath: NodePath.root, width: 4),
          ),
          groupManagerProvider(child0).overrideWithValue(
            NodeGroup(parentPath: child0, width: 4),
          ),
          groupManagerProvider(child1).overrideWithValue(
            NodeGroup(parentPath: child1, width: 1),
          ),
          groupManagerProvider(child0_0).overrideWithValue(
            NodeGroup(parentPath: child0_0, width: 1),
          ),
          groupManagerProvider(child0_1).overrideWithValue(
            NodeGroup(parentPath: child0_1, width: 1),
          ),
        ],
      );

      final layout = container.read(treeLayoutManagerProvider);
      
      final rootCoord = layout[NodePath.root];
      final child0Coord = layout[child0];
      final child1Coord = layout[child1];
      final child0_0Coord = layout[child0_0];
      final child0_1Coord = layout[child0_1];

      expect(rootCoord, isNotNull);
      expect(child0Coord, isNotNull);
      expect(child1Coord, isNotNull);
      expect(child0_0Coord, isNotNull);
      expect(child0_1Coord, isNotNull);

      // すべてのノードが適切な深さに配置されている
      expect(rootCoord!.y, equals(0.0));
      expect(child0Coord!.y, equals(1.0));
      expect(child1Coord!.y, equals(1.0));
      expect(child0_0Coord!.y, equals(2.0));
      expect(child0_1Coord!.y, equals(2.0));

      // 親は子の中央に配置される
      final child0Center = (child0_0Coord.x + child0_1Coord.x) / 2;
      expect(child0Coord.x, equals(child0Center));

      // ノード同士が重ならない（最小間隔以上を保つ）
      expect(child0_1Coord.x - child0_0Coord.x, 
             greaterThanOrEqualTo(TreeLayoutManager.minNodeSpacing));
      expect(child1Coord.x - child0Coord.x, 
             greaterThanOrEqualTo(TreeLayoutManager.minNodeSpacing));
    });

    test('groupCoordinateProviderで個別グループの座標を取得できる', () {
      final child0 = NodePath(path: [0]);

      container = ProviderContainer(
        overrides: [
          childrenAtPathMangerProvider(NodePath.root).overrideWithValue(
            NodeChildren(children: [child0]),
          ),
          childrenAtPathMangerProvider(child0).overrideWithValue(
            const NodeChildren(children: []),
          ),
          groupManagerProvider(NodePath.root).overrideWithValue(
            NodeGroup(parentPath: NodePath.root, width: 3),
          ),
          groupManagerProvider(child0).overrideWithValue(
            NodeGroup(parentPath: child0, width: 2),
          ),
        ],
      );

      final rootCoord = container.read(groupCoordinateProvider(NodePath.root));
      final child0Coord = container.read(groupCoordinateProvider(child0));

      expect(rootCoord.y, equals(0.0));
      expect(child0Coord.y, equals(1.0));
    });

    test('存在しないパスの場合、デフォルト座標(0, 0)を返す', () {
      final nonExistentPath = NodePath(path: [999]);

      container = ProviderContainer(
        overrides: [
          childrenAtPathMangerProvider(NodePath.root).overrideWithValue(
            const NodeChildren(children: []),
          ),
          groupManagerProvider(NodePath.root).overrideWithValue(
            NodeGroup(parentPath: NodePath.root, width: 1),
          ),
        ],
      );

      final coord = container.read(groupCoordinateProvider(nonExistentPath));

      expect(coord.x, equals(0.0));
      expect(coord.y, equals(0.0));
    });

    test('複雑なツリー構造でノードが重ならない', () {
      final child0 = NodePath(path: [0]);
      final child1 = NodePath(path: [1]);
      final child2 = NodePath(path: [2]);
      final child0_0 = NodePath(path: [0, 0]);
      final child0_1 = NodePath(path: [0, 1]);
      final child1_0 = NodePath(path: [1, 0]);
      final child2_0 = NodePath(path: [2, 0]);
      final child2_1 = NodePath(path: [2, 1]);
      final child2_2 = NodePath(path: [2, 2]);

      container = ProviderContainer(
        overrides: [
          childrenAtPathMangerProvider(NodePath.root).overrideWithValue(
            NodeChildren(children: [child0, child1, child2]),
          ),
          childrenAtPathMangerProvider(child0).overrideWithValue(
            NodeChildren(children: [child0_0, child0_1]),
          ),
          childrenAtPathMangerProvider(child1).overrideWithValue(
            NodeChildren(children: [child1_0]),
          ),
          childrenAtPathMangerProvider(child2).overrideWithValue(
            NodeChildren(children: [child2_0, child2_1, child2_2]),
          ),
          childrenAtPathMangerProvider(child0_0).overrideWithValue(const NodeChildren(children: [])),
          childrenAtPathMangerProvider(child0_1).overrideWithValue(const NodeChildren(children: [])),
          childrenAtPathMangerProvider(child1_0).overrideWithValue(const NodeChildren(children: [])),
          childrenAtPathMangerProvider(child2_0).overrideWithValue(const NodeChildren(children: [])),
          childrenAtPathMangerProvider(child2_1).overrideWithValue(const NodeChildren(children: [])),
          childrenAtPathMangerProvider(child2_2).overrideWithValue(const NodeChildren(children: [])),
          // GroupManager overrides
          groupManagerProvider(NodePath.root).overrideWithValue(NodeGroup(parentPath: NodePath.root, width: 5)),
          groupManagerProvider(child0).overrideWithValue(NodeGroup(parentPath: child0, width: 4)),
          groupManagerProvider(child1).overrideWithValue(NodeGroup(parentPath: child1, width: 3)),
          groupManagerProvider(child2).overrideWithValue(NodeGroup(parentPath: child2, width: 5)),
          groupManagerProvider(child0_0).overrideWithValue(NodeGroup(parentPath: child0_0, width: 1)),
          groupManagerProvider(child0_1).overrideWithValue(NodeGroup(parentPath: child0_1, width: 1)),
          groupManagerProvider(child1_0).overrideWithValue(NodeGroup(parentPath: child1_0, width: 1)),
          groupManagerProvider(child2_0).overrideWithValue(NodeGroup(parentPath: child2_0, width: 1)),
          groupManagerProvider(child2_1).overrideWithValue(NodeGroup(parentPath: child2_1, width: 1)),
          groupManagerProvider(child2_2).overrideWithValue(NodeGroup(parentPath: child2_2, width: 1)),
        ],
      );

      final layout = container.read(treeLayoutManagerProvider);
      
      // 同じ深さのすべてのノードペアをチェック
      final depth1Nodes = [child0, child1, child2];
      final depth1Coords = depth1Nodes.map((n) => layout[n]!).toList();

      // 深さ1のノードが重ならないことを確認
      for (int i = 0; i < depth1Coords.length - 1; i++) {
        final diff = (depth1Coords[i + 1].x - depth1Coords[i].x).abs();
        expect(diff, greaterThan(0),
               reason: '深さ1のノード $i と ${i + 1} が重なっています: x=${depth1Coords[i].x}, ${depth1Coords[i+1].x}');
      }

      // 深さ2のノード - 重複を除去してソート
      final depth2Nodes = [child0_0, child0_1, child1_0, child2_0, child2_1, child2_2];
      final depth2Coords = depth2Nodes.map((n) => layout[n]!.x).toSet().toList()
        ..sort();

      // 深さ2のノードが重ならないことを確認
      for (int i = 0; i < depth2Coords.length - 1; i++) {
        final diff = (depth2Coords[i + 1] - depth2Coords[i]).abs();
        expect(diff, greaterThan(0),
               reason: '深さ2のノード $i と ${i + 1} が重なっています: x=${depth2Coords[i]}, ${depth2Coords[i+1]}');
      }
    });
  });
}



