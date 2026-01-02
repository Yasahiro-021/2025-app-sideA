import 'dart:developer' as developer;
import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test/test.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/manager/group_manager.dart';
import 'package:web_browser/tree/manager/group_location_manager.dart';
import 'package:web_browser/tree/model/group.dart';
import 'package:web_browser/tree/model/group_location.dart';
import 'package:web_browser/tree/view/tree_settengs_provider.dart';
import 'package:web_browser/tree/view/tree_settings.dart';

void main() {
  group('GroupLocationManager', () {
    late final ProviderContainer testContainer;
    late final Map<NodePath, Group> groupMap;

    setUpAll(() {
      //設定のオーバーライドを作成
      final Override settingOverride = treeSettingsProvider.overrideWithValue(
        TreeSettings(
          elementWidth: 100,
          elementPadding: 8,
          groupPadding: 20.0,
          layerHeight: 100.0,
          groupVerticalSpacing: 50.0,
          maxScale: 5.0,
          minScale: 0.1,
        ),
      );

      // グループマップを構築
      // グループのパスは「その親を示すパス」であることに注意
      // グループ[0]とは「親がroot、ID[0]のグループ」を意味する
      groupMap = {};

      // まず、全グループを定義（深い順に処理して子グループから親グループへ）
      final List<(NodePath, List<NodePath>)> groupDefinitions = [
        // グループ[0,0] - 親パス[0,0]のグループ（要素なし）
        (NodePath(path: [0, 0]), []),
        // グループ[0,1] - 親パス[0,1]のグループ（要素なし）
        (NodePath(path: [0, 1]), []),
        // グループ[1,0] - 親パス[1,0]のグループ（要素なし）
        (NodePath(path: [1, 0]), []),
        // グループ[1,1] - 親パス[1,1]のグループ（要素なし）
        (NodePath(path: [1, 1]), []),
        // グループ[1,2] - 親パス[1,2]のグループ（要素なし）
        (NodePath(path: [1, 2]), []),
        // グループ[2,0] - 親パス[2,0]のグループ（要素なし）
        (NodePath(path: [2, 0]), []),
        // グループ[0] - 親がroot、子は[0,0]と[0,1]
        (NodePath(path: [0]), [NodePath(path: [0, 0]), NodePath(path: [0, 1])]),
        // グループ[1] - 親がroot、子は[1,0], [1,1], [1,2]
        (NodePath(path: [1]), [NodePath(path: [1, 0]), NodePath(path: [1, 1]), NodePath(path: [1, 2])]),
        // グループ[2] - 親がroot、子は[2,0]
        (NodePath(path: [2]), [NodePath(path: [2, 0])]),
      ];

      // 各グループを作成
      for (var (groupPath, childPaths) in groupDefinitions) {
        final List<Group> childGroups = [
          for (var childPath in childPaths)
            if (groupMap.containsKey(childPath)) groupMap[childPath]!
        ];

        // グループの幅を計算（子パスの数 * elementWidth + padding*2）
        double width = 0;
        if (childPaths.isNotEmpty) {
          width = childPaths.length * 100 + 20 * 2;
        }

        // ツリー幅を計算
        double treeWidth = 0;
        treeWidth = childGroups.fold(
          0,
          (sum, childGroup) => sum + childGroup.treeWidth,
        );
        if (treeWidth < width) {
          treeWidth = width;
        }

        groupMap[groupPath] = Group(
          path: groupPath,
          elements: childPaths,
          childrenGroup: childGroups,
          width: width,
          treeWidth: treeWidth,
        );
      }

      // groupManagerのオーバーライドを作成
      final List<Override> groupManagerOverrides = groupMap.entries
          .map(
            (entry) => groupManagerProvider(entry.key)
                .overrideWithValue(entry.value),
          )
          .toList();

      // ルートノードのグループも作成する必要があります
      // ルートノードは子グループ[0], [1], [2]を持ちます
      final Group rootGroup = Group(
        path: NodePath.root,
        elements: [
          NodePath(path: [0]),
          NodePath(path: [1]),
          NodePath(path: [2]),
        ],
        childrenGroup: [
          groupMap[NodePath(path: [0])]!,
          groupMap[NodePath(path: [1])]!,
          groupMap[NodePath(path: [2])]!,
        ],
        width: 3 * 100 + 20 * 2, // 3 children
        treeWidth: max<double>(
          // ツリー幅 = children のツリー幅の合計
          [
            groupMap[NodePath(path: [0])]!.treeWidth,
            groupMap[NodePath(path: [1])]!.treeWidth,
            groupMap[NodePath(path: [2])]!.treeWidth,
          ].fold(0.0, (sum, width) => sum + width),
          3 * 100 + 20 * 2, // width
        ),
      );

      testContainer = ProviderContainer(
        overrides: [
          ...groupManagerOverrides,
          groupManagerProvider(NodePath.root).overrideWithValue(rootGroup),
          settingOverride,
        ],
      );
    });
    test('ルートの子グループの相対位置が正しく計算されるか', () {
      // ルートの子ノード（兄弟グループ）
      final List<NodePath> rootChildPaths = [
        NodePath(path: [0]),
        NodePath(path: [1]),
        NodePath(path: [2]),
      ];

      // 各子ノードの位置情報を取得
      final List<GroupLocation> groupLocates = rootChildPaths
          .map((path) => testContainer.read(groupLocationManagerProvider(path)))
          .toList();

      // 各グループのツリー幅と幅を取得
      final List<double> groupTreeWidths = rootChildPaths
          .map((path) => testContainer.read(groupManagerProvider(path)).treeWidth)
          .toList();

      // ルートグループの情報を取得
      final Group rootGroup = testContainer.read(groupManagerProvider(NodePath.root));
      final GroupLocation rootLocation = testContainer.read(groupLocationManagerProvider(NodePath.root));

      // ルートの子の場合、親グループの中での相対位置が計算される
      final double rootCenterX = rootLocation.centerX;
      final double rootEdgeX = rootCenterX - (rootGroup.treeWidth / 2);

      // 兄弟グループの累積幅を計算して期待値を検証
      double offsetX = 0;
      for (int i = 0; i < groupLocates.length; i++) {
        // グループ管理プロバイダから、各グループの情報を取得
        final Group childGroup = testContainer.read(groupManagerProvider(rootChildPaths[i]));
        final double expectedCenterX = rootEdgeX + offsetX + (groupTreeWidths[i] / 2);
        final double expectedX = expectedCenterX - (childGroup.width / 2);
        
        developer.log('グループ $i: expected x=$expectedX, actual x=${groupLocates[i].x}, centerX=${groupLocates[i].centerX}, expectedCenterX=$expectedCenterX');
        expect(groupLocates[i].centerX, expectedCenterX,
            reason: 'ルートの子グループ $i の centerX が期待値と一致する必要があります');
        
        offsetX += groupTreeWidths[i];
      }
    });

    test('depth2のグループが正しく計算できるか', () {
      // depth2のグループ（ルートの直接の子ノード）
      final List<NodePath> paths = [
        NodePath(path: [0]),
        NodePath(path: [1]),
        NodePath(path: [2]),
      ];

      // 親グループ（ルート）の情報を取得
      final Group rootGroup = testContainer.read(groupManagerProvider(NodePath.root));
      final GroupLocation rootLocation = testContainer.read(groupLocationManagerProvider(NodePath.root));

      // 各グループの位置情報を取得
      final List<GroupLocation> groupLocates = paths
          .map((path) => testContainer.read(groupLocationManagerProvider(path)))
          .toList();

      // 各グループのツリー幅と幅を取得
      final List<double> groupTreeWidths = paths
          .map((path) => testContainer.read(groupManagerProvider(path)).treeWidth)
          .toList();
      final List<double> groupWidths = paths
          .map((path) => testContainer.read(groupManagerProvider(path)).width)
          .toList();

      // depth2のグループの計算ロジックを検証
      // 親の左端: parentX - (parentGroup.treeWidth / 2)
      // 自身のx: edgeX + offsetX + (myTreeWidth / 2) - myWidth / 2
      final double parentCenterX = rootLocation.centerX;
      final double edgeX = parentCenterX - (rootGroup.treeWidth / 2);

      double offsetX = 0;
      for (int i = 0; i < paths.length; i++) {
        final double expectedX = edgeX + offsetX + (groupTreeWidths[i] / 2) - (groupWidths[i] / 2);
        expect(groupLocates[i].x, expectedX,
            reason: 'depth2グループ $i の x 座標が期待値と一致する必要があります');
        offsetX += groupTreeWidths[i];
      }
    });

    test('depth3のグループが正しく計算できるか', () {
      // depth3のグループ（depth2グループの直接の子ノード）
      final List<NodePath> paths = [
        NodePath(path: [0, 0]),
        NodePath(path: [0, 1]),
      ];

      // 親グループ（[0]）の情報を取得
      final NodePath parentPath = NodePath(path: [0]);
      final Group parentGroup = testContainer.read(groupManagerProvider(parentPath));
      final GroupLocation parentLocation = testContainer.read(groupLocationManagerProvider(parentPath));

      // 各グループの位置情報を取得
      final List<GroupLocation> groupLocates = paths
          .map((path) => testContainer.read(groupLocationManagerProvider(path)))
          .toList();

      // 各グループのツリー幅と幅を取得
      final List<double> groupTreeWidths = paths
          .map((path) => testContainer.read(groupManagerProvider(path)).treeWidth)
          .toList();
      final List<double> groupWidths = paths
          .map((path) => testContainer.read(groupManagerProvider(path)).width)
          .toList();

      // depth3のグループの計算ロジックを検証
      // 親の左端: parentX - (parentGroup.treeWidth / 2)
      // 自身のx: edgeX + offsetX + (myTreeWidth / 2) - myWidth / 2
      final double parentCenterX = parentLocation.centerX;
      final double edgeX = parentCenterX - (parentGroup.treeWidth / 2);

      double offsetX = 0;
      for (int i = 0; i < paths.length; i++) {
        final double expectedX = edgeX + offsetX + (groupTreeWidths[i] / 2) - (groupWidths[i] / 2);
        expect(groupLocates[i].x, expectedX,
            reason: 'depth3グループ $i の x 座標が期待値と一致する必要があります');
        offsetX += groupTreeWidths[i];
      }
    });

    test('左端を正しく取得できるか', () {
      // テスト対象のパス
      final NodePath testPath = NodePath(path: [1]);
      final GroupLocation locate = testContainer.read(
        groupLocationManagerProvider(testPath),
      );
      final double padding = 20.0; // TreeSettingsで定義されたgroupPadding

      // leftEdgeXはx座標 + paddingで計算される
      final double expectedLeftEdgeX = locate.x + padding;

      // leftEdgeXが正しく計算されていることを確認
      expect(locate.leftEdgeX, expectedLeftEdgeX,
          reason: '左端位置がグループの位置にパディングを加えて計算される必要があります');
    });
  });
}
