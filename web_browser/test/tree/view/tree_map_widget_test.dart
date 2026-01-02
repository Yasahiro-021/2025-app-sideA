import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/node/browser_node.dart';
import 'package:web_browser/core/node/node_children.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/node/browser_node_from_path_notifier.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/tree/manager/group_manager.dart';
import 'package:web_browser/tree/manager/group_location_manager.dart';
import 'package:web_browser/tree/model/group.dart';
import 'package:web_browser/tree/model/group_location.dart';
import 'package:web_browser/tree/view/components/tree_map/tree_map_view.dart';
import 'package:web_browser/tree/view/tree_settengs_provider.dart';
import 'package:web_browser/tree/view/tree_settings.dart';

void main() {
  group('TreeMap Widget Test', () {
    testWidgets('TreeMapが正しく描画される - ルートノードのみ', (WidgetTester tester) async {
      // テストデータ準備
      final rootPath = NodePath.root;
      
      // ProviderOverrideの設定
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            childrenAtPathMangerProvider(rootPath).overrideWithValue(
              const NodeChildren(children: []),
            ),
            browserNodeFromPathProvider(rootPath).overrideWithValue(
              const BrowserNode(title: 'root', url: ''),
            ),
            groupManagerProvider(rootPath).overrideWithValue(
              Group(
                path: rootPath,
                elements: [],
                childrenGroup: [],
                width: 200,
                treeWidth: 200,
              ),
            ),
            groupLocationManagerProvider(rootPath).overrideWithValue(
              GroupLocation(x: 0, y: 0, centerX: 100, leftEdgeX: 10),
            ),
            treeSettingsProvider.overrideWithValue(
              TreeSettings(
                elementWidth: 100,
                elementPadding: 8,
                groupPadding: 20.0,
                layerHeight: 100.0,
                groupVerticalSpacing: 50.0,
                maxScale: 5.0,
                minScale: 0.1,
              ),
            ),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: TreeMapView(),
            ),
          ),
        ),
      );

      // 描画を待機
      await tester.pumpAndSettle();

      // TreeMapViewが描画されていることを確認
      expect(find.byType(TreeMapView), findsOneWidget);
      
      // GroupViewが表示されていることを確認
      expect(find.byType(Stack), findsWidgets);
    });

    testWidgets('TreeMapが3階層のツリーを描画する', (WidgetTester tester) async {
      // テストデータ準備: ルート -> 2つの子 -> それぞれに1つの孫
      final rootPath = NodePath.root;
      final child0Path = NodePath(path: [0]);
      final child1Path = NodePath(path: [1]);
      final grandChild00Path = NodePath(path: [0, 0]);
      final grandChild10Path = NodePath(path: [1, 0]);

      final baseOverrides = [
        // ルートノードの子
        childrenAtPathMangerProvider(rootPath).overrideWithValue(
          NodeChildren(children: [child0Path, child1Path]),
        ),
        // 子ノード0の子
        childrenAtPathMangerProvider(child0Path).overrideWithValue(
          NodeChildren(children: [grandChild00Path]),
        ),
        // 子ノード1の子
        childrenAtPathMangerProvider(child1Path).overrideWithValue(
          NodeChildren(children: [grandChild10Path]),
        ),
        // 孫ノードは子なし
        childrenAtPathMangerProvider(grandChild00Path).overrideWithValue(
          const NodeChildren(children: []),
        ),
        childrenAtPathMangerProvider(grandChild10Path).overrideWithValue(
          const NodeChildren(children: []),
        ),
        // ノード情報のモック
        browserNodeFromPathProvider(rootPath).overrideWithValue(
          const BrowserNode(title: 'root', url: ''),
        ),
        browserNodeFromPathProvider(child0Path).overrideWithValue(
          const BrowserNode(title: 'child0', url: ''),
        ),
        browserNodeFromPathProvider(child1Path).overrideWithValue(
          const BrowserNode(title: 'child1', url: ''),
        ),
        browserNodeFromPathProvider(grandChild00Path).overrideWithValue(
          const BrowserNode(title: 'grandChild00', url: ''),
        ),
        browserNodeFromPathProvider(grandChild10Path).overrideWithValue(
          const BrowserNode(title: 'grandChild10', url: ''),
        ),
        // 各ノードのGroupManager
        groupManagerProvider(rootPath).overrideWithValue(
          Group(
            path: rootPath,
            elements: [child0Path, child1Path],
            childrenGroup: [],
            width: 240,
            treeWidth: 240,
          ),
        ),
        groupManagerProvider(child0Path).overrideWithValue(
          Group(
            path: child0Path,
            elements: [grandChild00Path],
            childrenGroup: [],
            width: 120,
            treeWidth: 120,
          ),
        ),
        groupManagerProvider(child1Path).overrideWithValue(
          Group(
            path: child1Path,
            elements: [grandChild10Path],
            childrenGroup: [],
            width: 120,
            treeWidth: 120,
          ),
        ),
        groupManagerProvider(grandChild00Path).overrideWithValue(
          Group(
            path: grandChild00Path,
            elements: [],
            childrenGroup: [],
            width: 120,
            treeWidth: 120,
          ),
        ),
        groupManagerProvider(grandChild10Path).overrideWithValue(
          Group(
            path: grandChild10Path,
            elements: [],
            childrenGroup: [],
            width: 120,
            treeWidth: 120,
          ),
        ),
        // 位置情報
        groupLocationManagerProvider(rootPath).overrideWithValue(
          GroupLocation(x: 0, y: 0, centerX: 120, leftEdgeX: 20),
        ),
        groupLocationManagerProvider(child0Path).overrideWithValue(
          GroupLocation(x: 0, y: 150, centerX: 60, leftEdgeX: 20),
        ),
        groupLocationManagerProvider(child1Path).overrideWithValue(
          GroupLocation(x: 120, y: 150, centerX: 180, leftEdgeX: 140),
        ),
        groupLocationManagerProvider(grandChild00Path).overrideWithValue(
          GroupLocation(x: 0, y: 300, centerX: 60, leftEdgeX: 20),
        ),
        groupLocationManagerProvider(grandChild10Path).overrideWithValue(
          GroupLocation(x: 120, y: 300, centerX: 180, leftEdgeX: 140),
        ),
        // TreeSettings
        treeSettingsProvider.overrideWithValue(
          TreeSettings(
            elementWidth: 100,
            elementPadding: 8,
            groupPadding: 20.0,
            layerHeight: 100.0,
            groupVerticalSpacing: 50.0,
            maxScale: 5.0,
            minScale: 0.1,
          ),
        ),
      ];

      // ProviderOverrideの設定
      await tester.pumpWidget(
        ProviderScope(
          overrides: baseOverrides,
          child: const MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: TreeMapView(),
              ),
            ),
          ),
        ),
      );

      // 描画を待機
      await tester.pumpAndSettle();

      // TreeMapViewが描画されていることを確認
      expect(find.byType(TreeMapView), findsOneWidget);
      
      // 複数のStackが存在することを確認（複数のグループビュー）
      expect(find.byType(Stack), findsWidgets);
    });
  });
}
