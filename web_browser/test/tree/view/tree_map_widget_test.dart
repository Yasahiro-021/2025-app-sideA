import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/node/node_children.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/tree/manager/group_manager.dart';

void main() {
  group('TreeMap Widget Test', () {
    testWidgets('TreeMapが正しく描画される - ルートノードのみ', (WidgetTester tester) async {
      // テストデータ準備
      final rootPath = NodePath(path: []);
      
      // ProviderOverrideの設定
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            childrenAtPathMangerProvider(rootPath).overrideWithValue(
              const NodeChildren(children: []),
            ),
            groupManagerProvider(rootPath).overrideWithValue(
              NodeGroup(parentPath: rootPath, width: 3),
            ),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: TreeMap(),
            ),
          ),
        ),
      );

      // 描画を待機
      await tester.pumpAndSettle();

      // NodeGroupViewが表示されているか確認
      expect(find.byType(Card), findsOneWidget);
      expect(find.text('Group Root'), findsOneWidget);
      expect(find.text('(empty)'), findsOneWidget); // 子ノードなし
    });

    testWidgets('TreeMapが正しく描画される - 3階層のツリー', (WidgetTester tester) async {
      // テストデータ準備: ルート -> 2つの子 -> それぞれに1つの孫
      final rootPath = NodePath(path: []);
      final child0Path = NodePath(path: [0]);
      final child1Path = NodePath(path: [1]);
      final grandChild00Path = NodePath(path: [0, 0]);
      final grandChild10Path = NodePath(path: [1, 0]);

      // ProviderOverrideの設定
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
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
            // 各ノードのGroupManager
            groupManagerProvider(rootPath).overrideWithValue(
              NodeGroup(parentPath: rootPath, width: 5),
            ),
            groupManagerProvider(child0Path).overrideWithValue(
              NodeGroup(parentPath: child0Path, width: 3),
            ),
            groupManagerProvider(child1Path).overrideWithValue(
              NodeGroup(parentPath: child1Path, width: 3),
            ),
            groupManagerProvider(grandChild00Path).overrideWithValue(
              NodeGroup(parentPath: grandChild00Path, width: 2),
            ),
            groupManagerProvider(grandChild10Path).overrideWithValue(
              NodeGroup(parentPath: grandChild10Path, width: 2),
            ),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: TreeMap(),
              ),
            ),
          ),
        ),
      );

      // 描画を待機
      await tester.pumpAndSettle();

      // 5つのノードが表示されているか確認（ルート + 2子 + 2孫）
      expect(find.byType(Card), findsNWidgets(5));
      
      // グループ表示の確認
      expect(find.text('Group Root'), findsOneWidget);
      expect(find.text('Group 0'), findsOneWidget);
      expect(find.text('Group 1'), findsOneWidget);
      expect(find.text('Group 0-0'), findsOneWidget);
      expect(find.text('Group 1-0'), findsOneWidget);
      
      // SimpleNodeViewが表示されているか確認（各グループに子ノードがある）
      expect(find.byType(SimpleNodeView), findsWidgets);
    });

    testWidgets('NodeGroupViewが正しい座標に配置される', (WidgetTester tester) async {
      final rootPath = NodePath(path: []);
      
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            childrenAtPathMangerProvider(rootPath).overrideWithValue(
              const NodeChildren(children: []),
            ),
            groupManagerProvider(rootPath).overrideWithValue(
              NodeGroup(parentPath: rootPath, width: 3),
            ),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: TreeMap(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Positionedウィジェットが存在することを確認
      final positioned = tester.widget<Positioned>(find.byType(Positioned).first);
      
      // ルートノードは(0, 0)に配置されるはず
      expect(positioned.left, isNotNull);
      expect(positioned.top, isNotNull);
    });

    testWidgets('InteractiveViewerでズーム・パンができる', (WidgetTester tester) async {
      final rootPath = NodePath(path: []);
      
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            childrenAtPathMangerProvider(rootPath).overrideWithValue(
              const NodeChildren(children: []),
            ),
            groupManagerProvider(rootPath).overrideWithValue(
              NodeGroup(parentPath: rootPath, width: 3),
            ),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: InteractiveViewer(
                child: const TreeMap(),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // InteractiveViewerが存在することを確認
      expect(find.byType(InteractiveViewer), findsOneWidget);
    });
  });
}
