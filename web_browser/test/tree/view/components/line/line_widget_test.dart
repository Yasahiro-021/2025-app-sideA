import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/manager/line_manager.dart';
import 'package:web_browser/tree/view/components/line_painter/line_widget.dart';

void main() {
  group('LineWidget', () {
    // テストケースを定義（NodePath -> (start, end)）
    final testCases = <NodePath, (Offset, Offset)>{
      NodePath.root: (Offset(0, 0), Offset(100, 100)),
      NodePath(path: [0]): (Offset(50, 50), Offset(150, 150)),
      NodePath(path: [0, 1]): (Offset(10, 20), Offset(30, 1000)),
    };

    testWidgets('正しく作成されること', (WidgetTester tester) async {
      // オーバーライドを作成
      final overrides = testCases.entries
          .map((entry) =>
              lineManagerProvider(entry.key).overrideWithValue(entry.value))
          .toList();

      // テストの環境を構築し、LineWidgetを表示する
      await tester.pumpWidget(
        ProviderScope(
          overrides: overrides,
          child: MaterialApp(
            home: Scaffold(
              body: Stack(
                children: [
                  // 各テストケースに対してLineWidgetを作成
                  for (var path in testCases.keys) LineWidget(path: path),
                ],
              ),
            ),
          ),
        ),
      );

      // テストケースの数だけLineWidgetが作成されている
      final finder = find.byType(LineWidget);
      expect(
        finder,
        findsExactly(testCases.length),
        reason: '生成されたLineWidgetの数が正しくありません',
      );

      // 各LineWidgetが正しく描画されていることを確認
      final customPaintFinder = find.byType(CustomPaint);
      expect(
        customPaintFinder,
        findsWidgets,
        reason: 'CustomPaintが見つかる必要があります',
      );
    });
  });
}
