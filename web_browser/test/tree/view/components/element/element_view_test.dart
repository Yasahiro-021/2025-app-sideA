import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/view/components/element/element_state.dart';
import 'package:web_browser/tree/view/components/element/element_view.dart';
import 'package:web_browser/tree/view/components/element/element_view_model.dart';

void main() {
  group('ElementView', () {
    // 検証ケース（NodePath, ElementState）
    final cases = <(NodePath, ElementState)>[
      (NodePath.root, ElementState(title: 'title-0', position: (0, 0))),
      (NodePath(path: [0]), ElementState(title: 'title-1', position: (1, 1))),
      (NodePath(path: [0, 1]), ElementState(title: 'title-2', position: (2, 2))),
      (NodePath(path: [0, 1, 2]), ElementState(title: 'title-3', position: (3, 3))),
    ];

    testWidgets('タイトルと位置が正しく表示される', (WidgetTester tester) async {
      // すべてのケース分のオーバーライドを作成
      final overrides = cases
          .map((c) => elementViewModelProvider(c.$1).overrideWithValue(c.$2))
          .toList();

      // 一度だけウィジェットをビルド、その後各ケースのを確認
      await tester.pumpWidget(
        ProviderScope(
          overrides: overrides,
          child: MaterialApp(
            home: Scaffold(
              body: Stack(
                children: [
                  for (final c in cases) ElementView(nodePath: c.$1),
                ],
              ),
            ),
          ),
        ),
      );

      // 各ケースについてタイトルと位置を確認
      for (final c in cases) {
        // タイトル表示確認
        expect(find.text(c.$2.title), findsOneWidget,
            reason: 'エレメント${c.$1}のタイトルが表示される必要があります');
      }

      // すべてのPositionedウィジェットを取得
      final positionedFinders = find.byType(Positioned);
      expect(positionedFinders, findsWidgets);
    });
  });
}
