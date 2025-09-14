import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/node/mocked_node.dart';
import 'package:web_browser/tree_view/treeview.dart';

void main() {
  group('TreeView URL Display Tests', () {
    testWidgets('TreeViewがURL付きノードで正しく表示される', (WidgetTester tester) async {
      // URL付きモックノードでTreeViewを作成
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: TreeView.mockingNodeWithUrls(),
          ),
        ),
      );

      // TreeViewが正しく描画されることを確認
      expect(find.byType(TreeView), findsOneWidget);
      expect(find.text('Root'), findsOneWidget);
      
      // AppBarのタイトルが表示されることを確認  
      expect(find.text('Tree View'), findsOneWidget);
    });

    testWidgets('URLがキーワードに変換されて表示される', (WidgetTester tester) async {
      // URL付きモックノードでTreeViewを作成
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: TreeView.mockingNodeWithUrls(),
          ),
        ),
      );

      // Expandボタンを押してノードを展開
      await tester.tap(find.text('Expand'));
      await tester.pumpAndSettle();

      // URLが変換されたキーワードで表示されることを確認
      // 元のURL: https://github.com/flutter/flutter
      // 変換後: flutter@github.com
      expect(find.text('flutter@github.com'), findsOneWidget);
      
      // 元のURL: https://www.google.com
      // 変換後: google.com  
      expect(find.text('google.com'), findsOneWidget);
      
      // 元のURL: https://docs.flutter.dev/development
      // 変換後: development@docs.flutter.dev
      expect(find.text('development@docs.flutter.dev'), findsOneWidget);
      
      // 通常のテキストはそのまま表示される
      expect(find.text('Regular Node'), findsOneWidget);
    });
  });
}